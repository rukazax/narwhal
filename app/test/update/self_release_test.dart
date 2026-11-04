// The fork's own release check (lib/update/self_release.dart): what GitHub
// answers is parsed and compared to the running build, the answer is cached for
// a week, and the automatic check gets a random moment of its own that a killed
// app still respects.

import 'dart:convert';
import 'dart:math';

import 'package:dsh_app/update/self_release.dart';
import 'package:dsh_app/update/update_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'support.dart';

Map<String, Object?> releaseJson(String tag, {List<Object?>? assets, String? published}) => {
  'tag_name': tag,
  'html_url': 'https://github.com/$selfRepo/releases/tag/$tag',
  'name': 'Narwhal $tag',
  'draft': false,
  'published_at': published ?? '2026-11-04T08:41:15Z',
  'assets': assets ?? const <Object>[],
};

Map<String, Object?> apkAsset({
  String name = 'narwhal-1.1.0-arm64.apk',
  int size = 191708210,
  String? digest = 'sha256:6b4749eb5116e69bb971b42fdfc7d7b5edcb729fb9b2c8e1942040331be298a0',
}) => {'name': name, 'size': size, 'digest': ?digest};

FakeHttp answering(String tag, {int status = 200, List<Object?>? assets, String? body}) => FakeHttp({
  selfLatestApi.toString(): (_, _) => textResponse(body ?? jsonEncode(releaseJson(tag, assets: assets)), status: status),
});

SelfReleaseVersion v(String raw) => SelfReleaseVersion.tryParse(raw)!;

