import 'dart:convert';

import 'package:dsh_app/update/update_config.dart';
import 'package:dsh_app/update/upstream.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'support.dart';

Map<String, Object?> releaseJson(String tag) => {
  'tag_name': tag,
  'html_url': 'https://github.com/$upstreamRepo/releases/tag/$tag',
  'name': 'DSH Go $tag',
  'draft': false,
  'assets': const <Object>[],
};

FakeHttp httpAnswering(String tag) => FakeHttp({
  upstreamLatestApi.toString(): (_, _) => textResponse(jsonEncode(releaseJson(tag))),
});

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));

  test('a newer upstream tag is reported with its release page', () async {
    final http = httpAnswering('v1.1.0');
    final check = await UpstreamChecker(http: http).check();
    expect(check.failure, isNull);
    expect(check.release!.version.name, '1.1.0');
    expect(check.release!.tag, 'v1.1.0');
    expect(check.release!.isNewer, isTrue);
    expect(check.release!.page.toString(), 'https://github.com/$upstreamRepo/releases/tag/v1.1.0');
    expect(check.cached, isFalse);
    expect(http.urls, [upstreamLatestApi.toString()]);
  });

  test('the version this build is based on is not an update', () async {
    final check = await UpstreamChecker(http: httpAnswering('v$upstreamBaseVersion')).check();
    expect(check.release!.isNewer, isFalse);
  });

  test('the answer is reused for a day without asking again', () async {
    var now = DateTime.utc(2026, 11, 3, 12);
    final first = await UpstreamChecker(http: httpAnswering('v1.1.0'), now: () => now).check();
    expect(first.cached, isFalse);

    // A checker whose HTTP would fail: only the cache can answer.
    final offline = FakeHttp();
    now = now.add(const Duration(hours: 23));
    final second = await UpstreamChecker(http: offline, now: () => now).check();
    expect(offline.requests, isEmpty);
    expect(second.cached, isTrue);
    expect(second.release!.version.name, '1.1.0');

    now = now.add(const Duration(hours: 2));
    final third = await UpstreamChecker(http: offline, now: () => now).check();
    expect(third.failure, UpstreamFailure.network);
    expect(offline.requests, hasLength(1));
  });

  test('force asks GitHub again immediately', () async {
    await UpstreamChecker(http: httpAnswering('v1.1.0')).check();
    final http = httpAnswering('v1.2.0');
    final forced = await UpstreamChecker(http: http).check(force: true);
    expect(http.urls, [upstreamLatestApi.toString()]);
    expect(forced.release!.version.name, '1.2.0');
    expect(forced.cached, isFalse);
  });

  test('a missing release is noRelease and is not cached', () async {
    final http = FakeHttp({upstreamLatestApi.toString(): (_, _) => textResponse('{"message":"Not Found"}', status: 404)});
    final check = await UpstreamChecker(http: http).check();
    expect(check.failure, UpstreamFailure.noRelease);

    final again = await UpstreamChecker(http: http).check();
    expect(again.failure, UpstreamFailure.noRelease);
    expect(http.requests, hasLength(2));
  });

  test('a rate limit and a broken body are distinguished', () async {
    final limited = FakeHttp({
      upstreamLatestApi.toString(): (_, _) => textResponse('{}', status: 403, headers: {'x-ratelimit-remaining': '0'}),
    });
    expect((await UpstreamChecker(http: limited).check()).failure, UpstreamFailure.rateLimited);

    final broken = FakeHttp({upstreamLatestApi.toString(): (_, _) => textResponse('<html>nope</html>')});
    expect((await UpstreamChecker(http: broken).check()).failure, UpstreamFailure.badResponse);
  });
}
