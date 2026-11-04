// 桌面图标: the picker switches the launcher icon through the native side and
// says so; the row is measured; the previews match the shipped icon layers.
// Goldens:
//
//   flutter test --update-goldens test/settings/app_icon_picker_test.dart

import 'dart:async';
import 'dart:io';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:dsh_app/state/app_icon_state.dart';
import 'package:dsh_app/ui/settings/appearance/app_icon_picker.dart';
import 'package:dsh_app/ui/settings/settings_widgets.dart';
import 'package:dsh_app/ui/shell/brand_glyph.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import '../shell/golden_harness.dart';

class _FakeLauncher extends LauncherIconChannel {
  _FakeLauncher({this.current = AppIcon.mist, this.mask});

  AppIcon current;
  final List<double>? mask;
  bool fail = false;
  Completer<void>? gate;
  final sets = <AppIcon>[];

  @override
  Future<AppIconState?> state() async => AppIconState(current: current, mask: mask);

  @override
  Future<AppIcon?> set(AppIcon icon) async {
    sets.add(icon);
    if (gate case final gate?) await gate.future;
    if (fail) return null;
    return current = icon;
  }
}

/// A circle (a Pixel's mask), [n] points.
List<double> _circle([int n = 240]) => [
  for (var i = 0; i < n; i++) ...[0.5 + 0.5 * math.cos(2 * math.pi * i / n), 0.5 + 0.5 * math.sin(2 * math.pi * i / n)],
];

Widget _page() => Scaffold(
  body: SafeArea(
    child: ListView(
      children: const [
        SettingsSection(title: '桌面图标', children: [AppIconPicker()]),
      ],
    ),
  ),
);

Future<void> _pump(WidgetTester tester, _FakeLauncher launcher, {Brightness brightness = Brightness.light}) async {
  usePhoneSurface(tester);
  await tester.pumpWidget(
    goldenApp(
      home: _page(),
      brightness: brightness,
      overrides: [launcherIconChannelProvider.overrideWithValue(launcher)],
    ),
  );
  await tester.pumpAndSettle();
}

bool _selected(WidgetTester tester, AppIcon icon) =>
    tester.getSemantics(find.bySemanticsLabel(icon.label)).getSemanticsData().flagsCollection.isSelected ==
    ui.Tristate.isTrue;

AppIcon? _chosen(WidgetTester tester) {
  final on = AppIcon.values.where((icon) => _selected(tester, icon)).toList();
  expect(on.length, lessThanOrEqualTo(1));
  return on.firstOrNull;
}

/// The pixels of a shipped PNG (premultiplied, as [ui.Image.toByteData] reports
/// them), at its own size. [path] is relative to the `app/` directory.
Future<(int, int, Uint8List)> _decodePng(WidgetTester tester, String path) async {
  final bytes = File(path).readAsBytesSync();
  final decoded = await tester.runAsync(() async {
    final frame = await (await ui.instantiateImageCodec(bytes)).getNextFrame();
    final data = await frame.image.toByteData();
    return (frame.image.width, frame.image.height, data!.buffer.asUint8List());
  });
  return decoded!;
}

List<int> _pixel(Uint8List rgba, int width, int x, int y) {
  final at = (y * width + x) * 4;
  return [rgba[at], rgba[at + 1], rgba[at + 2], rgba[at + 3]];
}

/// The visible-ink box (alpha > 16), right/bottom exclusive.
Rect _inkBox(Uint8List rgba, int width, int height) {
  var left = width, top = height, right = 0, bottom = 0;
  for (var y = 0; y < height; y++) {
    for (var x = 0; x < width; x++) {
      if (rgba[(y * width + x) * 4 + 3] <= 16) continue;
      if (x < left) left = x;
      if (x + 1 > right) right = x + 1;
      if (y < top) top = y;
      if (y + 1 > bottom) bottom = y + 1;
    }
  }
  expect(right > left && bottom > top, isTrue, reason: 'the layer has no ink');
  return Rect.fromLTRB(left.toDouble(), top.toDouble(), right.toDouble(), bottom.toDouble());
}

