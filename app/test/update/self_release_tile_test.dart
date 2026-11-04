// About → 「Обновления Narwhal」: the fork's release row shows the running
// build, the tag of a newer release (whose page opens in the browser), or that
// GitHub couldn't be asked — and never hands an APK to the installer.
//
// The row's own check is real async work (HTTP, preferences): a tap is followed
// by `runAsync` so it completes, then by pumps so the row redraws.

import 'dart:async';
import 'dart:convert';

import 'package:dsh_app/l10n/l10n.dart';
import 'package:dsh_app/state/self_release_state.dart';
import 'package:dsh_app/state/star_prompt.dart' show starLinkOpenerProvider;
import 'package:dsh_app/state/update_state.dart' show AppUpdateController, AppUpdateState, appUpdateProvider, updateInstallerProvider;
import 'package:dsh_app/ui/settings/about_page.dart';
import 'package:dsh_app/ui/theme/theme.dart';
import 'package:dsh_app/ui/update/self_release_tile.dart';
import 'package:dsh_app/update/self_release.dart';
import 'package:dsh_app/update/update_config.dart';
import 'package:dsh_app/update/update_http.dart';
import 'package:dsh_app/update/upstream.dart' show upstreamHttpProvider;
import 'package:dsh_app/update/version.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../support/test_fonts.dart';
import 'support.dart';

class _FixedUpdate extends AppUpdateController {
  @override
  AppUpdateState build() => const AppUpdateState(current: AppVersion(1, 0, 2, build: 42));
}

/// The running build in these tests: `AppInfo.version` is `1.0.2+1`.
const installed = '1.0.2';

String releaseBody(String tag) => jsonEncode({
  'tag_name': tag,
  'html_url': 'https://github.com/$selfRepo/releases/tag/$tag',
  'name': 'Narwhal $tag',
  'draft': false,
  'published_at': '2026-11-04T08:41:15Z',
  'assets': [
    {'name': 'narwhal-1.1.0-arm64.apk', 'size': 191708210, 'digest': 'sha256:${List.filled(64, 'a').join()}'},
  ],
});

FakeHttp answers(String tag) => FakeHttp({selfLatestApi.toString(): (_, _) => textResponse(releaseBody(tag))});

/// The cached answer of a check that ran [age] ago.
Map<String, Object> cached(String tag, {Duration age = Duration.zero}) => {
  SelfReleaseChecker.checkedAtKey: DateTime.now().subtract(age).millisecondsSinceEpoch,
  SelfReleaseChecker.tagKey: tag,
  SelfReleaseChecker.pageKey: 'https://github.com/$selfRepo/releases/tag/$tag',
  SelfReleaseChecker.assetsKey: jsonEncode([
    {'name': 'narwhal-1.1.0-arm64.apk', 'size': 191708210, 'sha256': null},
  ]),
};

/// Lets the row's real async work (HTTP, preferences) finish, then redraws.
Future<void> settle(WidgetTester tester) async {
  await tester.runAsync(() => Future<void>.delayed(const Duration(milliseconds: 50)));
  await tester.pumpAndSettle();
}

