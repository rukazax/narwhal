// The weekly check of this fork's releases runs in the foreground only
// (lib/ui/update/self_release_host.dart): at the moment kept in preferences
// while the app is in front, and not at all while it is in the background.

import 'dart:convert';

import 'package:dsh_app/ui/update/self_release_host.dart';
import 'package:dsh_app/update/self_release.dart';
import 'package:dsh_app/update/update_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'support.dart';

String releaseBody(String tag) => jsonEncode({
  'tag_name': tag,
  'html_url': 'https://github.com/$selfRepo/releases/tag/$tag',
  'draft': false,
  'assets': const <Object>[],
});

void main() {
  late DateTime now;

  setUp(() {
    now = DateTime.utc(2026, 11, 4, 12);
  });

  Future<FakeHttp> pumpHost(WidgetTester tester, Map<String, Object> prefs) async {
    SharedPreferences.setMockInitialValues(prefs);
    final http = FakeHttp({selfLatestApi.toString(): (_, _) => textResponse(releaseBody('v1.1.0-narwhal'))});
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          selfReleaseHttpProvider.overrideWithValue(http),
          selfReleaseClockProvider.overrideWithValue(() => now),
          // A fork build: About reports its own releases.
          selfReleaseRowProvider.overrideWithValue(true),
        ],
        child: const MaterialApp(home: Scaffold(body: SelfReleaseHost())),
      ),
    );
    return http;
  }

  /// One frame with the real event loop: the host plans and checks through
  /// several awaits and a timer, which a plain pump doesn't let finish.
  Future<void> flush(WidgetTester tester) async {
    await tester.runAsync(() => Future<void>.delayed(const Duration(milliseconds: 50)));
    await tester.pump(const Duration(milliseconds: 50));
  }

  Future<void> until(WidgetTester tester, bool Function() condition) async {
    for (var i = 0; i < 10 && !condition(); i++) {
      await flush(tester);
    }
  }

  void lifecycle(WidgetTester tester, List<AppLifecycleState> states) {
    for (final state in states) {
      tester.binding.handleAppLifecycleStateChanged(state);
    }
  }

  testWidgets('the planned moment runs the check', (tester) async {
    now = now.add(const Duration(minutes: 1));
    final http = await pumpHost(tester, {
      SelfReleaseChecker.checkedAtKey: now.subtract(const Duration(days: 8)).millisecondsSinceEpoch,
      SelfReleaseChecker.tagKey: 'v1.0.2-narwhal',
      // The window a killed app left behind has already arrived.
      SelfReleaseChecker.nextCheckAtKey: now.subtract(const Duration(minutes: 1)).millisecondsSinceEpoch,
    });
    await until(tester, () => http.requests.isNotEmpty);
    expect(http.requests, hasLength(1));
    expect(http.urls, [selfLatestApi.toString()]);
  });

  testWidgets('nothing runs while the app is in the background', (tester) async {
    // The moment is ten minutes off: planned before, not now.
    final http = await pumpHost(tester, {
      SelfReleaseChecker.checkedAtKey: now.subtract(const Duration(days: 8)).millisecondsSinceEpoch,
      SelfReleaseChecker.tagKey: 'v1.0.2-narwhal',
      SelfReleaseChecker.nextCheckAtKey: now.add(const Duration(minutes: 10)).millisecondsSinceEpoch,
    });
    await flush(tester); // let it plan

    lifecycle(tester, [AppLifecycleState.inactive, AppLifecycleState.hidden, AppLifecycleState.paused]);
    // Ten minutes pass with the app in the background: no check.
    now = now.add(const Duration(minutes: 11));
    await tester.pump(const Duration(minutes: 11));
    expect(http.requests, isEmpty);

    // Back in front: the moment has passed, so it checks now.
    lifecycle(tester, [AppLifecycleState.hidden, AppLifecycleState.inactive, AppLifecycleState.resumed]);
    await until(tester, () => http.requests.isNotEmpty);
    expect(http.requests, hasLength(1));
  });

  testWidgets('a fresh answer plans nothing', (tester) async {
    final http = await pumpHost(tester, {
      SelfReleaseChecker.checkedAtKey: now.subtract(const Duration(days: 2)).millisecondsSinceEpoch,
      SelfReleaseChecker.tagKey: 'v1.0.2-narwhal',
    });
    await tester.pump(const Duration(minutes: 31));
    await flush(tester);
    expect(http.requests, isEmpty);
  });
}
