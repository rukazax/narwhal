// The shell across the windows it can meet: phones, foldables open and shut,
// tablets both ways, split-screen slivers and a desktop-sized window; in
// Russian and English; at the default text size and at 1.6× (the largest
// Android "font size" step most phones offer). Nothing here compares pixels:
// every render must simply lay out without a RenderFlex overflow, a negative
// constraint or any other framework error.
//
//   flutter test test/shell/responsive_sweep_test.dart
//
// The report of a failing case names the window, the language, the text size
// and the screen, then quotes Flutter's own message including the
// "relevant error-causing widget" chain, which is what points at the layout
// that has to give.

import 'package:dsh_app/l10n/l10n.dart';
import 'package:dsh_app/runtime/runtime_state.dart';
import 'package:dsh_app/state/appearance_state.dart';
import 'package:dsh_app/state/balance_state.dart';
import 'package:dsh_app/state/hosts_state.dart';
import 'package:dsh_app/state/settings_state.dart';
import 'package:dsh_app/ui/chat/chat_screen.dart';
import 'package:dsh_app/ui/common/side_insets.dart';
import 'package:dsh_app/ui/settings/appearance/appearance_page.dart';
import 'package:dsh_app/ui/settings/settings_screen.dart';
import 'package:dsh_app/ui/shell/home_shell.dart';
import 'package:dsh_app/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart' show Override;
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../chat/support/harness.dart' show pumpFrames;
import '../phone/support.dart' show FixedActiveHost, FixedHosts;
import '../shell/adaptive/support.dart' show freezeClocks, homeOverrides, thawClocks;
import '../shell/golden_harness.dart' show FakeRuntime, FakeSettings, runningStatus;
import '../support/test_fonts.dart' show loadTestFonts, withTestFonts;

/// Phone portrait and landscape, the two foldable states, split-screen down to
/// its minimum, tablets both ways, and a window larger than any tablet.
const _sizes = <Size>[
  Size(320, 480), // split-screen, the smallest Android gives an app
  Size(353, 792), // the cover screen of a foldable
  Size(360, 640), // a small phone
  Size(400, 800), // a phone
  Size(600, 960), // a small tablet in portrait / an open foldable
  Size(700, 780), // an open foldable, squarish
  Size(718, 781), // the real inner screen of a foldable
  Size(800, 1280), // a tablet in portrait
  Size(840, 900), // the expanded breakpoint exactly
  Size(900, 1000), // a tablet in landscape, small
  Size(1280, 800), // a tablet in landscape
  Size(1600, 1000), // a desktop-sized window
];

/// Russian is the language whose strings are longest; English keeps the
/// Chinese-derived layout honest for the ones that are longer still.
const _locales = <Locale>[AppLocale.ru, AppLocale.en];

const _textScales = <double>[1.0, 1.6];

/// The status bar and the gesture bar every window above carries; a split
/// window keeps them, which is why 320 × 480 leaves 440 for the app.
const double _statusBar = 24;
const double _gestureBar = 16;

void _useWindow(WidgetTester tester, Size size) {
  tester.view.devicePixelRatio = 2;
  tester.view.physicalSize = size * 2;
  const padding = FakeViewPadding(top: _statusBar * 2, bottom: _gestureBar * 2);
  tester.view.padding = padding;
  tester.view.viewPadding = padding;
  addTearDown(tester.view.reset);
}

