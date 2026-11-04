"""Narwhal launcher / notification icons from the accepted "S1 narwhal" master.

The artwork is the approved S1 mark: `narwhal_master.py` is its source of truth
(BASE polygon, Catmull-Rom sampling, belly/rib/eye/tusk parameters). This script
imports that polygon and re-renders the same layers with an explicit placement,
so one drawing serves every Android layer:

    ic_launcher{,_{default,frost,ink,night}}.png   48/72/96/144/192  full art, transparent
    ic_launcher*_round.png                         48/72/96/144/192  same art, inside the circle
    ic_launcher*_foreground.png                    108/162/216/324/432  centred in the 66% safe zone
    ic_launcher_monochrome.png                     108/.../432        white silhouette (alpha)
    drawable-*/ic_stat_narwhal.png                 24/36/48/72/96    white silhouette, full slot

Every image is rendered at 4x and downsampled with LANCZOS. The belly, its grey
rim, the four rib grooves, the eye (white with a blue pupil) and the tusk's four
thread cuts are the S1 layers; the monochrome/notification layers are the art's
alpha as flat white, which is body + tusk only (the belly, ribs and eye are all
inside the body silhouette).

    python tool/make_narwhal_icons.py [--out <app android res dir>]

Writes into dsh-Go/app/android/app/src/main/res by default.
"""
import argparse
import importlib.util
import math
import os
import shutil

from PIL import Image, ImageDraw

HERE = os.path.dirname(os.path.abspath(__file__))
DEFAULT_RES = os.path.join(
    os.path.dirname(HERE), 'dsh-Go', 'app', 'android', 'app', 'src', 'main', 'res'
)

BLUE = (77, 107, 254, 255)      # #4D6BFE
BELLY = (232, 236, 246, 255)    # #E8ECF6
GREY = (160, 170, 190, 255)     # #A0AABA
THREAD = (150, 170, 250, 255)   # #96AAFA
WHITE = (255, 255, 255, 255)
CLEAR = (0, 0, 0, 0)
BG = (233, 239, 255, 255)       # #E9EFFF, the launcher tile behind the Narwhal


def composite(image, color):
    """[image] over a solid tile: launcher icons need a background, not alpha."""
    out = Image.new('RGBA', image.size, color)
    out.alpha_composite(image)
    return out

# S1 parameters, mirrored from make_narwhal_s1.build(): the accepted drawing.
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

SS = 4  # supersampling factor


def master():
    """make_narwhal_s1 as a module: BASE and the Catmull-Rom sampler."""
    path = os.path.join(HERE, 'narwhal_master.py')
    spec = importlib.util.spec_from_file_location('narwhal_s1', path)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


S1 = master()
BASE = S1.BASE


def tusk_polygon():
    """The S1 tusk quad, in normalized master coordinates."""
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


def art_bbox():
    """Ink box of body + tusk, the visual box the icons centre on."""
    body = S1.catmull(BASE, 64)
    pts = body + tusk_polygon()
    xs = [p[0] for p in pts]
    ys = [p[1] for p in pts]
    return min(xs), min(ys), max(xs), max(ys)


BBOX = art_bbox()
ASPECT = (BBOX[2] - BBOX[0]) / (BBOX[3] - BBOX[1])


def ink_metrics(image):
    """(bbox, farthest-ink-radius) of an RGBA image, alpha > 16, in pixels."""
    w, h = image.size
    alpha = image.getchannel('A')
    box = alpha.point(lambda v: 255 if v > 16 else 0).getbbox() or (0, 0, w, h)
    cx, cy = w / 2, h / 2
    farthest = 0.0
    px = alpha.load()
    for y in range(h):
        for x in range(w):
            if px[x, y] > 16:
                farthest = max(farthest, math.hypot(x + 0.5 - cx, y + 0.5 - cy))
    return box, farthest