/// The farthest visible-ink pixel from the canvas centre, as a fraction of its side.
double _inkRadius(Uint8List rgba, int width, int height) {
  final cx = width / 2, cy = height / 2;
  var farthest = 0.0;
  for (var y = 0; y < height; y++) {
    for (var x = 0; x < width; x++) {
      if (rgba[(y * width + x) * 4 + 3] <= 16) continue;
      final dx = x + 0.5 - cx, dy = y + 0.5 - cy;
      farthest = math.max(farthest, math.sqrt(dx * dx + dy * dy));
    }
  }
  return farthest / width;
}

/// Every pixel with ink is [colour]: one flat fill, premultiplied by its alpha.
void _expectFlatInk(Uint8List rgba, int width, int height, Color colour, String reason) {
  final channels = [colour.r * 255, colour.g * 255, colour.b * 255];
  for (var y = 0; y < height; y++) {
    for (var x = 0; x < width; x++) {
      final at = (y * width + x) * 4;
      final alpha = rgba[at + 3];
      if (alpha == 0) continue;
      final opacity = alpha / 255;
      for (final (i, channel) in channels.indexed) {
        expect(rgba[at + i], closeTo(channel * opacity, 2), reason: '$reason: pixel ($x,$y) alpha $alpha');
      }
    }
  }
}

/// The share of all pixels painted [colour] (± [tolerance]), alpha ≥ [alpha],
/// read back as straight alpha. The Narwhal is not one flat fill: body, belly,
/// rim, eye and thread cuts each have their own colour.
double _colourShare(
  Uint8List rgba,
  int width,
  int height,
  Color colour, {
  int alpha = 200,
  int tolerance = 8,
}) {
  final r = (colour.r * 255).round();
  final g = (colour.g * 255).round();
  final b = (colour.b * 255).round();
  var hits = 0;
  for (var i = 0; i < width * height; i++) {
    final at = i * 4;
    final a = rgba[at + 3];
    if (a < alpha) continue;
    final pr = (rgba[at] * 255 / a).round();
    final pg = (rgba[at + 1] * 255 / a).round();
    final pb = (rgba[at + 2] * 255 / a).round();
    if ((pr - r).abs() <= tolerance && (pg - g).abs() <= tolerance && (pb - b).abs() <= tolerance) hits++;
  }
  return hits / (width * height);
}

