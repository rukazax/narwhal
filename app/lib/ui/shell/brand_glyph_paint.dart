import 'dart:ui';

import 'brand_glyph.g.dart';

/// Paints the Narwhal glyph, in the [BrandGlyph] grid, at the canvas's current
/// scale: body, light belly with its grey rim and four rib grooves, the white
/// eye patch and blue pupil, and the tusk with its thread cuts.
///
/// [body] is the body and tusk colour — [BrandGlyph.light] on light pages,
/// [BrandGlyph.dark] on dark ones, or a flat tint. [mono] keeps only the body and
/// the tusk, one flat silhouette in [body] (the themed-icon/notification shape).
///
/// The order and the clipping are the master's (`artifacts/make_narwhal_s1.py`):
/// the belly and the eye are cut to the body's outline, the pupil and the tusk go
/// over them, and the thread cuts are cut to the tusk.
void paintNarwhal(Canvas canvas, {required Color body, bool mono = false}) {
  canvas.drawPath(BrandGlyph.body, Paint()..color = body);
  if (mono) {
    canvas.drawPath(BrandGlyph.tusk, Paint()..color = body);
    return;
  }

  canvas
    ..save()
    ..clipPath(BrandGlyph.body);
  canvas.drawPath(BrandGlyph.belly, Paint()..color = BrandGlyph.bellyFill);
  canvas.drawPath(BrandGlyph.bellyRim, _stroke(BrandGlyph.rim, BrandGlyph.bellyRimWidth));
  for (final rib in BrandGlyph.ribs) {
    canvas.drawPath(rib, _stroke(BrandGlyph.rim, BrandGlyph.ribWidth));
  }
  canvas.drawPath(BrandGlyph.eye, Paint()..color = BrandGlyph.eyeFill);
  canvas.restore();

  canvas.drawPath(BrandGlyph.pupil, Paint()..color = BrandGlyph.light);
  canvas.drawPath(BrandGlyph.tusk, Paint()..color = body);

  canvas
    ..save()
    ..clipPath(BrandGlyph.tusk);
  canvas.drawPath(BrandGlyph.threads, _stroke(BrandGlyph.thread, BrandGlyph.threadWidth));
  canvas.drawPath(BrandGlyph.threadTails, _stroke(BrandGlyph.thread, BrandGlyph.threadTailWidth));
  canvas.restore();
}

Paint _stroke(Color color, double width) => Paint()
  ..style = PaintingStyle.stroke
  ..strokeWidth = width
  ..color = color;
