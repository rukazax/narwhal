// About → 「Обновления Narwhal」: the fork's release row shows the running
// build, the tag and size of a newer release with its two keys, or that GitHub
// couldn't be asked — and the update itself only ever starts from a tap and a
// confirmation, never from the weekly automatic check.
//
// The row's check and the update are real async work (HTTP, files, the
// `dsh/update` channel): taps are followed by `runAsync` so they complete, then
// by pumps so the screen redraws.

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:dsh_app/l10n/l10n.dart';
import 'package:dsh_app/state/self_release_state.dart';
import 'package:dsh_app/state/self_update_state.dart';
import 'package:dsh_app/state/star_prompt.dart' show starLinkOpenerProvider;
import 'package:dsh_app/state/update_state.dart' show AppUpdateController, AppUpdateState, appUpdateProvider, updateInstallerProvider;
import 'package:dsh_app/ui/settings/about_page.dart';
import 'package:dsh_app/ui/theme/theme.dart';
import 'package:dsh_app/ui/update/self_release_tile.dart';
import 'package:dsh_app/ui/update/update_sheet.dart' show formatUpdateSize;
import 'package:dsh_app/update/apk_installer.dart';
import 'package:dsh_app/update/self_release.dart';
import 'package:dsh_app/update/update_config.dart';
import 'package:dsh_app/update/update_http.dart';
import 'package:dsh_app/update/upstream.dart' show upstreamHttpProvider;
import 'package:dsh_app/update/version.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

const assetName = 'narwhal-1.1.0-arm64.apk';
const newerTag = 'v1.1.0-narwhal';

/// A release's APK: small enough for a widget test, long enough to be sure of
/// the bytes.
final apkBytes = List<int>.generate(48 * 1024, (i) => i % 251);
String get apkDigest => sha256.convert(apkBytes).toString();

/// Where the row downloads it from: the canonical URL, since the answer below
/// carries no `browser_download_url` (a real one always does).
Uri get apkUrl => selfReleaseAssetUrl(newerTag, assetName);

Future<String> hashFile(File file) async => sha256.convert(await file.readAsBytes()).toString();

String releaseBody(String tag) => jsonEncode({
  'tag_name': tag,
  'html_url': 'https://github.com/$selfRepo/releases/tag/$tag',
  'name': 'Narwhal $tag',
  'draft': false,
  'published_at': '2026-11-04T08:41:15Z',
  'assets': [
    {'name': assetName, 'size': apkBytes.length, 'digest': 'sha256:$apkDigest'},
  ],
});

FakeHttp answers(String tag) => FakeHttp({selfLatestApi.toString(): (_, _) => textResponse(releaseBody(tag))});

/// The cached answer of a check that ran [age] ago.
Map<String, Object> cached(String tag, {Duration age = Duration.zero}) => {
  SelfReleaseChecker.checkedAtKey: DateTime.now().subtract(age).millisecondsSinceEpoch,
  SelfReleaseChecker.tagKey: tag,
  SelfReleaseChecker.pageKey: 'https://github.com/$selfRepo/releases/tag/$tag',
  SelfReleaseChecker.assetsKey: jsonEncode([
    {'name': assetName, 'size': apkBytes.length, 'sha256': apkDigest},
  ]),
};

/// Lets the row's real async work (HTTP, preferences) finish, then redraws.
Future<void> settle(WidgetTester tester) async {
  await tester.runAsync(() => Future<void>.delayed(const Duration(milliseconds: 50)));
  await tester.pumpAndSettle();
}

/// Lets real work (HTTP, files, the channel) run until [done], then redraws.
Future<void> settleUntil(WidgetTester tester, bool Function() done) async {
  for (var i = 0; i < 400 && !done(); i++) {
    await tester.runAsync(() => Future<void>.delayed(const Duration(milliseconds: 5)));
    await tester.pump();
  }
  await tester.pumpAndSettle();
}

/// Android's side of the update: `dsh/update` answering from a script and
/// recording every call (lib/update/apk_installer.dart).
class FakeUpdateChannel {
  FakeUpdateChannel({this.allowsInstall = true, this.installStatus = 'started', this.settingsPageOpens = true});