/// The app's own root (lib/app.dart): the app's themes, the app's languages,
/// the same inset handling. [textScale] stands in for the system font size.
Widget _app({
  required Key key,
  required Widget home,
  required Locale locale,
  required double textScale,
  List<Override> overrides = const [],
}) {
  return ProviderScope(
    // A key per screen: Riverpod refuses a scope whose override count changed
    // under the same element, and the screens need different fakes.
    key: key,
    overrides: overrides,
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: withTestFonts(buildLightTheme(glyphLocale: locale.languageCode == 'zh' ? null : AppLocale.zhCN)),
      darkTheme: withTestFonts(buildDarkTheme(glyphLocale: locale.languageCode == 'zh' ? null : AppLocale.zhCN)),
      locale: locale,
      supportedLocales: AppLocale.supported,
      localizationsDelegates: const [L10n.delegate, ...GlobalMaterialLocalizations.delegates],
      builder: (context, child) {
        final media = MediaQuery.of(context);
        return MediaQuery(
          // The app freezes transitions in tests; the system font size is what
          // this sweep varies.
          data: media.copyWith(disableAnimations: true, textScaler: TextScaler.linear(textScale)),
          child: MirroredSideInsets(child: child!),
        );
      },
      home: home,
    ),
  );
}

// ── The screens ──────────────────────────────────────────────────────────────

/// Every row settings can show at once: a warning-coloured permission value,
/// a balance, one saved SSH host, plugins installed.
List<Override> _hubOverrides() => [
  accountWalletBalanceProvider.overrideWithValue(null),
  activeHostProvider.overrideWith(() => FixedActiveHost(HostRef.local)),
  hostsProvider.overrideWith(FixedHosts.new),
  localRuntimeProvider.overrideWith(() => FakeRuntime(const LocalRuntimeState(loaded: true, status: runningStatus))),
  settingsProvider.overrideWith(() => FakeSettings(const AppSettings(loaded: true, autoApproveCommands: true))),
];

class _Screen {
  const _Screen(this.name, this.build, this.overrides);

  final String name;
  final Widget Function() build;
  final List<Override> Function() overrides;
}

final _screens = <_Screen>[
  _Screen(
    'home',
    () => HomeShell(chatBuilder: (openDrawer) => ChatScreen(onOpenDrawer: openDrawer, backdrop: false)),
    homeOverrides,
  ),
  _Screen('settings-hub', () => const SettingsScreen(), _hubOverrides),
  _Screen(
    'settings-appearance',
    () => const AppearancePage(),
    () => [
      settingsProvider.overrideWith(() => FakeSettings(const AppSettings(loaded: true))),
      dynamicColorChannelProvider.overrideWithValue(const _NoWallpaper()),
    ],
  ),
];

/// No wallpaper-derived colour: the row that would show it stays away, as on
/// a phone whose ROM doesn't offer one.
class _NoWallpaper extends DynamicColorChannel {
  const _NoWallpaper();

  @override
  Future<Color?> wallpaperAccent() async => null;
}

/// Drags the page's vertical list to its far end and back again, so rows that
/// start below the fold are laid out too: at 320 × 480 the settings hub shows
/// two of its six groups, and the appearance page's palette is the only
/// section on screen. A list only builds what it shows, so without this most
/// of both pages would never be measured.
Future<void> _scrollThrough(WidgetTester tester) async {
  final vertical = find.byWidgetPredicate(
    (w) => w is Scrollable && (w.axisDirection == AxisDirection.down || w.axisDirection == AxisDirection.up),
  );
  if (vertical.evaluate().isEmpty) return;
  // A conversation list is reversed (newest at the bottom): pulling down goes
  // back in time, while a settings page scrolls up.
  final backwards = tester.widget<Scrollable>(vertical.first).axisDirection == AxisDirection.up
      ? const Offset(0, 400)
      : const Offset(0, -400);
  for (var i = 0; i < 10; i++) {
    await tester.drag(vertical.first, backwards);
    await tester.pump(const Duration(milliseconds: 150));
  }
  for (var i = 0; i < 4; i++) {
    await tester.drag(vertical.first, -backwards);
    await tester.pump(const Duration(milliseconds: 150));
  }
  await tester.pump(const Duration(milliseconds: 400));
}

// ── Error collection ─────────────────────────────────────────────────────────

