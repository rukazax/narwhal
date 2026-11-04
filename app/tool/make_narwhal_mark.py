#!/usr/bin/env python3
"""Generates lib/ui/shell/brand_glyph.g.dart: the Narwhal as Flutter paths.

Run from app/:

    python3 tool/make_narwhal_mark.py

The art is the accepted "S1 narwhal" master, tool/narwhal_master.py: a
Catmull-Rom body polygon (BASE), a light rounded belly with a grey rim and four
rib grooves, a white eye patch with a blue pupil, and a short tusk with four
diagonal thread cuts. The same geometry is rasterised for the launcher by
artifacts/make_narwhal_icons.py; this file writes the vector twin so the in-app
mark and the icon never drift apart.

Coordinates are the launcher's 108 grid, the system the widget layer already
uses. The mark keeps the old glyph's vertical extent (its ink box is still
29.3274...78.6726 tall), so the drawer's lockup height does not move; the
Narwhal is a longer animal, so the box is wider (aspect 1.72).

Every Catmull-Rom segment is an exact cubic Bezier, so the emitted `body` is the
same curve Pillow draws (it samples the same spline). Ovals and arcs are emitted
as `addOval`/`addArc`, the thread cuts as short polylines.
"""
import math
import os

APP = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OUT = os.path.join(APP, 'lib', 'ui', 'shell', 'brand_glyph.g.dart')
# The accepted S1 master lives beside the fork, in dsh_mobile/artifacts/.
S1_PATH = os.path.join(APP, 'tool', 'narwhal_master.py')
GRID = 108.0
CENTRE = GRID / 2

# The old glyph's ink box tall side (brand_glyph.g.dart before the rebrand):
# the new mark keeps it so the drawer lockup's height stays put.
KEEP_HEIGHT = 49.3452

# S1 parameters, mirrored from artifacts/make_narwhal_s1.build().
TUSK_LEN = 0.205
TUSK_ANGLE = -36
TUSK_BASE_W = 0.036
TUSK_TIP_W = 0.004
TUSK_START = (0.775, 0.415)
BELLY_C = (0.47, 0.485)
BELLY_R = (0.205, 0.130)
BELLY_RIM_W = 0.013
RIB_W = 0.008
EYE_C = (0.705, 0.375)
EYE_R = (0.05, 0.042)
PUPIL_R = 0.013
THREAD_W = 0.007
THREAD_TAIL_W = 0.004
THREADS = 4

COLOURS = {
    'light': '#4D6BFE',
    'dark': '#6E86FF',
    'belly': '#E8ECF6',
    'rim': '#A0AABA',
    'thread': '#96AAFA',
    'eye': '#FFFFFF',
}


def catmull(points, samples=16):
    """The S1 sampler (same as make_narwhal_s1.catmull), used for measurements."""
    pts, n = [], len(points)
    for i in range(n):
        p0, p1, p2, p3 = points[i - 1], points[i], points[(i + 1) % n], points[(i + 2) % n]
        for j in range(samples):
            t = j / samples
            t2, t3 = t * t, t * t * t
            x = 0.5 * ((2 * p1[0]) + (-p0[0] + p2[0]) * t + (2 * p0[0] - 5 * p1[0] + 4 * p2[0] - p3[0]) * t2
                       + (-p0[0] + 3 * p1[0] - 3 * p2[0] + p3[0]) * t3)
            y = 0.5 * ((2 * p1[1]) + (-p0[1] + p2[1]) * t + (2 * p0[1] - 5 * p1[1] + 4 * p2[1] - p3[1]) * t2
                       + (-p0[1] + 3 * p1[1] - 3 * p2[1] + p3[1]) * t3)
            pts.append((x, y))
    return pts


def s1_module():
    """BASE polygon from the accepted master (imported, never copied)."""
    import importlib.util
    spec = importlib.util.spec_from_file_location('narwhal_s1', S1_PATH)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


BASE = s1_module().BASE


