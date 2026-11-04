// Installing a newer Narwhal release from inside the app.
//
// The APK of the release is streamed into the app's cache, checked against the
// SHA-256 digest GitHub publishes for the asset, and handed to Android's own
// package installer through a FileProvider `content://` URI (update/UpdatePlugin.kt,
// update/ApkInstaller.startInstall). The system shows its confirmation, installs
// the package over this one (same signing key) and restarts the app.
//
// Nothing here starts by itself. The weekly check (self_release.dart) only
// reports; the download begins after the person confirms in
// ui/update/self_release_sheet.dart, and every failure comes back typed so the
// sheet can say what went wrong in the app's language.
//
// A GitHub release asset is public: its URL carries no token, and nothing here
// logs the URL or the file.

import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import 'downloader.dart';
import 'self_release.dart';
import 'update_config.dart';
import 'update_http.dart';

/// The largest APK this will fetch. A Narwhal build is ~180 MB; anything past
/// this is not what we think we're downloading.
const maxSelfApkBytes = 400 * 1024 * 1024;

/// Room beyond the file itself: the system copies the APK while installing it.
const _spareBytes = 64 * 1024 * 1024;

/// Why an update didn't happen. Text in ui/update/self_release_sheet.dart.
enum SelfUpdateFailure {
  /// The download never completed: no connection, DNS, timeout, a 4xx/5xx.
  network,

  /// Not enough room to download the package and install it.
  noSpace,

  /// The asset is bigger than [maxSelfApkBytes].
  tooLarge,

  /// The downloaded bytes don't hash to the release's digest: refused.
  checksum,

  /// The system installer wouldn't start (or isn't there at all).
  install,
}

class SelfUpdateProgress {
  const SelfUpdateProgress({required this.received, required this.total});

  final int received;

  /// Bytes expected; null when the release didn't say.
  final int? total;

  /// 0…1, or null when the total isn't known.
  double? get fraction => total == null || total! <= 0 ? null : (received / total!).clamp(0.0, 1.0);
}

/// What came of a confirmed update.
sealed class SelfUpdateOutcome {
  const SelfUpdateOutcome();
}

/// The system installer opened: the person confirms there.
final class SelfUpdateStarted extends SelfUpdateOutcome {
  const SelfUpdateStarted();
}

/// The download is done (or wasn't needed yet) but Android forbids installing
/// from this app: the sheet offers the settings page.
final class SelfUpdateNeedsPermission extends SelfUpdateOutcome {
  const SelfUpdateNeedsPermission();
}

final class SelfUpdateCancelled extends SelfUpdateOutcome {
  const SelfUpdateCancelled();
}

final class SelfUpdateFailed extends SelfUpdateOutcome {
  const SelfUpdateFailed(this.failure);

  final SelfUpdateFailure failure;
}

/// How a hand-off to the system installer went (`dsh/update`, `installApk`).
enum ApkInstallStartStatus {
  /// The installer's window is open; the person confirms there.
  started,

  /// `canRequestPackageInstalls()` is false: nothing was started.
  permissionRequired,

  /// The installer wouldn't start; see [ApkInstallStart.reason].
  failed,
}

class ApkInstallStart {
  const ApkInstallStart(this.status, [this.reason]);

  factory ApkInstallStart.fromMap(Map<Object?, Object?>? map) {
    final status = switch (map?['status']) {
      'started' => ApkInstallStartStatus.started,
      'permissionRequired' => ApkInstallStartStatus.permissionRequired,
      _ => ApkInstallStartStatus.failed,
    };
    return ApkInstallStart(status, map?['reason'] as String?);
  }

  final ApkInstallStartStatus status;

  /// The native reason for [ApkInstallStartStatus.failed]: `no_file`,
  /// `no_handler`, `error`. For logs, not for people.
  final String? reason;

  @override
  String toString() => 'ApkInstallStart(${status.name}${reason == null ? '' : ', $reason'})';
}

/// What Android's side of an update offers. A seam: tests fake it, so no
/// device is needed to drive the whole flow.
abstract interface class ApkInstallPlatform {
  /// The per-app "install unknown apps" switch (always true below API 26).
  Future<bool> canInstall();

  /// Opens that switch for this app; false when this ROM has no such page.
  Future<bool> openInstallSettings();

  /// Free bytes where the package is downloaded; null when unknown.
  Future<int?> freeBytes();

  /// The ABI this APK was built for (`arm64`, `x86_64`, …); null when unknown.
  Future<String?> abi();

  /// Hands the APK at [path] to the system installer.
  Future<ApkInstallStart> start(String path);
}

/// The real thing, over MethodChannel `dsh/update` (update/UpdatePlugin.kt).
class ChannelApkInstallPlatform implements ApkInstallPlatform {
  const ChannelApkInstallPlatform();

  static const channel = MethodChannel('dsh/update');

  @override
  Future<bool> canInstall() async => await channel.invokeMethod<bool>('canRequestInstalls') ?? false;

  @override
  Future<bool> openInstallSettings() async => await channel.invokeMethod<bool>('openInstallPermission') ?? false;

  @override
  Future<int?> freeBytes() async {
    final info = await channel.invokeMethod<Map<Object?, Object?>>('info');
    return (info?['freeBytes'] as num?)?.toInt();
  }

  @override
  Future<String?> abi() async {
    final info = await channel.invokeMethod<Map<Object?, Object?>>('info');
    return info?['abi'] as String?;
  }

  @override
  Future<ApkInstallStart> start(String path) async =>
      ApkInstallStart.fromMap(await channel.invokeMethod<Map<Object?, Object?>>('installApk', {'path': path}));
}