void main() {
  tearDown(() => AppLocale.use(AppLocale.zhCN));

  Future<FakeInstaller> pump(
    WidgetTester tester, {
    FakeHttp? http,
    Map<String, Object> prefs = const {},
    Locale locale = AppLocale.ru,
    List<Uri>? opened,
    Widget child = const SelfReleaseTile(),
    bool fork = true,
  }) async {
    SharedPreferences.setMockInitialValues(prefs);
    AppLocale.use(locale);
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(360, 800);
    addTearDown(tester.view.reset);
    final installer = FakeInstaller();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          selfReleaseHttpProvider.overrideWithValue(http ?? FakeHttp()),
          selfReleaseRowProvider.overrideWithValue(fork),
          updateInstallerProvider.overrideWithValue(installer),
          upstreamHttpProvider.overrideWithValue(FakeHttp()),
          appUpdateProvider.overrideWith(_FixedUpdate.new),
          starLinkOpenerProvider.overrideWithValue((uri) async {
            opened?.add(uri);
            return true;
          }),
        ],
        child: MaterialApp(
          theme: withTestFonts(buildLightTheme()),
          locale: locale,
          supportedLocales: AppLocale.supported,
          localizationsDelegates: L10n.localizationsDelegates,
          home: Scaffold(body: Center(child: child)),
        ),
      ),
    );
    await settle(tester);
    return installer;
  }

  testWidgets('a newer release is shown with its tag and opens the release page', (tester) async {
    final opened = <Uri>[];
    final installer = await pump(
      tester,
      http: answers('v1.1.0-narwhal'),
      prefs: cached('v1.1.0-narwhal'),
      opened: opened,
    );
    final l10n = lookupL10n(AppLocale.ru);
    expect(find.text(l10n.selfUpdatesTitle), findsOneWidget);
    expect(find.text(l10n.selfUpdatesAvailable('1.1.0-narwhal')), findsOneWidget);

    await tester.tap(find.byKey(const ValueKey('settings-self-update')));
    await tester.pumpAndSettle();
    expect(opened.map((uri) => uri.toString()), [
      'https://github.com/$selfRepo/releases/tag/v1.1.0-narwhal',
    ]);
    // Nothing was downloaded or handed to an installer.
    expect(installer.calls, isEmpty);
    expect(installer.installed, isEmpty);
    expect(tester.takeException(), isNull);
  });

  testWidgets('the running build is up to date with itself', (tester) async {
    await pump(tester, http: answers('v$installed-narwhal'), prefs: cached('v$installed-narwhal'));
    final l10n = lookupL10n(AppLocale.ru);
    expect(find.text(l10n.selfUpdatesCurrent(installed)), findsOneWidget);
    expect(find.text(l10n.selfUpdatesCheck), findsOneWidget);
  });

  testWidgets('an unanswered check says so and its retry asks again', (tester) async {
    final http = FakeHttp(); // unreachable
    final installer = await pump(tester, http: http, prefs: cached('v$installed-narwhal'));
    final l10n = lookupL10n(AppLocale.ru);

    await tester.tap(find.text(l10n.selfUpdatesCheck));
    await settle(tester);
    expect(find.text(l10n.selfUpdatesFailed), findsOneWidget);
    expect(find.text(l10n.selfUpdatesRetry), findsOneWidget);
    expect(find.text(l10n.selfUpdatesNoAnswer), findsOneWidget);

    // The same row checks again, and this time GitHub answers.
    http.routes[selfLatestApi.toString()] = (_, _) => textResponse(releaseBody('v1.1.0-narwhal'));
    await tester.tap(find.text(l10n.selfUpdatesRetry));
    await settle(tester);
    expect(find.text(l10n.selfUpdatesAvailable('1.1.0-narwhal')), findsOneWidget);
    expect(http.requests, hasLength(2));
    expect(installer.calls, isEmpty);
  });

  testWidgets('a check in flight shows progress', (tester) async {
    final pending = Completer<UpdateHttpResponse>();
    final http = FakeHttp({selfLatestApi.toString(): (_, _) => pending.future});
    await pump(tester, http: http, prefs: cached('v$installed-narwhal'));
    final l10n = lookupL10n(AppLocale.ru);

    await tester.tap(find.text(l10n.selfUpdatesCheck));
    await tester.pump();
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    pending.complete(textResponse(releaseBody('v1.1.0-narwhal')));
    await settle(tester);
    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.text(l10n.selfUpdatesAvailable('1.1.0-narwhal')), findsOneWidget);
  });

  testWidgets('the strings follow the app language', (tester) async {
    for (final locale in AppLocale.supported) {
      AppLocale.use(locale);
      final l10n = lookupL10n(locale);
      await pump(tester, http: answers('v1.1.0-narwhal'), prefs: cached('v1.1.0-narwhal'), locale: locale);
      expect(find.text(l10n.selfUpdatesTitle), findsOneWidget, reason: '$locale');
      expect(find.text(l10n.selfUpdatesAvailable('1.1.0-narwhal')), findsOneWidget, reason: '$locale');
    }
  });

  testWidgets('About keeps the fork row and the original dsh-go row, separately', (tester) async {
    await pump(
      tester,
      http: answers('v1.1.0-narwhal'),
      prefs: cached('v1.1.0-narwhal'),
      child: const AboutPage(),
    );
    final l10n = lookupL10n(AppLocale.ru);
    expect(find.byKey(const ValueKey('settings-self-update')), findsOneWidget);
    expect(find.byKey(const ValueKey('settings-upstream')), findsOneWidget);
    expect(find.text(l10n.upstreamUpdatesSection), findsOneWidget);
    expect(find.text(l10n.selfUpdatesTitle), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('the original build keeps its in-app updater: no fork row', (tester) async {
    await pump(tester, prefs: cached('v1.1.0-narwhal'), child: const AboutPage(), fork: false);
    expect(find.byKey(const ValueKey('settings-self-update')), findsNothing);
    expect(find.byKey(const ValueKey('settings-upstream')), findsNothing);
  });

  group('controller', () {
    ProviderContainer containerWith(FakeHttp http) {
      final container = ProviderContainer(
        overrides: [
          selfReleaseHttpProvider.overrideWithValue(http),
          updateInstallerProvider.overrideWithValue(FakeInstaller()),
        ],
      );
      addTearDown(container.dispose);
      return container;
    }

    test('the cached answer is read at start, a tap asks GitHub', () async {
      SharedPreferences.setMockInitialValues(cached('v$installed-narwhal'));
      final http = answers('v1.1.0-narwhal');
      final container = containerWith(http);
      final controller = container.read(selfReleaseProvider.notifier);
      await controller.ready;
      expect(container.read(selfReleaseProvider).hasUpdate, isFalse);

      await controller.check();
      final state = container.read(selfReleaseProvider);
      expect(state.checking, isFalse);
      expect(state.release!.tag, 'v1.1.0-narwhal');
      expect(state.hasUpdate, isTrue);
      expect(http.urls, [selfLatestApi.toString()]);
    });

    test('a check without an answer keeps the reason and the week unspent', () async {
      SharedPreferences.setMockInitialValues({});
      final container = containerWith(FakeHttp());
      final controller = container.read(selfReleaseProvider.notifier);
      await controller.ready;
      await controller.check();
      final state = container.read(selfReleaseProvider);
      expect(state.failure, SelfReleaseFailure.network);
      expect(state.release, isNull);
      expect(state.hasUpdate, isFalse);
      // Nothing was answered, so the weekly check is still owed.
      expect(await SelfReleaseChecker(http: FakeHttp()).autoCheckDue(), isTrue);
    });
  });
}