  bool allowsInstall;
  String installStatus;
  bool settingsPageOpens;
  int? freeBytes = 8 << 30;

  final calls = <String>[];

  /// Paths handed to `installApk`.
  final installed = <String>[];

  int get installs => calls.where((m) => m == 'installApk').length;

  void attach(WidgetTester tester) {
    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(ChannelApkInstallPlatform.channel, _handle);
    addTearDown(
      () => tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(ChannelApkInstallPlatform.channel, null),
    );
  }

  Future<Object?> _handle(MethodCall call) async {
    calls.add(call.method);
    switch (call.method) {
      case 'canRequestInstalls':
        return allowsInstall;
      case 'openInstallPermission':
        return settingsPageOpens;
      case 'info':
        return {'versionName': installed, 'freeBytes': freeBytes};
      case 'installApk':
        installed.add((call.arguments as Map)['path'] as String);
        return {'status': installStatus, 'reason': installStatus == 'failed' ? 'no_handler' : null};
    }
    return null;
  }
}

class Harness {
  Harness({required this.container, required this.channel, required this.http, required this.directory});

  final ProviderContainer container;
  final FakeUpdateChannel channel;
  final FakeHttp http;
  final Directory directory;
}

void main() {
  tearDown(() => AppLocale.use(AppLocale.zhCN));

  Future<Harness> pump(
    WidgetTester tester, {
    FakeHttp? http,
    Map<String, Object> prefs = const {},
    Locale locale = AppLocale.ru,
    List<Uri>? opened,
    Widget child = const SelfReleaseTile(),
    bool fork = true,
    FakeUpdateChannel? channel,
  }) async {
    SharedPreferences.setMockInitialValues(prefs);
    AppLocale.use(locale);
    tester.view.devicePixelRatio = 1;
    tester.view.physicalSize = const Size(360, 800);
    addTearDown(tester.view.reset);
    final httpSeam = http ?? FakeHttp();
    final native = channel ?? FakeUpdateChannel();
    native.attach(tester);
    final directory = Directory.systemTemp.createTempSync('narwhal-widget-update');
    addTearDown(() => directory.deleteSync(recursive: true));
    final container = ProviderContainer(
      overrides: [
        selfReleaseHttpProvider.overrideWithValue(httpSeam),
        selfReleaseRowProvider.overrideWithValue(fork),
        updateInstallerProvider.overrideWithValue(FakeInstaller()),
        upstreamHttpProvider.overrideWithValue(FakeHttp()),
        appUpdateProvider.overrideWith(_FixedUpdate.new),
        starLinkOpenerProvider.overrideWithValue((uri) async {
          opened?.add(uri);
          return true;
        }),
        selfUpdateDirectoryProvider.overrideWithValue(() async => directory),
        // The real service, the real channel plumbing, a fake Android.
        selfUpdateInstallerProvider.overrideWith(
          (ref) => SelfUpdateInstaller(
            http: httpSeam,
            platform: ref.watch(apkInstallPlatformProvider),
            directory: ref.watch(selfUpdateDirectoryProvider),
            hasher: hashFile,
          ),
        ),
      ],
    );
    addTearDown(container.dispose);
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
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
    return Harness(container: container, channel: native, http: httpSeam, directory: directory);
  }

  testWidgets('a newer release shows its tag, size, update and release-page keys', (tester) async {
    final opened = <Uri>[];
    final harness = await pump(
      tester,
      http: answers(newerTag),
      prefs: cached(newerTag),
      opened: opened,
    );
    final l10n = lookupL10n(AppLocale.ru);
    expect(find.text(l10n.selfUpdatesTitle), findsOneWidget);
    expect(
      find.text(l10n.selfUpdatesAvailableSize('1.1.0-narwhal', formatUpdateSize(apkBytes.length))),
      findsOneWidget,
    );
    expect(find.text(l10n.selfUpdatesInstall), findsOneWidget);
    expect(find.text(l10n.selfUpdatesReleasePage), findsOneWidget);

    await tester.tap(find.byKey(SelfReleaseTile.pageKey));
    await tester.pumpAndSettle();
    expect(opened.map((uri) => uri.toString()), ['https://github.com/$selfRepo/releases/tag/$newerTag']);
    // Asking for the page downloads nothing and installs nothing.
    expect(harness.channel.calls, isEmpty);
    expect(tester.takeException(), isNull);
  });

  testWidgets('the offer downloads nothing until the person confirms', (tester) async {
    final harness = await pump(tester, http: answers(newerTag), prefs: cached(newerTag));
    harness.http.routes[apkUrl.toString()] = fileRoute(apkBytes, chunk: 4 * 1024);
    final l10n = lookupL10n(AppLocale.ru);

    await tester.tap(find.byKey(SelfReleaseTile.installKey));
    await tester.pumpAndSettle();
    // What will happen, and the two keys of the confirmation.
    expect(find.text(l10n.selfUpdateSheetTitle), findsOneWidget);
    expect(find.text(l10n.selfUpdateStepDownload), findsOneWidget);
    expect(find.text(l10n.selfUpdateStepPermission), findsOneWidget);
    expect(find.text(l10n.selfUpdateStepRestart), findsOneWidget);
    expect(find.text(l10n.selfUpdateDownloadAndInstall), findsOneWidget);
    // Nothing has started: no asset request, no channel call. (The week's
    // answer is already cached, so not even the API was asked.)
    expect(harness.http.requests, isEmpty);
    expect(harness.channel.calls, isEmpty);

    await tester.tap(find.text(l10n.commonCancel));
    await tester.pumpAndSettle();
    expect(find.text(l10n.selfUpdateSheetTitle), findsNothing);
    expect(harness.http.requests, isEmpty);
    expect(harness.channel.calls, isEmpty);
    expect(tester.takeException(), isNull);
  });

  testWidgets('confirming downloads once, installs once and says the installer is open', (tester) async {
    final harness = await pump(tester, http: answers(newerTag), prefs: cached(newerTag));
    harness.http.routes[apkUrl.toString()] = fileRoute(apkBytes, chunk: 4 * 1024);
    final l10n = lookupL10n(AppLocale.ru);

    await tester.tap(find.byKey(SelfReleaseTile.installKey));
    await tester.pumpAndSettle();
    await tester.tap(find.text(l10n.selfUpdateDownloadAndInstall));
    await settleUntil(tester, () => harness.channel.installs > 0);

    expect(harness.channel.installs, 1);
    final file = File(harness.channel.installed.single);
    expect(file.readAsBytesSync(), apkBytes);
    expect(find.text(l10n.selfUpdateInstallerOpened), findsOneWidget);
    // A way to try again if the system window went away.
    expect(find.text(l10n.commonRetry), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('a refused installer offers the Android settings page', (tester) async {
    final channel = FakeUpdateChannel(installStatus: 'permissionRequired');
    final harness = await pump(tester, http: answers(newerTag), prefs: cached(newerTag), channel: channel);
    harness.http.routes[apkUrl.toString()] = fileRoute(apkBytes, chunk: 4 * 1024);
    final l10n = lookupL10n(AppLocale.ru);

    await tester.tap(find.byKey(SelfReleaseTile.installKey));
    await tester.pumpAndSettle();
    await tester.tap(find.text(l10n.selfUpdateDownloadAndInstall));
    await settleUntil(tester, () => channel.installs > 0);

    expect(find.text(l10n.selfUpdatePermissionTitle), findsOneWidget);
    expect(find.text(l10n.selfUpdatePermissionRequired), findsOneWidget);

    await tester.tap(find.text(l10n.updateOpenPermissionSettings));
    await settleUntil(tester, () => channel.calls.contains('openInstallPermission'));
    expect(channel.calls.where((m) => m == 'openInstallPermission'), hasLength(1));
  });

  testWidgets('a download with no room says so instead of installing', (tester) async {
    final channel = FakeUpdateChannel()..freeBytes = 1024;
    final harness = await pump(tester, http: answers(newerTag), prefs: cached(newerTag), channel: channel);
    harness.http.routes[apkUrl.toString()] = fileRoute(apkBytes, chunk: 4 * 1024);
    final l10n = lookupL10n(AppLocale.ru);

    await tester.tap(find.byKey(SelfReleaseTile.installKey));
    await tester.pumpAndSettle();
    await tester.tap(find.text(l10n.selfUpdateDownloadAndInstall));
    await settleUntil(tester, () => find.text(l10n.selfUpdateFailedTitle).evaluate().isNotEmpty);

    expect(find.text(l10n.selfUpdateFailedTitle), findsOneWidget);
    expect(find.text(l10n.selfUpdateNoSpace), findsOneWidget);
    expect(find.byKey(const ValueKey('self-update-sheet-page')), findsOneWidget);
    expect(channel.installs, 0);
    // The asset was never asked for.
    expect(harness.http.requests, isEmpty);
  });

  testWidgets('a digest mismatch is refused and never reaches the installer', (tester) async {
    final harness = await pump(tester, http: answers(newerTag), prefs: cached(newerTag));
    // The release says one thing, the CDN serves another.
    harness.http.routes[apkUrl.toString()] = fileRoute(List.filled(apkBytes.length, 7), chunk: 4 * 1024);
    final l10n = lookupL10n(AppLocale.ru);

    await tester.tap(find.byKey(SelfReleaseTile.installKey));
    await tester.pumpAndSettle();
    await tester.tap(find.text(l10n.selfUpdateDownloadAndInstall));
    await settleUntil(tester, () => find.text(l10n.selfUpdateFailedTitle).evaluate().isNotEmpty);

    expect(find.text(l10n.selfUpdateChecksumFailed), findsOneWidget);
    expect(harness.channel.installs, 0);
    // Nothing is left behind for an installer that might be pointed at it later.
    expect(harness.directory.listSync(), isEmpty);
  });

  testWidgets('the weekly automatic check marks the version and calls nothing', (tester) async {
    // An answer older than a week, and the moment of its check already arrived.
    final stale = {
      ...cached(newerTag, age: const Duration(days: 8)),
      SelfReleaseChecker.nextCheckAtKey: 0,
    };
    final harness = await pump(tester, http: answers(newerTag), prefs: stale);
    harness.http.routes[apkUrl.toString()] = fileRoute(apkBytes, chunk: 4 * 1024);
    final l10n = lookupL10n(AppLocale.ru);

    await tester.runAsync(() => harness.container.read(selfReleaseProvider.notifier).runAutoCheck());
    await tester.pumpAndSettle();

    expect(
      find.text(l10n.selfUpdatesAvailableSize('1.1.0-narwhal', formatUpdateSize(apkBytes.length))),
      findsOneWidget,
    );
    // Only the API was asked; the package was never downloaded and Android was
    // never asked to install anything.
    expect(harness.http.urls, [selfLatestApi.toString()]);
    expect(harness.channel.calls, isEmpty);
    expect(harness.container.read(selfUpdateProvider).phase, SelfUpdatePhase.idle);
  });

  testWidgets('the running build is up to date with itself', (tester) async {
    final harness = await pump(tester, http: answers('v$installed-narwhal'), prefs: cached('v$installed-narwhal'));
    final l10n = lookupL10n(AppLocale.ru);
    expect(find.text(l10n.selfUpdatesCurrent(installed)), findsOneWidget);
    expect(find.text(l10n.selfUpdatesCheck), findsOneWidget);
    // No newer release: no update key either.
    expect(find.byKey(SelfReleaseTile.installKey), findsNothing);
    expect(harness.channel.calls, isEmpty);
  });

  testWidgets('an unanswered check says so and its retry asks again', (tester) async {
    final http = FakeHttp(); // unreachable
    final harness = await pump(tester, http: http, prefs: cached('v$installed-narwhal'));
    final l10n = lookupL10n(AppLocale.ru);

    await tester.tap(find.text(l10n.selfUpdatesCheck));
    await settle(tester);
    expect(find.text(l10n.selfUpdatesFailed), findsOneWidget);
    expect(find.text(l10n.selfUpdatesRetry), findsOneWidget);
    expect(find.text(l10n.selfUpdatesNoAnswer), findsOneWidget);

    // The same row checks again, and this time GitHub answers.
    http.routes[selfLatestApi.toString()] = (_, _) => textResponse(releaseBody(newerTag));
    await tester.tap(find.text(l10n.selfUpdatesRetry));
    await settle(tester);
    expect(
      find.text(l10n.selfUpdatesAvailableSize('1.1.0-narwhal', formatUpdateSize(apkBytes.length))),
      findsOneWidget,
    );
    expect(http.requests, hasLength(2));
    expect(harness.channel.calls, isEmpty);
  });

  testWidgets('a check in flight shows progress', (tester) async {
    final pending = Completer<UpdateHttpResponse>();
    final http = FakeHttp({selfLatestApi.toString(): (_, _) => pending.future});
    await pump(tester, http: http, prefs: cached('v$installed-narwhal'));
    final l10n = lookupL10n(AppLocale.ru);

    await tester.tap(find.text(l10n.selfUpdatesCheck));
    await tester.pump();
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    pending.complete(textResponse(releaseBody(newerTag)));
    await settle(tester);
    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(
      find.text(l10n.selfUpdatesAvailableSize('1.1.0-narwhal', formatUpdateSize(apkBytes.length))),
      findsOneWidget,
    );
  });

  testWidgets('the strings follow the app language', (tester) async {
    for (final locale in AppLocale.supported) {
      AppLocale.use(locale);
      final l10n = lookupL10n(locale);
      await pump(tester, http: answers(newerTag), prefs: cached(newerTag), locale: locale);
      expect(find.text(l10n.selfUpdatesTitle), findsOneWidget, reason: '$locale');
      expect(
        find.text(l10n.selfUpdatesAvailableSize('1.1.0-narwhal', formatUpdateSize(apkBytes.length))),
        findsOneWidget,
        reason: '$locale',
      );
      expect(find.text(l10n.selfUpdatesInstall), findsOneWidget, reason: '$locale');
      expect(find.text(l10n.selfUpdatesReleasePage), findsOneWidget, reason: '$locale');

      await tester.tap(find.byKey(SelfReleaseTile.installKey));
      await tester.pumpAndSettle();
      expect(find.text(l10n.selfUpdateSheetTitle), findsOneWidget, reason: '$locale');
      expect(find.text(l10n.selfUpdateDownloadAndInstall), findsOneWidget, reason: '$locale');
      await tester.tap(find.text(l10n.commonCancel));
      await tester.pumpAndSettle();
    }
  });

  testWidgets('About keeps the fork row and the original dsh-go row, separately', (tester) async {
    await pump(tester, http: answers(newerTag), prefs: cached(newerTag), child: const AboutPage());
    final l10n = lookupL10n(AppLocale.ru);
    expect(find.byKey(const ValueKey('settings-self-update')), findsOneWidget);
    expect(find.byKey(const ValueKey('settings-upstream')), findsOneWidget);
    expect(find.text(l10n.upstreamUpdatesSection), findsOneWidget);
    expect(find.text(l10n.selfUpdatesTitle), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('the original build keeps its in-app updater: no fork row', (tester) async {
    await pump(tester, prefs: cached(newerTag), child: const AboutPage(), fork: false);
    expect(find.byKey(const ValueKey('settings-self-update')), findsNothing);
    expect(find.byKey(const ValueKey('settings-upstream')), findsNothing);
  });

  group('controller', () {
    test('the cached answer is read at start, a tap asks GitHub', () async {
      SharedPreferences.setMockInitialValues(cached('v$installed-narwhal'));
      final http = answers(newerTag);
      final container = ProviderContainer(
        overrides: [
          selfReleaseHttpProvider.overrideWithValue(http),
          updateInstallerProvider.overrideWithValue(FakeInstaller()),
        ],
      );
      addTearDown(container.dispose);
      final controller = container.read(selfReleaseProvider.notifier);
      await controller.ready;
      expect(container.read(selfReleaseProvider).hasUpdate, isFalse);

      await controller.check();
      final state = container.read(selfReleaseProvider);
      expect(state.checking, isFalse);
      expect(state.release!.tag, newerTag);
      expect(state.hasUpdate, isTrue);
      expect(http.urls, [selfLatestApi.toString()]);
    });

    test('a check without an answer keeps the reason and the week unspent', () async {
      SharedPreferences.setMockInitialValues({});
      final container = ProviderContainer(
        overrides: [
          selfReleaseHttpProvider.overrideWithValue(FakeHttp()),
          updateInstallerProvider.overrideWithValue(FakeInstaller()),
        ],
      );
      addTearDown(container.dispose);
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
