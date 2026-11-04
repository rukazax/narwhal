import 'dart:ui';

import '../../shell/brand_glyph.g.dart';
import '../../shell/brand_glyph_paint.dart';

/// The Narwhal the Android launcher draws, as the same vector art the app uses.
///
/// The layers in `res/mipmap-*/ic_launcher*_foreground.png` are rasterised from
/// the S1 master (`artifacts/make_narwhal_s1.py`); the paths are
/// [BrandGlyph]'s, generated from the same geometry. [grid] is where the
/// foreground puts the ink in the launcher's 108 grid (inside the 66% safe
/// zone), so the picker's preview and the shipped PNG cover the same pixels.
abstract final class LauncherNarwhal {
  /// The body colour of the shipped icon: DeepSeek blue #4D6BFE. Keeps 4.3:1
  /// contrast on white and on #121212.
  static const color = BrandGlyph.light;

  /// The foreground's ink box in the launcher's 108 grid.
  static const grid = BrandGlyph.launcherGrid;

  /// Draws the mark with its ink box at [grid]: the launcher's 108 grid.
  static void draw(Canvas canvas) {
    final scale = grid.width / BrandGlyph.box.width;
    canvas
      ..save()
      ..translate(grid.center.dx, grid.center.dy)
      ..scale(scale)
      ..translate(-BrandGlyph.box.center.dx, -BrandGlyph.box.center.dy);
    paintNarwhal(canvas, body: color);
    canvas.restore();
  }
}
