import 'package:dsh_app/update/self_release.dart';
import 'package:flutter_test/flutter_test.dart';

SelfRelease _release(List<String> names) => parseSelfRelease({
      'tag_name': 'v1.1.0-narwhal',
      'html_url': 'https://github.com/rukazax/narwhal/releases/tag/v1.1.0-narwhal',
      'published_at': '2026-11-05T00:00:00Z',
      'assets': [
        for (final name in names)
          {'name': name, 'size': 1, 'browser_download_url': 'https://example.test/$name'},
      ],
    });

void main() {
  group('per-ABI asset selection', () {
    test('a one-APK release is returned as is for any ABI', () {
      final release = _release(['narwhal-1.1.0-arm64.apk']);
      for (final abi in [null, 'arm64', 'x86_64', 'arm']) {
        expect(release.apkFor(abi)?.name, 'narwhal-1.1.0-arm64.apk', reason: '$abi');
      }
    });

    test('arm64 picks the arm64-v8a build among several', () {
      final release = _release([
        'narwhal-1.1.0-arm64-v8a.apk',
        'narwhal-1.1.0-armeabi-v7a.apk',
        'narwhal-1.1.0-x86_64.apk',
      ]);
      expect(release.apkFor('arm64')?.name, 'narwhal-1.1.0-arm64-v8a.apk');
      expect(release.apkFor('arm')?.name, 'narwhal-1.1.0-armeabi-v7a.apk');
      expect(release.apkFor('x86_64')?.name, 'narwhal-1.1.0-x86_64.apk');
      expect(release.apkFor('x86')?.name, 'narwhal-1.1.0-armeabi-v7a.apk');
    });

    test('a name without an ABI token wins when the ABI is unknown', () {
      final release = _release([
        'narwhal-1.1.0-arm64-v8a.apk',
        'narwhal-1.1.0-universal.apk',
      ]);
      expect(release.apkFor(null)?.name, 'narwhal-1.1.0-universal.apk');
      expect(release.apkFor('mips')?.name, 'narwhal-1.1.0-universal.apk');
    });

    test('falls back to the first APK when nothing matches', () {
      final release = _release(['first-x86.apk', 'second-arm64-v8a.apk']);
      expect(release.apkFor('arm64')?.name, 'second-arm64-v8a.apk');
      expect(release.apkFor('riscv64')?.name, 'first-x86.apk');
    });

    test('a release without APKs has no installable asset', () {
      final release = _release([]);
      expect(release.apkFor('arm64'), isNull);
      expect(release.apk, isNull);
    });
  });
}
