// The in-app Narwhal update (lib/update/apk_installer.dart): the download, the
// digest, the free-space gate, and the typed answer from Android's side.
//
// No device and no network: the HTTP seam is faked with a byte stream into a
// temporary directory, and the channel is a mock handler.

import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:dsh_app/update/apk_installer.dart';
import 'package:dsh_app/update/downloader.dart' show CancelToken;
import 'package:dsh_app/update/self_release.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support.dart';

/// The bytes of a "package" in these tests: small, but not trivially repeating.
final apkBytes = List<int>.generate(32 * 1024, (i) => i % 251);

/// One chunk of [apkBytes]: a few pieces, not 32k of them.
Route apkRoute(List<int> bytes) => fileRoute(bytes, chunk: 4 * 1024);

String digestOf(List<int> bytes) => sha256.convert(bytes).toString();

Future<String> hashFile(File file) async => sha256.convert(await file.readAsBytes()).toString();

const releaseTag = 'v1.1.0-narwhal';
const assetName = 'narwhal-1.1.0-arm64.apk';

Uri get assetUrl => Uri.parse('https://github.com/rukazax/narwhal/releases/download/$releaseTag/$assetName');

SelfRelease releaseWith({String? digest, int? size, Uri? url, String name = assetName}) => SelfRelease(
  version: SelfReleaseVersion.tryParse(releaseTag)!,
  tag: releaseTag,
  assets: [SelfReleaseAsset(name: name, size: size ?? apkBytes.length, sha256: digest, url: url ?? assetUrl)],
);

class FakePlatform implements ApkInstallPlatform {
  FakePlatform({this.allowsInstall = true, this.free = 8 << 30, this.startStatus = ApkInstallStartStatus.started});

  bool allowsInstall;

  /// Free bytes the native side reports; null = it wouldn't say.
  int? free;
  ApkInstallStartStatus startStatus;
  bool settingsPageOpens = true;

  /// Paths handed to the installer, in order.
  final starts = <String>[];
  int settingsOpened = 0;

  @override
  Future<bool> canInstall() async => allowsInstall;

  @override
  Future<bool> openInstallSettings() async {
    settingsOpened++;
    return settingsPageOpens;
  }

  @override
  Future<int?> freeBytes() async => free;