def render(size, width_fraction):
    """The S1 art on a transparent `size` square, ink box `width_fraction` wide."""
    n = size * SS
    minx, miny, maxx, maxy = BBOX
    scale = width_fraction * n / (maxx - minx)
    cx, cy = (minx + maxx) / 2, (miny + maxy) / 2

    def xy(p):
        return (n / 2 + (p[0] - cx) * scale, n / 2 + (p[1] - cy) * scale)

    body = Image.new('RGBA', (n, n), CLEAR)
    ImageDraw.Draw(body).polygon([xy(p) for p in S1.catmull(BASE, 64)], fill=BLUE)
    body_mask = body.getchannel('A')

    def clipped(layer):
        layer.putalpha(Image.composite(layer.getchannel('A'), Image.new('L', layer.size, 0), body_mask))
        body.alpha_composite(layer)
        return layer

    def ellipse(centre, radii, fill=None, outline=None, width=0):
        bx, by = xy(centre)
        brx, bry = radii[0] * scale, radii[1] * scale
        box = (bx - brx, by - bry, bx + brx, by + bry)
        return box, bx, by, brx, bry

    # Belly: light fill with the grey rim.
    layer = Image.new('RGBA', (n, n), CLEAR)
    box, bx, by, brx, bry = ellipse(BELLY_C, BELLY_R)
    ImageDraw.Draw(layer).ellipse(box, fill=BELLY, outline=GREY, width=max(1, int(BELLY_RIM_W * scale)))
    clipped(layer)

    # Four rib grooves along the belly, parallel to its rim.
    belly_mask = Image.new('L', (n, n), 0)
    ImageDraw.Draw(belly_mask).ellipse(box, fill=255)
    ribs = Image.new('RGBA', (n, n), CLEAR)
    rd = ImageDraw.Draw(ribs)
    for i in range(4):
        k = i + 1
        rx, ry = brx * (1 - 0.17 * k), bry * (1 - 0.19 * k)
        rd.arc((bx - rx, by - ry, bx + rx, by + ry), 18, 162, fill=GREY, width=max(1, int(RIB_W * scale)))
    ribs.putalpha(Image.composite(ribs.getchannel('A'), Image.new('L', ribs.size, 0), belly_mask))
    clipped(ribs)

    # Eye: a white patch with a blue pupil.
    ex, ey = xy(EYE_C)
    erx, ery = EYE_R[0] * scale, EYE_R[1] * scale
    eye = Image.new('RGBA', (n, n), CLEAR)
    ImageDraw.Draw(eye).ellipse((ex - erx, ey - ery, ex + erx, ey + ery), fill=WHITE)
    clipped(eye)
    d = ImageDraw.Draw(body)
    pr = PUPIL_R * scale
    d.ellipse((ex - pr, ey - pr, ex + pr, ey + pr), fill=BLUE)

    # Tusk: embedded in the head, with four diagonal thread cuts.
    sx, sy = xy(TUSK_START)
    a = math.radians(TUSK_ANGLE)
    tx, ty = sx + TUSK_LEN * scale * math.cos(a), sy + TUSK_LEN * scale * math.sin(a)
    nx, ny = math.cos(a + math.pi / 2), math.sin(a + math.pi / 2)
    base_w, tip_w = TUSK_BASE_W * scale, TUSK_TIP_W * scale
    tusk = [
        (sx + nx * base_w, sy + ny * base_w),
        (tx + nx * tip_w, ty + ny * tip_w),
        (tx - nx * tip_w, ty - ny * tip_w),
        (sx - nx * base_w, sy - ny * base_w),
    ]
    d.polygon(tusk, fill=BLUE)

    tusk_mask = Image.new('L', (n, n), 0)
    ImageDraw.Draw(tusk_mask).polygon(tusk, fill=255)
    thread = Image.new('RGBA', (n, n), CLEAR)
    td = ImageDraw.Draw(thread)
    for i in range(THREADS):
        t = 0.08 + 0.62 * i / max(1, THREADS - 1)
        px_, py_ = sx + (tx - sx) * t, sy + (ty - sy) * t
        w = base_w * (1 - t) * 0.9
        td.line(
            [(px_ - nx * w, py_ - ny * w), (px_ + nx * w * 0.35, py_ + ny * w * 0.35)],
            fill=THREAD,
            width=max(1, int(THREAD_W * scale)),
        )
        td.line(
            [(px_ + nx * w * 0.35, py_ + ny * w * 0.35),
             (px_ + nx * w * 0.7, py_ + ny * w * 0.7 - 0.02 * scale * math.sin(a))],
            fill=THREAD,
            width=max(1, int(THREAD_TAIL_W * scale)),
        )
    thread.putalpha(Image.composite(thread.getchannel('A'), Image.new('L', thread.size, 0), tusk_mask))
    body.alpha_composite(thread)

    # Area average, not LANCZOS: no ringing halo, so the ink box is exactly the
    # fraction asked for at every density (the picker test measures alpha > 16).
    return body.resize((size, size), Image.BOX)


def silhouette(image):
    """[image]'s alpha as flat white: body + tusk, no belly, ribs or eye."""
    out = Image.new('RGBA', image.size, WHITE)
    out.putalpha(image.getchannel('A'))
    return out