def tusk_polygon():
    sx, sy = TUSK_START
    a = math.radians(TUSK_ANGLE)
    tx, ty = sx + TUSK_LEN * math.cos(a), sy + TUSK_LEN * math.sin(a)
    nx, ny = math.cos(a + math.pi / 2), math.sin(a + math.pi / 2)
    return [
        (sx + nx * TUSK_BASE_W, sy + ny * TUSK_BASE_W),
        (tx + nx * TUSK_TIP_W, ty + ny * TUSK_TIP_W),
        (tx - nx * TUSK_TIP_W, ty - ny * TUSK_TIP_W),
        (sx - nx * TUSK_BASE_W, sy - ny * TUSK_BASE_W),
    ]


def signed_area(poly):
    a = 0.0
    for (x0, y0), (x1, y1) in zip(poly, poly[1:] + poly[:1]):
        a += x0 * y1 - x1 * y0
    return a / 2


def centroid_of(poly):
    a = cx = cy = 0.0
    for (x0, y0), (x1, y1) in zip(poly, poly[1:] + poly[:1]):
        k = x0 * y1 - x1 * y0
        a += k
        cx += (x0 + x1) * k
        cy += (y0 + y1) * k
    return a / 2, cx / (6 * (a / 2)), cy / (6 * (a / 2))


def ink_measurements():
    """Ink box, aspect and area centroid over body + tusk (same orientation)."""
    body = catmull(BASE, 64)
    tusk = tusk_polygon()
    if signed_area(tusk) * signed_area(body) < 0:
        tusk = list(reversed(tusk))
    xs = [x for x, _ in body + tusk]
    ys = [y for _, y in body + tusk]
    box = (min(xs), min(ys), max(xs), max(ys))
    a_body, x_body, y_body = centroid_of(body)
    a_tusk, x_tusk, y_tusk = centroid_of(tusk)
    area = a_body + a_tusk
    cx = (a_body * x_body + a_tusk * x_tusk) / area
    cy = (a_body * y_body + a_tusk * y_tusk) / area
    return box, cx, cy


BOX, CENTROID_X, CENTROID_Y = ink_measurements()
ASPECT = (BOX[2] - BOX[0]) / (BOX[3] - BOX[1])


class Grid:
    """Master coordinates -> the 108 grid, centred, KEEP_HEIGHT tall."""

    scale = KEEP_HEIGHT / (BOX[3] - BOX[1])
    cx = (BOX[0] + BOX[2]) / 2
    cy = (BOX[1] + BOX[3]) / 2

    @classmethod
    def p(cls, point):
        return (CENTRE + (point[0] - cls.cx) * cls.scale, CENTRE + (point[1] - cls.cy) * cls.scale)

    @classmethod
    def r(cls, value):
        return value * cls.scale


def f(v):
    s = f'{v:.4f}'.rstrip('0').rstrip('.')
    return '0' if s in ('-0', '') else s


def dart_colour(name):
    return 'Color(0xFF' + COLOURS[name][1:].upper() + ')'


def body_path():
    """Catmull-Rom BASE -> one closed path of exact cubic Beziers."""
    n = len(BASE)
    lines = ['Path()']
    p1 = Grid.p(BASE[0])
    lines.append(f'    ..moveTo({f(p1[0])}, {f(p1[1])})')
    for i in range(n):
        p0 = BASE[i - 1]
        p1 = BASE[i]
        p2 = BASE[(i + 1) % n]
        p3 = BASE[(i + 2) % n]
        c1 = Grid.p((p1[0] + (p2[0] - p0[0]) / 6, p1[1] + (p2[1] - p0[1]) / 6))
        c2 = Grid.p((p2[0] - (p3[0] - p1[0]) / 6, p2[1] - (p3[1] - p1[1]) / 6))
        end = Grid.p(p2)
        lines.append(f'    ..cubicTo({f(c1[0])}, {f(c1[1])}, {f(c2[0])}, {f(c2[1])}, {f(end[0])}, {f(end[1])})')
    lines.append('    ..close()')
    return '\n'.join(lines)


def oval_path(cx, cy, rx, ry):
    return f'Path()\n    ..addOval(Rect.fromLTRB({f(cx - rx)}, {f(cy - ry)}, {f(cx + rx)}, {f(cy + ry)}))'


def arc_path(cx, cy, rx, ry, start_deg, sweep_deg):
    return (f'Path()\n    ..addArc(Rect.fromLTRB({f(cx - rx)}, {f(cy - ry)}, {f(cx + rx)}, {f(cy + ry)}), '
            f'{start_deg * math.pi / 180:.6f}, {sweep_deg * math.pi / 180:.6f})')


