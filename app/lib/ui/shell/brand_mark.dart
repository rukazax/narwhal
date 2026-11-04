import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../state/app_info.dart';
import '../theme/theme.dart';
import 'brand_glyph.g.dart';
import 'brand_glyph_paint.dart';

/// The Narwhal mark: a blue whale in profile, facing right, with a rounded light
/// belly, a small white eye patch and a short tusk.
///
/// The paths are generated from the accepted S1 narwhal master
/// (`artifacts/make_narwhal_s1.py`, by `tool/make_narwhal_mark.py`), in the
/// launcher icon's 108 grid and fitted to the same geometry, so the mark and the
/// launcher icon (`android/app/src/main/res/mipmap-*/ic_launcher_foreground.png`)
/// never drift apart.
///
/// - By default the colour mark: [BrandGlyph.light] body on light pages, the
///   lighter [BrandGlyph.dark] on dark ones, picked by the theme; the belly,
///   rim, ribs, eye and thread cuts keep their own colours.
/// - [color]: one flat tint (a quiet footer, white on the poster card): body and
///   tusk only.
/// - [tile]: the same mark in a square slot (splash, about, update, the QR
///   logo). The background is transparent: there is no tile square behind it.
class BrandMark extends StatelessWidget {
  const BrandMark({super.key, this.size = 28, this.color, this.tile = false});

  /// Height of the glyph (its width is [aspect] × this), or the side of the
  /// square slot when [tile] is true.
  final double size;

  /// A flat tint instead of the colour mark.
  final Color? color;

  /// Draw the mark in a square slot (splash, about, update, QR logo).
  final bool tile;

  /// Width / height of the glyph.
  static const aspect = BrandGlyph.aspect;

  /// The glyph's visual centre, the area centroid of its ink, as fractions of its
  /// width and height from the top left.
  static final visualCentre = Offset(
    (BrandGlyph.centroid.dx - BrandGlyph.box.left) / BrandGlyph.box.width,
    (BrandGlyph.centroid.dy - BrandGlyph.box.top) / BrandGlyph.box.height,
  );

  /// How far to move a glyph of height [size] so its visual centre, not its box,
  /// sits on the centre of the space it is centred in.
  static Offset opticalShift(double size) =>
      Offset((0.5 - visualCentre.dx) * size * aspect, (0.5 - visualCentre.dy) * size);

  @override
  Widget build(BuildContext context) {
    final tint = color;
    final style = tint != null
        ? _Style.mono
        : Theme.of(context).brightness == Brightness.dark
        ? _Style.dark
        : _Style.light;
    return Semantics(
      label: AppInfo.wordmark,
      image: true,
      child: CustomPaint(
        size: tile ? Size.square(size) : Size(size * aspect, size),
        painter: _BrandPainter(style, tint),
      ),
    );
  }
}

enum _Style { light, dark, mono }

class _BrandPainter extends CustomPainter {
  const _BrandPainter(this.style, this.color);

  final _Style style;
  final Color? color;

  @override
  void paint(Canvas canvas, Size size) {
    const box = BrandGlyph.box;
    // Fit the ink into the slot, centred: a glyph keeps its own aspect, and a
    // square tile slot centres the wider mark in it.
    final scale = math.min(size.width / box.width, size.height / box.height);
    canvas
      ..save()
      ..translate((size.width - box.width * scale) / 2, (size.height - box.height * scale) / 2)
      ..scale(scale)
      ..translate(-box.left, -box.top);
    paintNarwhal(canvas, body: _tint, mono: style == _Style.mono);
    canvas.restore();
  }

  Color get _tint => switch (style) {
    _Style.mono => color!,
    _Style.light => BrandGlyph.light,
    _Style.dark => BrandGlyph.dark,
  };

  @override
  bool shouldRepaint(_BrandPainter old) => old.style != style || old.color != color;
}

/// The glyph and a wordmark on one line.
///
/// Everything follows the word's size (0.95 × [height] by default, times the app's
/// text scale):
/// - the glyph is [glyphScale] × the word's size tall;
/// - its visual centre ([BrandMark.visualCentre]) sits on the centre of the word's
///   main band: the x-height for a lowercase word (「Narwhal」), the cap height for
///   capitals;
/// - [gapScale] × the word's size separates the glyph's ink from the word.
class BrandLockup extends StatelessWidget {
  const BrandLockup({
    super.key,
    this.height = 20,
    this.fontSize,
    this.label = AppInfo.wordmark,
    this.color,
    this.glyphColor,
  });

  /// The lockup's size; the word is set at 0.95 × this unless [fontSize] is given.
  final double height;

  /// The word's size, overriding the one derived from [height].
  final double? fontSize;

  final String label;

  /// The word's colour (default: onSurface).
  final Color? color;

  /// A flat glyph tint instead of the colour glyph.
  final Color? glyphColor;

  /// Glyph height / word size.
  static const glyphScale = 1.25;

  /// Gap between the glyph and the word / word size.
  static const gapScale = 0.36;

  /// x-height and cap height of the system sans, in ems (Roboto: 1082 and 1456 of
  /// 2048 units).
  static const xHeight = 0.528;
  static const capHeight = 0.711;

  /// Height above the baseline of the line the glyph centres on, for [label] set at
  /// [size].
  static double centreRise(String label, double size) =>
      (label.contains(RegExp('[a-z]')) ? xHeight : capHeight) * size / 2;

  /// Where the word starts, from the lockup's left edge, for a word drawn at [size]
  /// (after text scaling): glyph width + gap.
  static double wordInset(double size) => size * glyphScale * BrandMark.aspect + size * gapScale;

  double get _size => fontSize ?? height * 0.95;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    // The word's drawn size: the glyph and the gap scale with the text.
    final drawn = MediaQuery.textScalerOf(context).scale(_size);
    final glyph = drawn * glyphScale;
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        _GlyphBaseline(
          // A baseline this far below the glyph's top puts its visual centre on the
          // word's x-height (or cap-height) centre when the row aligns baselines.
          baseline: glyph * BrandMark.visualCentre.dy + centreRise(label, drawn),
          child: BrandMark(size: glyph, color: glyphColor),
        ),
        SizedBox(width: drawn * gapScale),
        Text(
          label,
          style: AppType.wordmark(size: _size, color: color ?? scheme.onSurface),
        ),
      ],
    );
  }
}

/// Reports [baseline] as its child's alphabetic baseline.
class _GlyphBaseline extends SingleChildRenderObjectWidget {
  const _GlyphBaseline({required this.baseline, required super.child});

  final double baseline;

  @override
  RenderObject createRenderObject(BuildContext context) => _RenderGlyphBaseline(baseline);

  @override
  void updateRenderObject(BuildContext context, _RenderGlyphBaseline renderObject) {
    renderObject.baseline = baseline;
  }
}

class _RenderGlyphBaseline extends RenderProxyBox {
  _RenderGlyphBaseline(this._baseline);

  double _baseline;

  set baseline(double value) {
    if (value == _baseline) return;
    _baseline = value;
    markNeedsLayout();
  }

  @override
  double? computeDistanceToActualBaseline(TextBaseline baseline) => _baseline;

  @override
  double? computeDryBaseline(BoxConstraints constraints, TextBaseline baseline) => _baseline;
}