Future<SharedPreferences> prefs() => SharedPreferences.getInstance();

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));

  group('parse', () {
    test('tag, page, published date and APK assets', () {
      final release = parseSelfRelease(
        decode(
          releaseJson(
            'v1.1.0-narwhal',
            assets: [
              apkAsset(digest: 'sha256:6B4749EB5116E69BB971B42FDFC7D7B5EDCB729FB9B2C8E1942040331BE298A0'),
              apkAsset(name: 'narwhal-1.1.0-x64.apk', digest: null),
              {'name': 'notes.txt', 'size': 12},
              {'name': 'narwhal-1.1.0-arm64.apk.sha256', 'size': 1},
            ],
          ),
        ),
      );
      expect(release.version.name, '1.1.0');
      expect(release.version.channel, 0);
      expect(release.tag, 'v1.1.0-narwhal');
      expect(release.label, '1.1.0-narwhal');
      expect(release.page.toString(), 'https://github.com/$selfRepo/releases/tag/v1.1.0-narwhal');
      expect(release.publishedAt, DateTime.utc(2026, 11, 4, 8, 41, 15));
      expect(release.assets.map((a) => a.name), ['narwhal-1.1.0-arm64.apk', 'narwhal-1.1.0-x64.apk']);
      expect(release.assets.first.size, 191708210);
      expect(release.assets.first.sha256, '6b4749eb5116e69bb971b42fdfc7d7b5edcb729fb9b2c8e1942040331be298a0');
      expect(release.assets.last.sha256, isNull, reason: 'no digest in the release');
    });

    test('a release without a page falls back to the releases page', () {
      final release = parseSelfRelease({'tag_name': 'v1.0.0-narwhal', 'assets': const <Object>[]});
      expect(release.page, selfReleasesPage);
    });

    test('drafts and unusable tags are not releases', () {
      for (final body in <Object?>[
        null,
        <String, Object?>{},
        {'tag_name': 'v1.0.0-narwhal', 'draft': true},
        {'tag_name': 'latest'},
        {'tag_name': 'release-1.0.0'},
      ]) {
        expect(() => parseSelfRelease(body), throwsFormatException, reason: '$body');
      }
    });
  });

  group('compare', () {
    final running = v('1.0.0-narwhal');

    test('newer, older, same', () {
      expect(v('v1.1.0-narwhal').isNewerThan(running), isTrue);
      expect(v('v2.0.0-narwhal').isNewerThan(running), isTrue);
      expect(v('v0.9.9-narwhal').isNewerThan(running), isFalse);
      expect(v('v1.0.0-narwhal').isNewerThan(running), isFalse);
      expect(v('v1.0.0-narwhal').compareTo(running), 0);
      // A missing patch reads as .0, a leading v is the tag.
      expect(v('v1.1').isNewerThan(running), isTrue);
    });

    test('the -narwhal suffix is a channel mark, not a pre-release', () {
      // 1.0.0-narwhal is the fork's build of 1.0.0, not something older.
      expect(v('v1.0.0').compareTo(running), 0);
      expect(v('v1.0.0').isNewerThan(running), isFalse);
      // The build number the installed APK carries doesn't decide it either.
      expect(v('v1.0.0-narwhal').isNewerThan(v('1.0.0-narwhal+10301234')), isFalse);
    });

    test('a real pre-release still sorts below its release', () {
      expect(v('v1.1.0-beta.1').isNewerThan(running), isTrue);
      expect(v('v1.0.0-beta.1').isNewerThan(running), isFalse);
      expect(v('v1.0.0-narwhal').isNewerThan(v('1.0.0-beta.1')), isTrue);
    });

    test('the fork build number decides between builds of one version', () {
      expect(v('v1.0.0-narwhal.2').isNewerThan(running), isTrue);
      expect(v('v1.0.0-narwhal.2').isNewerThan(v('1.0.0-narwhal.10')), isFalse);
      expect(v('v1.0.0-narwhal.2').compareTo(v('1.0.0-narwhal.2')), 0);
      expect(SelfReleaseVersion.tryParse('1.0.0-narwhal.2')!.channel, 2);
    });

    test('what is not a version is no version', () {
      for (final bad in ['', 'latest', 'v', '1.2.x', 'release-1.2.0']) {
        expect(SelfReleaseVersion.tryParse(bad), isNull, reason: bad);
      }
      expect(SelfReleaseVersion.tryParse(null), isNull);
    });
  });

  group('cache', () {
    test('an answer is reused for a week, then the network is asked again', () async {
      var now = DateTime.utc(2026, 11, 4, 12);
      final first = await SelfReleaseChecker(http: answering('v1.1.0-narwhal'), now: () => now).check();
      expect(first.failure, isNull);
      expect(first.cached, isFalse);
      expect(first.release!.version.name, '1.1.0');

      // A checker whose HTTP would fail: only the cache can answer.
      final offline = FakeHttp();
      now = now.add(const Duration(days: 6));
      final cached = await SelfReleaseChecker(http: offline, now: () => now).check();
      expect(offline.requests, isEmpty);
      expect(cached.cached, isTrue);
      expect(cached.release!.tag, 'v1.1.0-narwhal');
      expect((await SelfReleaseChecker(http: offline, now: () => now).readCache())!.tag, 'v1.1.0-narwhal');

      now = now.add(const Duration(days: 1, seconds: 1));
      expect(await SelfReleaseChecker(http: offline, now: () => now).readCache(), isNull);
      final stale = await SelfReleaseChecker(http: offline, now: () => now).check();
      expect(stale.failure, SelfReleaseFailure.network);
      expect(offline.requests, hasLength(1));
    });

    test('force asks GitHub even with a fresh answer', () async {
      var now = DateTime.utc(2026, 11, 4, 12);
      await SelfReleaseChecker(http: answering('v1.0.0-narwhal'), now: () => now).check();
      final http = answering('v1.1.0-narwhal');
      final forced = await SelfReleaseChecker(http: http, now: () => now).check(force: true);
      expect(http.urls, [selfLatestApi.toString()]);
      expect(forced.release!.version.name, '1.1.0');
      expect(forced.cached, isFalse);
    });

    test('the cached answer keeps its assets and dates', () async {
      var now = DateTime.utc(2026, 11, 4, 12);
      final http = answering('v1.1.0-narwhal', assets: [apkAsset()]);
      await SelfReleaseChecker(http: http, now: () => now).check();
      now = now.add(const Duration(days: 1));
      final cached = await SelfReleaseChecker(http: FakeHttp(), now: () => now).readCache();
      expect(cached!.assets.single.name, 'narwhal-1.1.0-arm64.apk');
      expect(cached.assets.single.sha256, startsWith('6b4749eb'));
      expect(cached.publishedAt, DateTime.utc(2026, 11, 4, 8, 41, 15));
    });

    test('failures are distinguished and never cached', () async {
      for (final (status, failure) in [
        (404, SelfReleaseFailure.noRelease),
        (403, SelfReleaseFailure.rateLimited),
        (429, SelfReleaseFailure.rateLimited),
        (500, SelfReleaseFailure.network),
        (200, SelfReleaseFailure.badResponse),
      ]) {
        SharedPreferences.setMockInitialValues({});
        final http = answering('v1.1.0-narwhal', status: status, body: status == 200 ? '<html>nope</html>' : null);
        final check = await SelfReleaseChecker(http: http).check();
        expect(check.failure, failure, reason: 'HTTP $status');
        expect(check.release, isNull);
        // Asked again next time: nothing was stored and the week stays unspent.
        expect(await SelfReleaseChecker(http: http).readCache(), isNull);
        expect(await SelfReleaseChecker(http: http).autoCheckDue(), isTrue);
        await SelfReleaseChecker(http: http).check();
        expect(http.requests, hasLength(2));
      }
    });

    test('an unreachable GitHub is a network failure', () async {
      final check = await SelfReleaseChecker(http: FakeHttp()).check();
      expect(check.failure, SelfReleaseFailure.network);
    });
  });

  group('weekly window', () {
    test('a launch draws a moment in the next half hour and keeps it', () async {
      final now = DateTime.utc(2026, 11, 4, 12);
      final checker = SelfReleaseChecker(http: FakeHttp(), now: () => now, random: Random(42));
      final wait = await checker.planAutoCheck();
      expect(wait, isNotNull);
      expect(wait!.inSeconds, inInclusiveRange(0, SelfReleaseChecker.maxDelay.inSeconds));
      expect((await prefs()).getInt(SelfReleaseChecker.nextCheckAtKey), now.add(wait).millisecondsSinceEpoch);
      expect(await checker.planAutoCheck(), wait, reason: 'a second call the same moment plans nothing new');
    });

    test('the same seed draws the same moment', () async {
      final now = DateTime.utc(2026, 11, 4, 12);
      final first = await SelfReleaseChecker(http: FakeHttp(), now: () => now, random: Random(7)).planAutoCheck();
      SharedPreferences.setMockInitialValues({});
      final second = await SelfReleaseChecker(http: FakeHttp(), now: () => now, random: Random(7)).planAutoCheck();
      expect(first, second);
    });

    test('later launches wait for the stored moment, whatever the dice say', () async {
      final now = DateTime.utc(2026, 11, 4, 12);
      SharedPreferences.setMockInitialValues({
        SelfReleaseChecker.nextCheckAtKey: now.add(const Duration(minutes: 20)).millisecondsSinceEpoch,
      });
      for (final seed in [1, 2, 3]) {
        final wait = await SelfReleaseChecker(
          http: FakeHttp(),
          now: () => now,
          random: Random(seed),
        ).planAutoCheck();
        expect(wait, const Duration(minutes: 20));
      }
    });

    test('an app killed before the check still waits for the same moment', () async {
      final now = DateTime.utc(2026, 11, 4, 12);
      final planned = now.add(const Duration(minutes: 20)).millisecondsSinceEpoch;
      SharedPreferences.setMockInitialValues({SelfReleaseChecker.nextCheckAtKey: planned});

      // Killed and started again ten minutes later, with other dice.
      final later = now.add(const Duration(minutes: 10));
      final http = answering('v1.1.0-narwhal');
      final restarted = SelfReleaseChecker(http: http, now: () => later, random: Random(99));
      final wait = await restarted.planAutoCheck();
      expect(wait, const Duration(minutes: 10));
      expect((await prefs()).getInt(SelfReleaseChecker.nextCheckAtKey), planned);
      // Not yet its moment: the automatic check doesn't run.
      expect(await restarted.runAutoCheck(), isNull);
      expect(http.requests, isEmpty);
    });

    test('nothing is planned while the last answer is younger than a week', () async {
      final now = DateTime.utc(2026, 11, 4, 12);
      SharedPreferences.setMockInitialValues({
        SelfReleaseChecker.checkedAtKey: now.subtract(const Duration(days: 6)).millisecondsSinceEpoch,
        SelfReleaseChecker.tagKey: 'v1.1.0-narwhal',
        // A window left over from before that answer: moot, and dropped.
        SelfReleaseChecker.nextCheckAtKey: now.add(const Duration(minutes: 5)).millisecondsSinceEpoch,
      });
      final http = FakeHttp();
      final checker = SelfReleaseChecker(http: http, now: () => now, random: Random(5));
      expect(await checker.autoCheckDue(), isFalse);
      expect(await checker.planAutoCheck(), isNull);
      expect((await prefs()).getInt(SelfReleaseChecker.nextCheckAtKey), isNull);
    });

    test('a week later a new window is drawn', () async {
      final now = DateTime.utc(2026, 11, 4, 12);
      SharedPreferences.setMockInitialValues({
        SelfReleaseChecker.checkedAtKey: now.subtract(const Duration(days: 8)).millisecondsSinceEpoch,
        SelfReleaseChecker.tagKey: 'v1.1.0-narwhal',
      });
      final checker = SelfReleaseChecker(http: FakeHttp(), now: () => now, random: Random(3));
      expect(await checker.autoCheckDue(), isTrue);
      expect(await checker.planAutoCheck(), isNotNull);
    });

    test('the planned check runs once, then the week is spent', () async {
      var now = DateTime.utc(2026, 11, 4, 12);
      final planned = now.add(const Duration(minutes: 10)).millisecondsSinceEpoch;
      SharedPreferences.setMockInitialValues({SelfReleaseChecker.nextCheckAtKey: planned});
      final http = answering('v1.1.0-narwhal');
      final checker = SelfReleaseChecker(http: http, now: () => now, random: Random(5));

      // Before its moment: nothing happens.
      expect(await checker.runAutoCheck(), isNull);
      expect(http.requests, isEmpty);

      now = DateTime.fromMillisecondsSinceEpoch(planned).add(const Duration(seconds: 1));
      final check = await checker.runAutoCheck();
      expect(check, isNotNull);
      expect(check!.release!.tag, 'v1.1.0-narwhal');
      expect(http.requests, hasLength(1));
      expect((await prefs()).getInt(SelfReleaseChecker.nextCheckAtKey), isNull);
      expect((await prefs()).getInt(SelfReleaseChecker.checkedAtKey), now.millisecondsSinceEpoch);

      // Used up: a second call does nothing, even though it is due by nothing.
      expect(await checker.runAutoCheck(), isNull);
      expect(http.requests, hasLength(1));
      expect(await checker.planAutoCheck(), isNull);
    });

    test('a failed automatic check spends the moment but not the week', () async {
      var now = DateTime.utc(2026, 11, 4, 12);
      final http = FakeHttp({
        selfLatestApi.toString(): (_, _) => textResponse('{"message":"Not Found"}', status: 404),
      });
      final checker = SelfReleaseChecker(http: http, now: () => now, random: Random(5));
      await checker.planAutoCheck();
      now = now.add(SelfReleaseChecker.maxDelay + const Duration(seconds: 1));
      final check = await checker.runAutoCheck();
      expect(check!.failure, SelfReleaseFailure.noRelease);
      expect((await prefs()).getInt(SelfReleaseChecker.nextCheckAtKey), isNull);
      expect((await prefs()).getInt(SelfReleaseChecker.checkedAtKey), isNull);
      // The next launch draws a new window instead of retrying in a loop.
      expect(await checker.autoCheckDue(), isTrue);
      expect(await checker.planAutoCheck(), isNotNull);
      expect(http.requests, hasLength(1));
    });

    test('a moment from a clock that moved backwards is drawn again', () async {
      final now = DateTime.utc(2026, 11, 4, 12);
      SharedPreferences.setMockInitialValues({
        SelfReleaseChecker.nextCheckAtKey: now.add(const Duration(days: 3)).millisecondsSinceEpoch,
      });
      final wait = await SelfReleaseChecker(
        http: FakeHttp(),
        now: () => now,
        random: Random(1),
      ).planAutoCheck();
      expect(wait, isNotNull);
      expect(wait!.inSeconds, inInclusiveRange(0, SelfReleaseChecker.maxDelay.inSeconds));
    });

    test('a clock behind the last answer counts as due', () async {
      final now = DateTime.utc(2026, 11, 4, 12);
      SharedPreferences.setMockInitialValues({
        SelfReleaseChecker.checkedAtKey: now.add(const Duration(days: 2)).millisecondsSinceEpoch,
        SelfReleaseChecker.tagKey: 'v1.1.0-narwhal',
      });
      expect(await SelfReleaseChecker(http: FakeHttp(), now: () => now).autoCheckDue(), isTrue);
    });
  });

  group('manual check', () {
    test('a tap ignores the saved moment and spends the week', () async {
      final now = DateTime.utc(2026, 11, 4, 12);
      SharedPreferences.setMockInitialValues({
        SelfReleaseChecker.checkedAtKey: now.subtract(const Duration(days: 8)).millisecondsSinceEpoch,
        SelfReleaseChecker.tagKey: 'v1.0.0-narwhal',
        SelfReleaseChecker.nextCheckAtKey: now.add(const Duration(minutes: 25)).millisecondsSinceEpoch,
      });
      final http = answering('v1.1.0-narwhal');
      final checker = SelfReleaseChecker(http: http, now: () => now, random: Random(5));
      final check = await checker.check(force: true);
      expect(http.urls, [selfLatestApi.toString()]);
      expect(check.release!.tag, 'v1.1.0-narwhal');
      // The answer is fresh, so the moment planned before it is dropped.
      expect(await checker.planAutoCheck(), isNull);
      expect((await prefs()).getInt(SelfReleaseChecker.nextCheckAtKey), isNull);
    });
  });
}

Object? decode(Map<String, Object?> json) => jsonDecode(jsonEncode(json));
