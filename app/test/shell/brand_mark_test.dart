// The brand mark and its lockup.
//
// - The generated glyph data (brand_glyph.g.dart) agrees with its own paths:
//   the ink box and the visual centre, re-measured on the drawn outlines of the
//   body and the tusk (the belly, ribs and eye are painted on the body, not cut
//   out of it).
// - The launcher foreground grid is the same box, in the 66% safe zone.
// - The widget's sizes.
// - Lockups at the drawer's and the share card's sizes and at a larger text
//   scale, measured (brand_support.dart); the share card's tagline hangs under
//   the word.
// - One golden sheet per theme: every variant at the sizes the app draws.
//
//   flutter test test/shell/brand_mark_test.dart

import 'dart:math' as math;

import 'package:dsh_app/ui/share/share_card.dart';
import 'package:dsh_app/ui/shell/brand_glyph.g.dart';
import 'package:dsh_app/ui/shell/brand_mark.dart';
import 'package:dsh_app/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../share/support.dart';
import 'brand_support.dart';
import 'golden_harness.dart';

/// Points every [step] grid units along every contour of [path].
List<List<Offset>> _outline(Path path, {double step = 0.02}) => [
  for (final metric in path.computeMetrics())
    [for (var d = 0.0; d < metric.length; d += step) metric.getTangentForOffset(d)!.position],
];