def polygon_path(points):
    out = ['Path()']
    first = points[0]
    out.append(f'    ..moveTo({f(first[0])}, {f(first[1])})')
    for p in points[1:]:
        out.append(f'    ..lineTo({f(p[0])}, {f(p[1])})')
    out.append('    ..close()')
    return '\n'.join(out)


def thread_paths():
    """The four screw-thread cuts, split by stroke width (thick cut, thin tail)."""
    sx, sy = Grid.p(TUSK_START)
    a = math.radians(TUSK_ANGLE)
    tx = sx + Grid.r(TUSK_LEN) * math.cos(a)
    ty = sy + Grid.r(TUSK_LEN) * math.sin(a)
    nx, ny = math.cos(a + math.pi / 2), math.sin(a + math.pi / 2)
    base_w = Grid.r(TUSK_BASE_W)
    thick, thin = ['Path()'], ['Path()']
    for i in range(THREADS):
        t = 0.08 + 0.62 * i / max(1, THREADS - 1)
        px, py = sx + (tx - sx) * t, sy + (ty - sy) * t
        w = base_w * (1 - t) * 0.9
        cut = (px - nx * w, py - ny * w)
        mid = (px + nx * w * 0.35, py + ny * w * 0.35)
        tail = (px + nx * w * 0.7, py + ny * w * 0.7 - 0.02 * Grid.scale * math.sin(a))
        thick.append(f'    ..moveTo({f(cut[0])}, {f(cut[1])})')
        thick.append(f'    ..lineTo({f(mid[0])}, {f(mid[1])})')
        thin.append(f'    ..moveTo({f(mid[0])}, {f(mid[1])})')
        thin.append(f'    ..lineTo({f(tail[0])}, {f(tail[1])})')
    return '\n'.join(thick), '\n'.join(thin)


def launcher_grid():
    """Where the launcher foreground puts the ink, in the 108 grid.

    Same rule as artifacts/make_narwhal_icons.py: centred, inside the 66 dp
    circle (farthest ink at 31.32 of 108), rendered by `LauncherNarwhal`.
    """
    body = catmull(BASE, 64) + tusk_polygon()
    cx = (BOX[0] + BOX[2]) / 2
    cy = (BOX[1] + BOX[3]) / 2
    far = max(math.hypot(x - cx, y - cy) for x, y in body)
    fraction = min(0.62, 0.29 * (BOX[2] - BOX[0]) / far)
    width = fraction * GRID
    height = width / ASPECT
    return 54 - width / 2, 54 - height / 2, width, height