def safe_fraction():
    """The widest the art can be and still sit inside Android's 66% safe zone.

    The 66 dp circle of the 108 dp canvas has radius 33; keep the farthest ink
    point at 31.32 (0.29 of 108) so antialiasing never touches 33. Computed on
    the outline itself (the same formula the Dart mark generator uses), so both
    drawings get the same box.
    """
    poly = S1.catmull(BASE, 64) + tusk_polygon()
    minx, miny, maxx, maxy = BBOX
    cx, cy = (minx + maxx) / 2, (miny + maxy) / 2
    far = max(math.hypot(x - cx, y - cy) for x, y in poly)
    return min(0.62, 0.29 * (maxx - minx) / far)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--out', default=DEFAULT_RES)
    args = ap.parse_args()
    res = args.out
    if not os.path.isdir(res):
        raise SystemExit(f'not a res directory: {res}')

    densities = {'mdpi': 1, 'hdpi': 1.5, 'xhdpi': 2, 'xxhdpi': 3, 'xxxhdpi': 4}
    styles = ['', '_frost', '_ink', '_night']

    foreground_fraction = 0.80
    print(f'art box {BBOX}, aspect {ASPECT:.4f}')
    print(f'legacy 0.94 on #E9EFFF | round 0.94 | foreground {foreground_fraction:.2f} | notification 0.90')
    width = foreground_fraction * 108
    height = width / ASPECT
    print(f'launcher grid (108): left {54 - width / 2:.12f} top {54 - height / 2:.12f} '
          f'{width:.12f} x {height:.12f}')

    grid = None
    for density, dpr in densities.items():
        folder = os.path.join(res, f'mipmap-{density}')
        os.makedirs(folder, exist_ok=True)

        legacy = render(round(48 * dpr), 0.94)
        legacy = composite(legacy, BG)
        for style in styles:
            legacy.save(os.path.join(folder, f'ic_launcher{style}.png'))
            legacy.save(os.path.join(folder, f'ic_launcher{style}_round.png'))

        fg = render(round(108 * dpr), foreground_fraction)
        for style in styles:
            fg.save(os.path.join(folder, f'ic_launcher{style}_foreground.png'))
        silhouette(fg).save(os.path.join(folder, 'ic_launcher_monochrome.png'))
        if grid is None:
            box, radius = ink_metrics(fg)
            scale = 108 / fg.width
            grid = (box[0] * scale, box[1] * scale, box[2] * scale, box[3] * scale)
            print(f'measured fg ink box (108): {grid[0]:.4f}, {grid[1]:.4f}, {grid[2]:.4f}, {grid[3]:.4f} '
                  f'| ink radius {radius / fg.width * 108:.3f} dp')

        stat = silhouette(render(round(24 * dpr), 0.90))
        os.makedirs(os.path.join(res, f'drawable-{density}'), exist_ok=True)
        stat.save(os.path.join(res, f'drawable-{density}', 'ic_stat_narwhal.png'))

        # Geometry checks: the numbers the picker test asserts.
        box, radius = ink_metrics(legacy)
        fg_box, fg_radius = ink_metrics(fg)
        mono_box, _ = ink_metrics(Image.open(os.path.join(folder, 'ic_launcher_monochrome.png')))
        stat_box, _ = ink_metrics(stat)
        print(f'{density}: legacy {legacy.width}px box {box[0] / legacy.width:.3f}..{box[2] / legacy.width:.3f} '
              f'radius {radius / legacy.width:.3f} | fg box {fg_box[0] / fg.width:.3f}..{fg_box[2] / fg.width:.3f} '
              f'radius {fg_radius / fg.width:.3f} | mono == fg: {mono_box == fg_box} '
              f'| stat {stat.width}px box {stat_box[0] / stat.width:.3f}..{stat_box[2] / stat.width:.3f}')

    # Old brand drawables that no manifest or XML names any more.
    for name in ('drawable-mdpi/ic_stat_dsh.png', 'drawable-hdpi/ic_stat_dsh.png',
                 'drawable-xhdpi/ic_stat_dsh.png', 'drawable-xxhdpi/ic_stat_dsh.png',
                 'drawable-xxxhdpi/ic_stat_dsh.png'):
        path = os.path.join(res, name)
        if os.path.exists(path):
            os.remove(path)
            print(f'removed {name}')

    print('ok')


if __name__ == '__main__':
    main()
