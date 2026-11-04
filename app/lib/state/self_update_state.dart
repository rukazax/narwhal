// The in-app update of a Narwhal build: the state the About row and its sheet
// show while the APK is downloaded, checked and handed to Android's installer
// (lib/update/apk_installer.dart).
//
// Only the person starts this: the weekly release check (self_release.dart)
// marks "Доступна <version>" and nothing else.

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../update/apk_installer.dart';
import '../update/downloader.dart' show CancelToken;
import '../update/self_release.dart';

enum SelfUpdatePhase {
  /// Nothing started.
  idle,

  /// Bytes are arriving; [SelfUpdateState.received] and
  /// [SelfUpdateState.total] say how far.
  downloading,

  /// The file is complete and is being hashed against the release's digest.
  verifying,

  /// Android forbids installs from this app until the switch is turned on.
  needsPermission,

  /// The system installer is open; the person confirms there.
  opened,

  /// Stopped with a [SelfUpdateState.failure].
  failed,
}

class SelfUpdateState {
  const SelfUpdateState({this.phase = SelfUpdatePhase.idle, this.received = 0, this.total, this.failure});

  final SelfUpdatePhase phase;
  final int received;
  final int? total;
  final SelfUpdateFailure? failure;

  /// Work in flight: the sheet can't be confirmed again, and the row shows how
  /// far it has got.
  bool get busy => phase == SelfUpdatePhase.downloading || phase == SelfUpdatePhase.verifying;

  /// 0…1, or null while the total isn't known.
  double? get fraction => total == null || total! <= 0 ? null : (received / total!).clamp(0.0, 1.0);

  SelfUpdateState copyWith({
    SelfUpdatePhase? phase,
    int? received,
    int? Function()? total,
    SelfUpdateFailure? Function()? failure,
  }) => SelfUpdateState(
    phase: phase ?? this.phase,
    received: received ?? this.received,
    total: total == null ? this.total : total(),
    failure: failure == null ? this.failure : failure(),
  );
}

class SelfUpdateController extends Notifier<SelfUpdateState> {
  CancelToken? _cancel;

  /// Bumped on every start and reset, so a run that lost its turn doesn't
  /// write into the state of a later one.
  int _run = 0;

  @override
  SelfUpdateState build() {
    ref.onDispose(() => _cancel?.cancel());
    return const SelfUpdateState();
  }

  /// Starts the confirmed update of [release]'s [asset]. A no-op while another
  /// run is in flight (the sheet's button is disabled then).
  Future<void> start(SelfRelease release, SelfReleaseAsset asset) async {
    if (state.busy) return;
    final run = ++_run;
    bool owns() => ref.mounted && run == _run;
    final cancel = _cancel = CancelToken();
    state = SelfUpdateState(phase: SelfUpdatePhase.downloading, total: asset.size);
    final outcome = await ref.read(selfUpdateInstallerProvider).install(
      release: release,
      asset: asset,
      cancel: cancel,
      onProgress: (progress) {
        if (!owns()) return;
        state = state.copyWith(received: progress.received, total: () => progress.total);
      },
      onVerifying: () {
        if (owns()) state = state.copyWith(phase: SelfUpdatePhase.verifying);
      },
    );
    if (!owns()) return;
    _cancel = null;
    state = switch (outcome) {
      SelfUpdateStarted() => const SelfUpdateState(phase: SelfUpdatePhase.opened),
      SelfUpdateNeedsPermission() => const SelfUpdateState(phase: SelfUpdatePhase.needsPermission),
      SelfUpdateCancelled() => const SelfUpdateState(),
      SelfUpdateFailed(:final failure) => SelfUpdateState(phase: SelfUpdatePhase.failed, failure: failure),
    };
  }

  /// Stops a download; the state goes back to [SelfUpdatePhase.idle].
  void cancel() {
    _cancel?.cancel();
    reset();
  }

  /// Back to the start, as if nothing had been tried.
  void reset() {
    _run++;
    _cancel = null;
    if (ref.mounted) state = const SelfUpdateState();
  }

  /// Opens Android's "install unknown apps" page for this app; false when the
  /// ROM has no such page (or nothing opened).
  Future<bool> openInstallSettings() async {
    try {
      return await ref.read(apkInstallPlatformProvider).openInstallSettings();
    } on Object {
      return false;
    }
  }
}

final selfUpdateProvider = NotifierProvider<SelfUpdateController, SelfUpdateState>(SelfUpdateController.new);