void main() {
  test('generated glyph data matches its paths', () {
    var area = 0.0;
    var cx = 0.0;
    var cy = 0.0;
    var box = Rect.zero;
    var first = true;
    // Body and tusk are the ink; the belly, ribs and eye are painted on top.
    for (final path in [BrandGlyph.body, BrandGlyph.tusk]) {
      for (final poly in _outline(path)) {
        for (var i = 0; i < poly.length; i++) {
          final a = poly[i];
          final b = poly[(i + 1) % poly.length];
          final k = a.dx * b.dy - b.dx * a.dy;
          area += k;
          cx += (a.dx + b.dx) * k;
          cy += (a.dy + b.dy) * k;
          final r = Rect.fromPoints(a, a);
          box = first ? r : box.expandToInclude(r);
          first = false;
        }
      }
    }
    area /= 2;
    final centroid = Offset(cx / (6 * area), cy / (6 * area));
    expect((centroid - BrandGlyph.centroid).distance, lessThan(0.02));
    expect(box.left, closeTo(BrandGlyph.box.left, 0.01));
    expect(box.top, closeTo(BrandGlyph.box.top, 0.01));
    expect(box.right, closeTo(BrandGlyph.box.right, 0.01));
    expect(box.bottom, closeTo(BrandGlyph.box.bottom, 0.01));
    expect(BrandGlyph.aspect, closeTo(BrandGlyph.box.width / BrandGlyph.box.height, 1e-5));
    // Visual centre: near the box's middle, across and down.
    expect(BrandMark.visualCentre.dy, inInclusiveRange(0.4, 0.6));
    expect((BrandMark.visualCentre.dx - 0.5).abs(), lessThan(0.05));
  });

  test('the launcher foreground grid is the same mark inside the safe zone', () {
    final grid = BrandGlyph.launcherGrid;
    // The ink box, at the aspect the paths have (the PNG is rasterised from it).
    expect(grid.width / grid.height, closeTo(BrandGlyph.aspect, 1e-4));
    // Centred on the 108 canvas.
    expect(grid.center.dx, closeTo(54, 1e-4));
    expect(grid.center.dy, closeTo(54, 1e-4));
    // Inside the 66% safe square.
    expect(grid.left, greaterThanOrEqualTo(108 * 0.167));
    expect(grid.top, greaterThanOrEqualTo(108 * 0.167));
    expect(grid.right, lessThanOrEqualTo(108 * 0.833));
    expect(grid.bottom, lessThanOrEqualTo(108 * 0.833));
    // And inside the 33 dp circle of the 66 dp canvas: the farthest ink, not the
    // box's corner (the tail is at one end, the tusk at the other). The paths are
    // in the mark's box; map them onto the launcher grid first.
    final scale = grid.width / BrandGlyph.box.width;
    Offset placed(Offset point) => (point - BrandGlyph.box.center) * scale + grid.center;
    var farthest = 0.0;
    for (final path in [BrandGlyph.body, BrandGlyph.tusk]) {
      for (final poly in _outline(path, step: 0.05)) {
        for (final point in poly) {
          farthest = math.max(farthest, (placed(point) - grid.center).distance);
        }
      }
    }
    expect(farthest, lessThanOrEqualTo(33));
  });

  testWidgets('sizes: the glyph keeps its aspect, the tile is square', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: buildLightTheme(),
        home: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            BrandMark(key: ValueKey('glyph'), size: 40),
            BrandMark(key: ValueKey('mono'), size: 18, color: Colors.black),
            BrandMark(key: ValueKey('tile'), size: 52, tile: true),
          ],
        ),
      ),
    );
    expect(tester.getSize(find.byKey(const ValueKey('glyph'))), Size(40 * BrandMark.aspect, 40));
    expect(tester.getSize(find.byKey(const ValueKey('mono'))), Size(18 * BrandMark.aspect, 18));
    expect(tester.getSize(find.byKey(const ValueKey('tile'))), const Size(52, 52));
    final shift = BrandMark.opticalShift(40);
    expect(shift.dy.abs(), lessThan(40 * 0.05));
    expect(shift.dx.abs(), lessThan(40 * BrandMark.aspect * 0.05));
  });

  group('lockup', () {
    Future<void> pumpLockup(WidgetTester tester, BrandLockup lockup, {double textScale = 1}) async {
      await tester.runAsync(loadGoldenFonts);
      usePhoneSurface(tester);
      await tester.pumpWidget(
        goldenApp(
          brightness: Brightness.light,
          home: Builder(
            builder: (context) => MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(textScale)),
              child: Scaffold(body: Center(child: lockup)),
            ),
          ),
        ),
      );
      await tester.pump();
    }

    testWidgets('「Narwhal」 at the drawer\'s size: centred on the x-height', (tester) async {
      await pumpLockup(tester, const BrandLockup(height: 19));
      await expectBrandLockup(tester, find.byType(BrandLockup));
    });

    testWidgets('「Narwhal」 at the share card\'s size: centred on the x-height', (tester) async {
      await pumpLockup(tester, const BrandLockup(fontSize: 17, label: 'Narwhal'));
      await expectBrandLockup(tester, find.byType(BrandLockup));
    });

    testWidgets('follows the text scale', (tester) async {
      await pumpLockup(tester, const BrandLockup(height: 19), textScale: 1.3);
      await expectBrandLockup(tester, find.byType(BrandLockup));
      final glyph = tester.getSize(find.byType(BrandMark));
      expect(glyph.height, closeTo(19 * 0.95 * 1.3 * BrandLockup.glyphScale, 0.01));
    });

    for (final template in [ShareTemplate.light, ShareTemplate.dark, ShareTemplate.card]) {
      testWidgets('share card brand line (${template.name}): the tagline under the word', (tester) async {
        await tester.runAsync(loadGoldenFonts);
        tester.view.devicePixelRatio = 2;
        tester.view.physicalSize = const Size(ShareCard.width * 2, 2400 * 2);
        addTearDown(tester.view.reset);
        await tester.pumpWidget(
          ProviderScope(
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: buildLightTheme(),
              locale: const Locale('zh', 'CN'),
              supportedLocales: const [Locale('zh', 'CN')],
              localizationsDelegates: GlobalMaterialLocalizations.delegates,
              home: Align(
                alignment: Alignment.topLeft,
                child: ShareCard(content: sampleReplyContent(), template: template),
              ),
            ),
          ),
        );
        await tester.pump();
        final word = await expectBrandLockup(tester, find.byType(BrandLockup));
        final tagline = tester.getRect(find.text('手机上的 DSH · 扫码获取'));
        expect(tagline.left, closeTo(word.left, 0.01));
        expect(tagline.top, greaterThanOrEqualTo(word.bottom));
      });
    }
  });

  for (final brightness in Brightness.values) {
    final mode = brightness == Brightness.dark ? 'dark' : 'light';
    testWidgets('sheet ($mode)', (tester) async {
      await tester.runAsync(loadGoldenFonts);
      tester.view.devicePixelRatio = 2;
      tester.view.physicalSize = const Size(390 * 2, 300 * 2);
      addTearDown(tester.view.reset);
      await tester.pumpWidget(
        goldenApp(
          brightness: brightness,
          home: Builder(
            builder: (context) {
              final colors = DshColors.of(context);
              Widget row(List<Widget> children) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: children,
              );
              return AppBackdrop(
                child: Material(
                  type: MaterialType.transparency,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        row(const [BrandMark(size: 18), BrandMark(size: 26), BrandMark(size: 40), BrandMark(size: 60)]),
                        row([
                          BrandMark(size: 18, color: colors.textDisabled),
                          const BrandMark(size: 26, color: Colors.white),
                          const BrandMark(size: 52, tile: true),
                          const BrandMark(size: 64, tile: true),
                        ]),
                        row(const [
                          BrandLockup(height: 19),
                          BrandLockup(fontSize: 17, label: 'Narwhal'),
                        ]),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );
      await tester.pump();
      await expectLater(find.byType(MaterialApp), matchesGoldenFile('goldens/brand_mark_$mode.png'));
    });
  }
}