void main() {
  group('picker', () {
    testWidgets('four icons in order, the one on the phone chosen', (tester) async {
      final handle = tester.ensureSemantics();
      await _pump(tester, _FakeLauncher(current: AppIcon.night));
      final xs = [for (final icon in AppIcon.values) tester.getCenter(find.text(icon.label)).dx];
      expect(xs, orderedEquals([...xs]..sort()));
      expect(AppIcon.values.map((i) => i.label), ['雾蓝', '夜幕', '霜白', '墨']);
      expect(_chosen(tester), AppIcon.night);
      handle.dispose();
    });

    testWidgets('picking one switches the launcher and says so', (tester) async {
      final handle = tester.ensureSemantics();
      final launcher = _FakeLauncher();
      await _pump(tester, launcher);
      await tester.tap(find.text('霜白'));
      await tester.pumpAndSettle();
      expect(launcher.sets, [AppIcon.frost]);
      expect(_chosen(tester), AppIcon.frost);
      expect(find.text('桌面图标已选择，回到桌面后更新'), findsOneWidget);
      handle.dispose();
    });

    testWidgets('a switch that fails shows the launcher as it is and says so', (tester) async {
      final handle = tester.ensureSemantics();
      final launcher = _FakeLauncher()..fail = true;
      await _pump(tester, launcher);
      await tester.tap(find.text('墨'));
      await tester.pumpAndSettle();
      expect(launcher.sets, [AppIcon.ink]);
      expect(_chosen(tester), AppIcon.mist);
      expect(find.text('没能更换，稍后再试'), findsOneWidget);
      handle.dispose();
    });

    testWidgets('the current icon does nothing', (tester) async {
      final launcher = _FakeLauncher();
      await _pump(tester, launcher);
      await tester.tap(find.text('雾蓝'));
      await tester.pumpAndSettle();
      expect(launcher.sets, isEmpty);
      expect(find.byType(SnackBar), findsNothing);
    });

    testWidgets('picks run in order and the last one stays', (tester) async {
      final handle = tester.ensureSemantics();
      final launcher = _FakeLauncher()..gate = Completer<void>();
      await _pump(tester, launcher);
      await tester.tap(find.text('夜幕'));
      await tester.pump();
      // Shown at once, before the launcher answers.
      expect(_chosen(tester), AppIcon.night);
      await tester.tap(find.text('墨'));
      await tester.pump();
      expect(_chosen(tester), AppIcon.ink);
      expect(launcher.sets, [AppIcon.night]);
      launcher.gate!.complete();
      launcher.gate = null;
      await tester.pumpAndSettle();
      expect(launcher.sets, [AppIcon.night, AppIcon.ink]);
      expect(_chosen(tester), AppIcon.ink);
      expect(launcher.current, AppIcon.ink);
      handle.dispose();
    });
  });

  group('geometry', () {
    Future<void> measure(WidgetTester tester, {required double width, required double textScale}) async {
      tester.view.devicePixelRatio = 3;
      tester.view.physicalSize = Size(width * 3, 800 * 3);
      tester.platformDispatcher.textScaleFactorTestValue = textScale;
      addTearDown(tester.view.reset);
      addTearDown(tester.platformDispatcher.clearTextScaleFactorTestValue);
      await tester.pumpWidget(
        goldenApp(
          home: _page(),
          brightness: Brightness.light,
          overrides: [launcherIconChannelProvider.overrideWithValue(_FakeLauncher(mask: _circle()))],
        ),
      );
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);

      final picker = tester.getRect(find.byType(AppIconPicker));
      final boxes = [for (final icon in AppIcon.values) tester.getRect(find.byKey(ValueKey('app-icon-${icon.name}')))];
      final icons = [
        for (final icon in AppIcon.values)
          tester.getRect(find.byWidgetPredicate((w) => w is AppIconPreview && w.icon == icon)),
      ];
      final labels = [for (final icon in AppIcon.values) tester.getRect(find.text(icon.label))];

      // Same size everywhere, at most a launcher's own, ring room on every side.
      for (final (i, box) in boxes.indexed) {
        expect(box.width, closeTo(boxes.first.width, 1e-6));
        expect(box.height, closeTo(box.width, 1e-6));
        expect(icons[i].width, closeTo(icons[i].height, 1e-6));
        expect(icons[i].width, lessThanOrEqualTo(AppIconPicker.maxIcon));
        expect(box.width, closeTo(AppIconPicker.extent(icons[i].width), 1e-6));
        // Icon and ring share a centre.
        expect((icons[i].center - box.center).distance, lessThan(1e-6));
        // Label centred under its icon, all on one line.
        expect(labels[i].center.dx, closeTo(box.center.dx, 0.01));
        expect(labels[i].top, closeTo(labels.first.top, 1e-6));
        expect(labels[i].top - box.bottom, closeTo(AppIconPicker.labelGap, 1e-6));
      }
      // Evenly spread; the row mirrors (as far in from the left as from the right).
      final step = boxes[1].center.dx - boxes[0].center.dx;
      for (var i = 1; i < boxes.length; i++) {
        expect(boxes[i].center.dx - boxes[i - 1].center.dx, closeTo(step, 1e-6));
      }
      expect(boxes.first.left - picker.left, closeTo(picker.right - boxes.last.right, 1e-6));
      expect(boxes.first.top - picker.top, closeTo(16, 1e-6));
    }

    testWidgets('phone width', (tester) => measure(tester, width: 390, textScale: 1));
    testWidgets('narrow, large text', (tester) => measure(tester, width: 320, textScale: 1.3));
  });

  group('mask', () {
    test("the system's outline, scaled", () {
      final path = launcherMaskPath(_circle(), 60);
      expect(path.getBounds().width, closeTo(60, 0.01));
      expect(path.contains(const Offset(30, 30)), isTrue);
      expect(path.contains(const Offset(3, 3)), isFalse);
      expect(path.contains(const Offset(1, 30)), isTrue);
    });

    test('a rounded square without one', () {
      final path = launcherMaskPath(null, 60);
      expect(path.getBounds(), const Rect.fromLTWH(0, 0, 60, 60));
      expect(path.contains(const Offset(0.5, 0.5)), isFalse);
      expect(path.contains(const Offset(3, 30)), isTrue);
      expect(launcherMaskPath(const [0.5, 0.5], 60).getBounds().width, closeTo(60, 0.01));
    });
  });

  group('channel', () {
    const name = 'dsh/launcher_icon';
    final messenger = TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
    tearDown(() => messenger.setMockMethodCallHandler(const MethodChannel(name), null));

    void answer(Object? Function(MethodCall call) reply) =>
        messenger.setMockMethodCallHandler(const MethodChannel(name), (call) async => reply(call));

    test('state', () async {
      TestWidgetsFlutterBinding.ensureInitialized();
      answer((_) => {'current': 'frost', 'mask': _circle(8)});
      final state = await const LauncherIconChannel().state();
      expect(state?.current, AppIcon.frost);
      expect(state?.mask, hasLength(16));
      answer((_) => {'current': 'ink', 'mask': null});
      expect((await const LauncherIconChannel().state())?.mask, isNull);
      answer(
        (_) => {
          'current': 'ink',
          'mask': [0.1, 'x'],
        },
      );
      expect((await const LauncherIconChannel().state())?.mask, isNull);
      answer((_) => {'current': 'rainbow'});
      expect(await const LauncherIconChannel().state(), isNull);
      answer((_) => throw PlatformException(code: 'failed'));
      expect(await const LauncherIconChannel().state(), isNull);
      messenger.setMockMethodCallHandler(const MethodChannel(name), null);
      expect(await const LauncherIconChannel().state(), isNull);
    });

    test('set', () async {
      TestWidgetsFlutterBinding.ensureInitialized();
      MethodCall? seen;
      answer((call) {
        seen = call;
        return {'current': 'night'};
      });
      expect(await const LauncherIconChannel().set(AppIcon.night), AppIcon.night);
      expect(seen?.method, 'set');
      expect(seen?.arguments, {'id': 'night'});
      answer((_) => throw PlatformException(code: 'failed'));
      expect(await const LauncherIconChannel().set(AppIcon.ink), isNull);
    });
  });

  group('the previews match the shipped icons', () {
    const res = 'android/app/src/main/res';
    const densities = ['mdpi', 'hdpi', 'xhdpi', 'xxhdpi', 'xxxhdpi'];
    const dpr = {'mdpi': 1.0, 'hdpi': 1.5, 'xhdpi': 2.0, 'xxhdpi': 3.0, 'xxxhdpi': 4.0};

    test('adaptive icons: transparent background, the whale layers', () {
      for (final icon in AppIcon.values) {
        final suffix = icon == AppIcon.mist ? '' : '_${icon.name}';
        for (final round in ['', '_round']) {
          final xml = File('$res/mipmap-anydpi-v26/ic_launcher$suffix$round.xml').readAsStringSync();
          expect(xml, contains('<background android:drawable="@android:color/transparent" />'), reason: xml);
          expect(
            xml,
            contains('<foreground android:drawable="@mipmap/ic_launcher${suffix}_foreground" />'),
            reason: xml,
          );
          expect(xml, contains('<monochrome android:drawable="@mipmap/ic_launcher_monochrome" />'), reason: xml);
          expect(xml, isNot(contains('gradient')), reason: xml);
          expect(xml, isNot(contains('_background')), reason: xml);
        }
        // The painted gradient backgrounds are gone, not just unreferenced.
        expect(File('$res/drawable/ic_launcher${suffix}_background.xml').existsSync(), isFalse);
      }
    });

    test('one design: all four styles ship the same bytes', () {
      for (final density in densities) {
        for (final name in ['ic_launcher', 'ic_launcher_round', 'ic_launcher_foreground']) {
          final base = File('$res/mipmap-$density/$name.png').readAsBytesSync();
          for (final style in ['frost', 'ink', 'night']) {
            final styled = name == 'ic_launcher'
                ? 'ic_launcher_$style'
                : name.replaceFirst('ic_launcher', 'ic_launcher_$style');
            expect(File('$res/mipmap-$density/$styled.png').readAsBytesSync(), base, reason: '$density $styled');
          }
        }
      }
    });

    test('the body reads on light and dark launchers', () {
      double luminance(Color c) {
        double linear(double channel) =>
            channel <= 0.04045 ? channel / 12.92 : math.pow((channel + 0.055) / 1.055, 2.4).toDouble();
        return 0.2126 * linear(c.r) + 0.7152 * linear(c.g) + 0.0722 * linear(c.b);
      }

      double contrast(Color a, Color b) {
        final (x, y) = (luminance(a), luminance(b));
        return (math.max(x, y) + 0.05) / (math.min(x, y) + 0.05);
      }

      expect(contrast(BrandGlyph.light, const Color(0xFFFFFFFF)), greaterThan(3.0));
      expect(contrast(BrandGlyph.light, const Color(0xFF121212)), greaterThan(3.0));
      for (final icon in AppIcon.values) {
        expect(AppIconArt.of(icon).body, BrandGlyph.light, reason: icon.name);
      }
    });

    testWidgets('the Narwhal, at every density', (tester) async {
      for (final density in densities) {
        final (w, h, rgba) = await _decodePng(tester, '$res/mipmap-$density/ic_launcher.png');
        expect(w, (48 * dpr[density]!).round(), reason: density);
        expect(h, w, reason: density);
        for (final (x, y) in [(0, 0), (w - 1, 0), (0, h - 1), (w - 1, h - 1)]) {
          expect(_pixel(rgba, w, x, y)[3], 0, reason: '$density: corner ($x,$y) is not transparent');
        }

        final box = _inkBox(rgba, w, h);
        expect(box.width / w, inInclusiveRange(0.78, 0.82), reason: '$density: width ${box.width / w}');
        expect((box.center.dx / w), closeTo(0.5, 0.02), reason: density);
        expect((box.center.dy / h), closeTo(0.5, 0.02), reason: density);

        // The body, the light belly and the white eye patch, at every size; the
        // grey rim is one pixel thin below xxhdpi, so it is checked on the big ones.
        expect(
          _colourShare(rgba, w, h, BrandGlyph.light),
          greaterThan(0.08),
          reason: '$density: the blue body',
        );
        expect(
          _colourShare(rgba, w, h, BrandGlyph.bellyFill),
          greaterThan(0.02),
          reason: '$density: the belly',
        );
        if (density == 'xxxhdpi') {
          expect(_colourShare(rgba, w, h, BrandGlyph.rim), greaterThan(0.002), reason: '$density: the rim');
          expect(_colourShare(rgba, w, h, BrandGlyph.eyeFill), greaterThan(0.002), reason: '$density: the eye');
        }
      }
    });

    testWidgets('the round icon keeps the Narwhal inside a circular mask', (tester) async {
      for (final density in densities) {
        final (w, h, rgba) = await _decodePng(tester, '$res/mipmap-$density/ic_launcher_round.png');
        final box = _inkBox(rgba, w, h);
        expect(box.width / w, lessThanOrEqualTo(0.90), reason: density);
        expect(_inkRadius(rgba, w, h), lessThan(0.5), reason: '$density: the circle would clip it');
        for (final (x, y) in [(0, 0), (w - 1, 0), (0, h - 1), (w - 1, h - 1)]) {
          expect(_pixel(rgba, w, x, y)[3], 0, reason: '$density: corner ($x,$y)');
        }
        expect(_colourShare(rgba, w, h, BrandGlyph.light), greaterThan(0.08), reason: '$density round');
        expect(_colourShare(rgba, w, h, BrandGlyph.bellyFill), greaterThan(0.02), reason: '$density round belly');
      }
    });

    testWidgets('the adaptive foreground sits inside the 66 % safe zone', (tester) async {
      for (final density in densities) {
        final (w, h, rgba) = await _decodePng(tester, '$res/mipmap-$density/ic_launcher_foreground.png');
        expect(w, (108 * dpr[density]!).round(), reason: density);
        final box = _inkBox(rgba, w, h);
        expect(box.left, greaterThanOrEqualTo(w * 0.167), reason: density);
        expect(box.top, greaterThanOrEqualTo(h * 0.167), reason: density);
        expect(box.right, lessThanOrEqualTo(w * 0.833), reason: density);
        expect(box.bottom, lessThanOrEqualTo(h * 0.833), reason: density);
        // The documented 66 dp circle of the 108 dp canvas: 33 / 108 = 0.306.
        expect(_inkRadius(rgba, w, h), lessThanOrEqualTo(0.306), reason: '$density: 66 dp circle');
        expect(_colourShare(rgba, w, h, BrandGlyph.light), greaterThan(0.04), reason: '$density foreground');
        expect(
          _colourShare(rgba, w, h, BrandGlyph.bellyFill),
          greaterThan(0.012),
          reason: '$density foreground belly',
        );

        final (mw, mh, mono) = await _decodePng(tester, '$res/mipmap-$density/ic_launcher_monochrome.png');
        expect((mw, mh), (w, h), reason: density);
        final monoBox = _inkBox(mono, mw, mh);
        expect(monoBox, box, reason: '$density: the monochrome layer is the same silhouette');
        _expectFlatInk(mono, mw, mh, const Color(0xFFFFFFFF), '$density monochrome');
        // Body + tusk only: none of the painted detail.
        expect(_colourShare(mono, mw, mh, BrandGlyph.light), 0, reason: '$density: no blue');
        expect(_colourShare(mono, mw, mh, BrandGlyph.bellyFill), 0, reason: '$density: no belly');
      }
    });

    testWidgets('the notification icon is the same silhouette, in white', (tester) async {
      for (final density in densities) {
        final (w, h, rgba) = await _decodePng(tester, '$res/drawable-$density/ic_stat_narwhal.png');
        expect(w, (24 * dpr[density]!).round(), reason: density);
        final box = _inkBox(rgba, w, h);
        expect(box.left, greaterThan(0), reason: '$density: left edge');
        expect(box.right, lessThan(w.toDouble()), reason: '$density: right edge');
        expect(box.width / w, greaterThan(0.85), reason: '$density: fills the slot');
        _expectFlatInk(rgba, w, h, const Color(0xFFFFFFFF), '$density notification');
      }
    });

    testWidgets('the picker preview is the shipped foreground', (tester) async {
      // The preview paints the visible 72 of the 108 grid; at 4 px per grid
      // unit (the xxxhdpi foreground) that is a 288 px square, the (18, 18)
      // origin of the layer map.
      const unit = 4;
      const side = 72 * unit;
      const origin = 18 * unit;
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.reset);
      final key = GlobalKey();
      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: Center(
            child: RepaintBoundary(
              key: key,
              child: const AppIconPreview(AppIcon.mist, size: side * 1.0),
            ),
          ),
        ),
      );
      await tester.pump();
      final preview = (await tester.runAsync(() async {
        final boundary = key.currentContext!.findRenderObject()! as RenderRepaintBoundary;
        return (await boundary.toImage()).toByteData();
      }))!;
      final drawn = preview.buffer.asUint8List();
      final (w, h, png) = await _decodePng(tester, '$res/mipmap-xxxhdpi/ic_launcher_foreground.png');
      expect((w, h), (432, 432));

      // Same ink, where the two overlap (the vector paths and the 4x-supersampled
      // PNG differ by their antialiasing along the outline).
      var both = 0, either = 0;
      for (var y = 0; y < side; y++) {
        for (var x = 0; x < side; x++) {
          final a = png[((y + origin) * w + (x + origin)) * 4 + 3] > 127;
          final b = drawn[(y * side + x) * 4 + 3] > 127;
          if (a && b) both++;
          if (a || b) either++;
        }
      }
      // The same ink box, and the same palette: body, belly and eye.
      final shown = _inkBox(drawn, side, side);
      final shippedFull = _inkBox(png, w, h);
      final shipped = Rect.fromLTRB(
        shippedFull.left - origin,
        shippedFull.top - origin,
        shippedFull.right - origin,
        shippedFull.bottom - origin,
      );
      expect(both / either, greaterThan(0.97), reason: 'preview vs res overlap');
      expect((shown.left - shipped.left).abs(), lessThanOrEqualTo(2), reason: 'left edge');
      expect((shown.top - shipped.top).abs(), lessThanOrEqualTo(2), reason: 'top edge');
      expect((shown.right - shipped.right).abs(), lessThanOrEqualTo(2), reason: 'right edge');
      expect((shown.bottom - shipped.bottom).abs(), lessThanOrEqualTo(2), reason: 'bottom edge');
      expect(_colourShare(drawn, side, side, BrandGlyph.light), greaterThan(0.04), reason: 'preview body');
      expect(_colourShare(drawn, side, side, BrandGlyph.bellyFill), greaterThan(0.012), reason: 'preview belly');
    });
  });

  goldenBoth(
    'app_icon_picker',
    _page,
    overrides: () => [launcherIconChannelProvider.overrideWithValue(_FakeLauncher(current: AppIcon.night))],
  );
}