def main():
    box = (Grid.p((BOX[0], BOX[1]))[0], Grid.p((BOX[0], BOX[1]))[1],
           Grid.p((BOX[2], BOX[3]))[0], Grid.p((BOX[2], BOX[3]))[1])
    centroid = Grid.p((CENTROID_X, CENTROID_Y))
    bx, by = Grid.p(BELLY_C)
    brx, bry = Grid.r(BELLY_R[0]), Grid.r(BELLY_R[1])
    ex, ey = Grid.p(EYE_C)
    erx, ery = Grid.r(EYE_R[0]), Grid.r(EYE_R[1])
    pr = Grid.r(PUPIL_R)
    tusk = [Grid.p(p) for p in tusk_polygon()]
    thick, thin = thread_paths()
    lg = launcher_grid()
    angle = math.radians(TUSK_ANGLE)
    sx, sy = Grid.p(TUSK_START)
    nx, ny = math.cos(angle + math.pi / 2), math.sin(angle + math.pi / 2)
    base_w = Grid.r(TUSK_BASE_W)
    tip_w = Grid.r(TUSK_TIP_W)

    out = f'''// GENERATED by tool/make_narwhal_mark.py from the accepted S1 narwhal master
// (tool/narwhal_master.py). Do not edit; change the master and run the tool.
//
// The Narwhal in the launcher's 108 grid: a blue body, a light rounded belly with
// a grey rim and four rib grooves, a white eye patch with a blue pupil, and a
// short tusk with four thread cuts. The same drawing, fitted to the 66% safe
// zone, is `mipmap-*/ic_launcher_foreground.png`; the icon and this mark come
// from one geometry.

// dart format off
import 'dart:ui' show Color, Offset, Path, Rect;

/// Path, colours and measurements of the app mark (see `brand_mark.dart`).
abstract final class BrandGlyph {{
  /// The glyph's ink box (tail, head and tusk), in the 108 grid.
  static const box = Rect.fromLTRB({f(box[0])}, {f(box[1])}, {f(box[2])}, {f(box[3])});

  /// Width / height of [box].
  static const aspect = {ASPECT:.6f};

  /// Visual centre: the area centroid of the body and tusk ink, in the grid.
  static const centroid = Offset({f(centroid[0])}, {f(centroid[1])});

  /// Where the launcher foreground's ink sits in the 108 grid (66% safe zone).
  static const launcherGrid = Rect.fromLTWH({f(lg[0])}, {f(lg[1])}, {f(lg[2])}, {f(lg[3])});

  /// The body on light pages.
  static const light = {dart_colour('light')};

  /// The body on dark pages, a little lighter so it reads on night surfaces.
  static const dark = {dart_colour('dark')};

  /// The light belly patch.
  static const bellyFill = {dart_colour('belly')};

  /// The belly rim and the rib grooves.
  static const rim = {dart_colour('rim')};

  /// The tusk's thread cuts.
  static const thread = {dart_colour('thread')};

  /// The eye patch; [light] fills the pupil.
  static const eyeFill = {dart_colour('eye')};

  /// Stroke widths in grid units (the S1 belly rim, ribs and thread cuts).
  static const bellyRimWidth = {f(Grid.r(BELLY_RIM_W))};
  static const ribWidth = {f(Grid.r(RIB_W))};
  static const threadWidth = {f(Grid.r(THREAD_W))};
  static const threadTailWidth = {f(Grid.r(THREAD_TAIL_W))};

  /// The body, one closed outline; [light] or [dark] fills it.
  static final Path body = {body_path()};

  /// The belly patch (filled with [bellyFill]).
  static final Path belly = {oval_path(bx, by, brx, bry)};

  /// The belly's rim, stroked with [rim] at [bellyRimWidth].
  static final Path bellyRim = {oval_path(bx, by, brx, bry)};

  /// Four rib grooves, stroked with [rim] at [ribWidth].
  static final List<Path> ribs = [
{chr(10).join('    ' + arc_path(bx, by, brx * (1 - 0.17 * (i + 1)), bry * (1 - 0.19 * (i + 1)), 18, 144).replace(chr(10), chr(10) + '    ') + ',' for i in range(4))}
  ];

  /// The tusk, embedded in the head; [light] or [dark] fills it.
  static final Path tusk = {polygon_path(tusk)};

  /// The tusk's four thread cuts, stroked with [thread] at [threadWidth].
  static final Path threads = {thick};

  /// The thin ends of the thread cuts, at [threadTailWidth].
  static final Path threadTails = {thin};

  /// The white eye patch.
  static final Path eye = {oval_path(ex, ey, erx, ery)};

  /// The pupil, filled with [light].
  static final Path pupil = {oval_path(ex, ey, pr, pr)};
}}
'''
    os.makedirs(os.path.dirname(OUT), exist_ok=True)
    with open(OUT, 'w', encoding='utf-8') as fh:
        fh.write(out)
    print(f'wrote {os.path.relpath(OUT, APP)}')
    print(f'  box {box}, aspect {ASPECT:.4f}, centroid ({centroid[0]:.3f}, {centroid[1]:.3f})'
          f' = ({(centroid[0] - box[0]) / (box[2] - box[0]):.4f}, {(centroid[1] - box[1]) / (box[3] - box[1]):.4f}) of the box')
    print(f'  launcher grid {lg[0]:.4f}, {lg[1]:.4f} {lg[2]:.4f} x {lg[3]:.4f}')
    print(f'  scale {Grid.scale:.4f} units/master; strokes rim {Grid.r(BELLY_RIM_W):.3f} '
          f'rib {Grid.r(RIB_W):.3f} thread {Grid.r(THREAD_W):.3f}')
    print(f'  tusk base {base_w:.3f} tip {tip_w:.3f} normal ({nx:.3f}, {ny:.3f}) start ({sx:.3f}, {sy:.3f})')


if __name__ == '__main__':
    main()