/// One framework error, with the case that produced it and Flutter's own
/// description (the "relevant error-causing widget" chain included).
class _Failure {
  _Failure(this.screen, this.details)
    // Built now, not when the test reports: Flutter's description of a render
    // object is computed on demand, and by the end of the test the row it
    // names may already be disposed (`RenderFlex#… DISPOSED`).
    : report = _describe(details);

  final String screen;
  final FlutterErrorDetails details;

  /// Flutter's message, with the information collector's nodes (the
  /// "relevant error-causing widget", the row's children and their sizes).
  final String report;

  /// `A RenderFlex overflowed by 7.0 pixels on the bottom.` — the first line
  /// of the report, which is what the table in the report quotes.
  String get summary => report.split('\n').first.trim();

  bool get isOverflow => summary.contains('overflowed by');

  /// The pixels, when Flutter names them.
  String get amount {
    final match = RegExp(r'overflowed by ([\d.]+) pixels').firstMatch(summary);
    return match == null ? '' : '${match.group(1)} px';
  }

  static String _describe(FlutterErrorDetails details) {
    final buffer = StringBuffer(details.exceptionAsString().trim());
    if (details.context case final context?) buffer.write('\ncontext: $context');
    final collector = details.informationCollector;
    if (collector != null) {
      for (final node in collector()) {
        final text = node.toString().trim();
        if (text.isNotEmpty && !buffer.toString().contains(text)) buffer.write('\n$text');
      }
    }
    return buffer.toString();
  }
}

String _describe(_Failure failure, Size size, Locale locale, double scale) =>
    '''
── ${failure.screen} · ${size.width.toInt()}×${size.height.toInt()} · ${locale.languageCode} · ${scale.toStringAsFixed(1)}×
${failure.report}''';

void main() {
  setUpAll(loadTestFonts);

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    freezeClocks();
  });

  tearDown(() {
    thawClocks();
    AppLocale.use(AppLocale.zhCN);
  });

  for (final size in _sizes) {
    for (final locale in _locales) {
      for (final scale in _textScales) {
        final label =
            '${size.width.toInt()}×${size.height.toInt()} · ${locale.languageCode} · ${scale.toStringAsFixed(1)}×';
        // One test per screen: a failure points at a live tree (the widget
        // chain in the message stays readable) and the cases stay independent.
        for (final screen in _screens) {
          testWidgets('$label · ${screen.name}', (tester) async {
            _useWindow(tester, size);
            AppLocale.use(locale);

            final failures = <_Failure>[];
            final defaultHandler = FlutterError.onError!;
            FlutterError.onError = (details) => failures.add(_Failure(screen.name, details));
            try {
              await tester.pumpWidget(
                _app(
                  key: ValueKey(screen.name),
                  home: screen.build(),
                  locale: locale,
                  textScale: scale,
                  overrides: screen.overrides(),
                ),
              );
              await tester.pump();
              await pumpFrames(tester, 2);
              await tester.pump(const Duration(milliseconds: 600));
              await _scrollThrough(tester);
              // One more frame: a layout deferred to a post-frame callback
              // reports here rather than in a later case.
              await tester.pump(const Duration(milliseconds: 100));
            } finally {
              FlutterError.onError = defaultHandler;
            }

            // RenderFlex overflows repeat on every frame that lays the same
            // row out (and again while the tree is torn down); report each one
            // once.
            final seen = <String>{};
            final unique = <_Failure>[];
            for (final failure in failures) {
              if (seen.add(failure.report)) unique.add(failure);
            }

            expect(
              unique,
              isEmpty,
              reason:
                  'layout errors in $label · ${screen.name}:\n'
                  '${unique.map((f) => _describe(f, size, locale, scale)).join('\n')}',
            );

            // A screen may also throw rather than report (a provider failing,
            // an assert): that is a failure too.
            final thrown = tester.takeException();
            expect(thrown, isNull, reason: '$label · ${screen.name} threw $thrown');
          });
        }
      }
    }
  }
}