  @override
  Future<ApkInstallStart> start(String path) async {
    starts.add(path);
    return ApkInstallStart(startStatus, startStatus == ApkInstallStartStatus.failed ? 'no_handler' : null);
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory dir;
  late FakePlatform platform;
  late FakeHttp http;

  setUp(() {
    dir = Directory.systemTemp.createTempSync('narwhal-update');
    platform = FakePlatform();
    http = FakeHttp();
  });
  tearDown(() => dir.deleteSync(recursive: true));

  SelfUpdateInstaller installer({int maxBytes = maxSelfApkBytes}) =>
      SelfUpdateInstaller(http: http, platform: platform, directory: () async => dir, hasher: hashFile, maxBytes: maxBytes);

  File cached(String name) => File('${dir.path}/$name');

  group('download, verify, hand-off', () {
    test('a verified package goes to the installer, whole and under its asset name', () async {
      final release = releaseWith(digest: digestOf(apkBytes));
      http.routes[assetUrl.toString()] = apkRoute(apkBytes);
      final progress = <SelfUpdateProgress>[];

      final outcome = await installer().install(
        release: release,
        asset: release.assets.single,
        onProgress: progress.add,
      );

      expect(outcome, isA<SelfUpdateStarted>());
      expect(await cached(assetName).readAsBytes(), apkBytes);
      expect(platform.starts, [cached(assetName).path]);
      expect(progress, isNotEmpty);
      expect(progress.last.received, apkBytes.length);
      expect(progress.last.total, apkBytes.length);
    });

    test('a digest mismatch is refused, the file dropped and nothing installed', () async {
      final release = releaseWith(digest: digestOf(const [1, 2, 3]));
      http.routes[assetUrl.toString()] = apkRoute(apkBytes);

      final outcome = await installer().install(release: release, asset: release.assets.single);

      expect(outcome, isA<SelfUpdateFailed>());
      expect((outcome as SelfUpdateFailed).failure, SelfUpdateFailure.checksum);
      expect(platform.starts, isEmpty);
      expect(cached(assetName).existsSync(), isFalse);
    });

    test('a release without a digest is installed without the check', () async {
      final release = releaseWith(digest: null);
      http.routes[assetUrl.toString()] = apkRoute(apkBytes);

      final outcome = await installer().install(release: release, asset: release.assets.single);

      expect(outcome, isA<SelfUpdateStarted>());
      expect(await cached(assetName).readAsBytes(), apkBytes);
    });

    test('the URL is the asset\'s own, or built from the tag when the answer had none', () async {
      final release = releaseWith(digest: digestOf(apkBytes), url: null);
      http.routes[assetUrl.toString()] = apkRoute(apkBytes);

      final outcome = await installer().install(release: release, asset: release.assets.single);

      expect(outcome, isA<SelfUpdateStarted>());
      expect(http.urls, [assetUrl.toString()]);
    });

    test('a download that never arrives fails as a network problem', () async {
      final release = releaseWith(digest: digestOf(apkBytes));
      // No route: FakeHttp refuses like an unreachable host.

      final outcome = await installer().install(release: release, asset: release.assets.single);

      expect(outcome, isA<SelfUpdateFailed>());
      expect((outcome as SelfUpdateFailed).failure, SelfUpdateFailure.network);
      expect(platform.starts, isEmpty);
    });

    test('cancelling stops the download before it starts', () async {
      final release = releaseWith(digest: digestOf(apkBytes));
      http.routes[assetUrl.toString()] = apkRoute(apkBytes);
      final cancel = CancelToken()..cancel();

      final outcome = await installer().install(release: release, asset: release.assets.single, cancel: cancel);

      expect(outcome, isA<SelfUpdateCancelled>());
      expect(http.requests, isEmpty);
      expect(platform.starts, isEmpty);
    });

    test('an installer that would not open is a typed install failure', () async {
      platform.startStatus = ApkInstallStartStatus.failed;
      final release = releaseWith(digest: digestOf(apkBytes));
      http.routes[assetUrl.toString()] = apkRoute(apkBytes);

      final outcome = await installer().install(release: release, asset: release.assets.single);

      expect(outcome, isA<SelfUpdateFailed>());
      expect((outcome as SelfUpdateFailed).failure, SelfUpdateFailure.install);
      expect(platform.starts, hasLength(1));
    });

    test('the installer saying "no permission" is not a download failure', () async {
      platform.startStatus = ApkInstallStartStatus.permissionRequired;
      final release = releaseWith(digest: digestOf(apkBytes));
      http.routes[assetUrl.toString()] = apkRoute(apkBytes);

      final outcome = await installer().install(release: release, asset: release.assets.single);

      expect(outcome, isA<SelfUpdateNeedsPermission>());
      // The package is kept: turning the switch on doesn't download it again.
      expect(cached(assetName).existsSync(), isTrue);
    });
  });

  group('before a byte is spent', () {
    test('a package over the cap is refused', () async {
      final release = releaseWith(digest: digestOf(apkBytes), size: maxSelfApkBytes + 1);

      final outcome = await installer().install(release: release, asset: release.assets.single);

      expect(outcome, isA<SelfUpdateFailed>());
      expect((outcome as SelfUpdateFailed).failure, SelfUpdateFailure.tooLarge);
      expect(http.requests, isEmpty);
    });

    test('not enough room is refused before the download', () async {
      platform.free = 1024;
      final release = releaseWith(digest: digestOf(apkBytes));
      http.routes[assetUrl.toString()] = apkRoute(apkBytes);

      final outcome = await installer().install(release: release, asset: release.assets.single);

      expect(outcome, isA<SelfUpdateFailed>());
      expect((outcome as SelfUpdateFailed).failure, SelfUpdateFailure.noSpace);
      expect(http.requests, isEmpty);
    });

    test('unknown free space does not block the download', () async {
      platform.free = null;
      final release = releaseWith(digest: digestOf(apkBytes));
      http.routes[assetUrl.toString()] = apkRoute(apkBytes);

      expect(await installer().install(release: release, asset: release.assets.single), isA<SelfUpdateStarted>());
    });

    test('"install unknown apps" off ends the attempt without a download', () async {
      platform.allowsInstall = false;
      final release = releaseWith(digest: digestOf(apkBytes));

      final outcome = await installer().install(release: release, asset: release.assets.single);

      expect(outcome, isA<SelfUpdateNeedsPermission>());
      expect(http.requests, isEmpty);
      expect(platform.starts, isEmpty);
    });
  });

  group('the channel\'s typed answers', () {
    test('every status the native side can send is read, and anything else is a failure', () {
      expect(ApkInstallStart.fromMap({'status': 'started'}).status, ApkInstallStartStatus.started);
      expect(
        ApkInstallStart.fromMap({'status': 'permissionRequired'}).status,
        ApkInstallStartStatus.permissionRequired,
      );
      final failed = ApkInstallStart.fromMap({'status': 'failed', 'reason': 'no_handler'});
      expect(failed.status, ApkInstallStartStatus.failed);
      expect(failed.reason, 'no_handler');
      // A channel that answers nothing usable must not be read as success.
      expect(ApkInstallStart.fromMap(null).status, ApkInstallStartStatus.failed);
      expect(ApkInstallStart.fromMap({'status': 'whatever'}).status, ApkInstallStartStatus.failed);
    });

    test('the platform talks to `dsh/update` with the documented method names', () async {
      final calls = <String>[];
      final installed = <String>[];
      var canInstallAnswer = true;
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
        ChannelApkInstallPlatform.channel,
        (call) async {
          calls.add(call.method);
          switch (call.method) {
            case 'canRequestInstalls':
              return canInstallAnswer;
            case 'openInstallPermission':
              return true;
            case 'info':
              return {'versionName': '1.0.2', 'freeBytes': 1 << 31};
            case 'installApk':
              installed.add((call.arguments as Map)['path'] as String);
              canInstallAnswer = false;
              return {'status': 'started'};
          }
          return null;
        },
      );
      addTearDown(
        () => TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
          ChannelApkInstallPlatform.channel,
          null,
        ),
      );

      const platform = ChannelApkInstallPlatform();
      expect(await platform.canInstall(), isTrue);
      expect(await platform.openInstallSettings(), isTrue);
      expect(await platform.freeBytes(), 1 << 31);
      final start = await platform.start('/data/cache/updates/x.apk');
      expect(start.status, ApkInstallStartStatus.started);
      expect(installed, ['/data/cache/updates/x.apk']);
      expect(calls, ['canRequestInstalls', 'openInstallPermission', 'info', 'installApk']);
    });

    test('a channel that isn\'t there throws, which the installer turns into a typed answer', () async {
      // No mock handler at all: calls fail like they would without the plugin.
      const platform = ChannelApkInstallPlatform();
      await expectLater(platform.canInstall(), throwsA(isA<MissingPluginException>()));
      await expectLater(platform.freeBytes(), throwsA(isA<MissingPluginException>()));
      await expectLater(platform.start('/nowhere.apk'), throwsA(isA<MissingPluginException>()));

      final release = releaseWith(digest: digestOf(apkBytes));
      final installer = SelfUpdateInstaller(
        http: http,
        platform: const _BrokenPlatform(),
        directory: () async => dir,
        hasher: hashFile,
      );
      // Nothing can be installed without the native side, and nothing is downloaded first.
      expect(await installer.install(release: release, asset: release.assets.single), isA<SelfUpdateNeedsPermission>());
      expect(http.requests, isEmpty);
    });
  });
}

/// A platform whose every answer fails, as on a build without the plugin.
class _BrokenPlatform implements ApkInstallPlatform {
  const _BrokenPlatform();

  @override
  Future<bool> canInstall() async => throw MissingPluginException('no dsh/update');

  @override
  Future<bool> openInstallSettings() async => throw MissingPluginException('no dsh/update');

  @override
  Future<int?> freeBytes() async => throw MissingPluginException('no dsh/update');

  @override
  Future<ApkInstallStart> start(String path) async => throw MissingPluginException('no dsh/update');
}