/// Downloads the APK of a newer release, checks it, and starts the installer.
class SelfUpdateInstaller {
  SelfUpdateInstaller({
    required this.http,
    required this.platform,
    required this.directory,
    this.hasher = sha256OfFile,
    this.maxBytes = maxSelfApkBytes,
  });

  final UpdateHttp http;

  /// The native side: permission, free space, and the hand-off.
  final ApkInstallPlatform platform;

  /// The cache directory the package lands in; the FileProvider's `updates/`
  /// root (res/xml/dsh_file_paths.xml) is the same place.
  final Future<Directory> Function() directory;
  final Sha256Hasher hasher;
  final int maxBytes;

  /// The package to install on this device: the release asset that names the
  /// running ABI, else a universal asset, else the first one.
  Future<SelfReleaseAsset?> resolveAsset(SelfRelease release) async =>
      release.apkFor(await platform.abi()) ?? release.apk;

  /// Downloads [asset] of [release] and hands it to the installer.
  /// [onProgress] is called as bytes arrive (and once with 0 before the
  /// first); [onVerifying] when the file is complete and is being hashed.
  /// [cancel] stops the download and leaves the partial file for the next try.
  Future<SelfUpdateOutcome> install({
    required SelfRelease release,
    required SelfReleaseAsset asset,
    void Function(SelfUpdateProgress progress)? onProgress,
    void Function()? onVerifying,
    CancelToken? cancel,
  }) async {
    final size = asset.size;
    if (size != null && size > maxBytes) return const SelfUpdateFailed(SelfUpdateFailure.tooLarge);
    if (size != null && !await _hasRoom(size)) return const SelfUpdateFailed(SelfUpdateFailure.noSpace);
    // Asked before a byte is spent: installing starts with this switch anyway.
    if (!await _canInstall()) return const SelfUpdateNeedsPermission();

    final Directory dir;
    try {
      dir = await directory();
    } on Object {
      return const SelfUpdateFailed(SelfUpdateFailure.noSpace);
    }

    // Enforced while streaming too, for an asset whose size the release
    // didn't state: the download is dropped the moment it passes the cap.
    var pastCap = false;
    final result = await ApkDownloader(http: http, directory: dir, hasher: hasher).download(
      fileName: _fileName(asset.name),
      sha256: asset.sha256,
      urls: [DownloadUrl(release.assetUrl(asset), mirrorId: 'github', label: 'GitHub')],
      expectedSize: size,
      onProgress: (progress) {
        if (progress.received > maxBytes) {
          pastCap = true;
          cancel?.cancel();
        }
        onProgress?.call(SelfUpdateProgress(received: progress.received, total: progress.total));
      },
      onVerifying: onVerifying,
      cancel: cancel,
    );
    if (pastCap) return const SelfUpdateFailed(SelfUpdateFailure.tooLarge);

    return switch (result) {
      DownloadCancelled() => const SelfUpdateCancelled(),
      DownloadFailed(:final failure) => SelfUpdateFailed(_failureFor(failure)),
      DownloadDone(:final file) => _start(file),
    };
  }

  /// Asks the installer to open; a channel that isn't there (a build without
  /// the plugin) is an install failure like any other.
  Future<SelfUpdateOutcome> _start(File file) async {
    try {
      final start = await platform.start(file.path);
      return switch (start.status) {
        ApkInstallStartStatus.started => const SelfUpdateStarted(),
        ApkInstallStartStatus.permissionRequired => const SelfUpdateNeedsPermission(),
        ApkInstallStartStatus.failed => const SelfUpdateFailed(SelfUpdateFailure.install),
      };
    } on Object {
      // PlatformException, MissingPluginException, a broken channel.
      return const SelfUpdateFailed(SelfUpdateFailure.install);
    }
  }

  /// Room for the package and the copy the system makes while installing it.
  Future<bool> _hasRoom(int size) async {
    final int? free;
    try {
      free = await platform.freeBytes();
    } on Object {
      // Unknown: let the download find out, as the original updater does.
      return true;
    }
    return free == null || free >= size * 2 + _spareBytes;
  }

  Future<bool> _canInstall() async {
    try {
      return await platform.canInstall();
    } on Object {
      return false;
    }
  }

  /// The asset's own name, never a path: it is what the file is called in the
  /// cache and what the release page offers.
  static String _fileName(String name) => name.split('/').last;

  static SelfUpdateFailure _failureFor(DownloadFailure failure) => switch (failure) {
    DownloadFailure.network || DownloadFailure.unavailable => SelfUpdateFailure.network,
    DownloadFailure.storage => SelfUpdateFailure.noSpace,
    DownloadFailure.checksum => SelfUpdateFailure.checksum,
  };
}

/// Android's side of the hand-off; tests override it.
final apkInstallPlatformProvider = Provider<ApkInstallPlatform>((ref) => const ChannelApkInstallPlatform());

/// Where the package is downloaded: the app cache under `updates/` — the one
/// directory the app's FileProvider hands to the installer.
final selfUpdateDirectoryProvider = Provider<Future<Directory> Function()>(
  (ref) => () async => Directory('${(await getTemporaryDirectory()).path}/updates'),
);

final selfUpdateInstallerProvider = Provider<SelfUpdateInstaller>(
  (ref) => SelfUpdateInstaller(
    http: ref.watch(selfReleaseHttpProvider),
    platform: ref.watch(apkInstallPlatformProvider),
    directory: ref.watch(selfUpdateDirectoryProvider),
  ),
);
