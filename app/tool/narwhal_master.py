"""S1 narwhal, third pass: the belly is a low, rounded light patch with a grey
rim and short rib grooves along its underside (ventral pleats), and the tusk is
a slim horn with a screw-thread twist near its base."""
import math

from PIL import Image, ImageDraw

S = 1024
SS = 2
BLUE = (77, 107, 254, 255)
BELLY = (232, 236, 246, 255)
GREY = (160, 170, 190, 255)
THREAD = (150, 170, 250, 255)
WHITE = (255, 255, 255, 255)
CLEAR = (0, 0, 0, 0)


def canvas():
    return Image.new('RGBA', (S * SS, S * SS), CLEAR)


def finish(im):
    return im.resize((S, S), Image.LANCZOS)


def catmull(points, samples=16):
    pts, n = [], len(points)
    for i in range(n):
        p0, p1, p2, p3 = points[i - 1], points[i], points[(i + 1) % n], points[(i + 2) % n]
        for j in range(samples):
            t = j / samples
            t2, t3 = t * t, t * t * t
            x = 0.5 * ((2 * p1[0]) + (-p0[0] + p2[0]) * t + (2 * p0[0] - 5 * p1[0] + 4 * p2[0] - p3[0]) * t2 + (-p0[0] + 3 * p1[0] - 3 * p2[0] + p3[0]) * t3)
            y = 0.5 * ((2 * p1[1]) + (-p0[1] + p2[1]) * t + (2 * p0[1] - 5 * p1[1] + 4 * p2[1] - p3[1]) * t2 + (-p0[1] + 3 * p1[1] - 3 * p2[1] + p3[1]) * t3)
            pts.append((x, y))
    return pts


BASE = [
    (0.82, 0.55), (0.79, 0.36), (0.64, 0.25), (0.55, 0.23), (0.50, 0.10),
    (0.42, 0.25), (0.29, 0.29), (0.10, 0.12), (0.02, 0.18), (0.15, 0.32),
    (0.02, 0.44), (0.12, 0.48), (0.27, 0.45), (0.46, 0.54), (0.66, 0.63),
    (0.77, 0.62),
]


def build(tusk_len=0.205, tusk_angle=-36, ribs=6, threads=4):
    im = canvas()
    c = S * SS / 2
    size = 720 * SS
    xs = [p[0] for p in BASE]
    ys = [p[1] for p in BASE]
    minx, maxx, miny, maxy = min(xs), max(xs), min(ys), max(ys)
    scale = size / max(maxx - minx, maxy - miny)
    offx = c - (minx + maxx) / 2 * scale
    offy = c - (miny + maxy) / 2 * scale

    body = Image.new('RGBA', (S * SS, S * SS), CLEAR)
    poly = [(offx + x * scale, offy + y * scale) for x, y in catmull(BASE, 14)]
    ImageDraw.Draw(body).polygon(poly, fill=BLUE)
    mask = body.getchannel('A')

    def clipped(layer):
        layer.putalpha(Image.composite(layer.getchannel('A'), Image.new('L', layer.size, 0), mask))
        body.alpha_composite(layer)

    # belly: low and rounded, light fill with a grey rim
    bx, by = offx + 0.47 * scale, offy + 0.485 * scale
    brx, bry = 0.205 * scale, 0.130 * scale
    belly = Image.new('RGBA', (S * SS, S * SS), CLEAR)
    bd = ImageDraw.Draw(belly)
    bd.ellipse((bx - brx, by - bry, bx + brx, by + bry), fill=BELLY, outline=GREY, width=int(0.013 * scale))
    clipped(belly)

    # ventral pleats: long grooves running along the belly, parallel to its rim
    belly_mask = Image.new('L', (S * SS, S * SS), 0)
    ImageDraw.Draw(belly_mask).ellipse((bx - brx, by - bry, bx + brx, by + bry), fill=255)
    ribs_layer = Image.new('RGBA', (S * SS, S * SS), CLEAR)
    rd = ImageDraw.Draw(ribs_layer)
    for i in range(4):
        k = i + 1
        rx, ry = brx * (1 - 0.17 * k), bry * (1 - 0.19 * k)
        rd.arc((bx - rx, by - ry, bx + rx, by + ry), 18, 162, fill=GREY, width=int(0.008 * scale))
    ribs_layer.putalpha(Image.composite(ribs_layer.getchannel('A'), Image.new('L', ribs_layer.size, 0), belly_mask))
    clipped(ribs_layer)

    # eye
    ex, ey = offx + 0.705 * scale, offy + 0.375 * scale
    eye = Image.new('RGBA', (S * SS, S * SS), CLEAR)
    ed = ImageDraw.Draw(eye)
    ed.ellipse((ex - 0.05 * scale, ey - 0.042 * scale, ex + 0.05 * scale, ey + 0.042 * scale), fill=WHITE)
    clipped(eye)
    d = ImageDraw.Draw(body)
    d.ellipse((ex - 0.013 * scale, ey - 0.013 * scale, ex + 0.013 * scale, ey + 0.013 * scale), fill=BLUE)

    # tusk: slim, with a screw thread twisting along its base half
    sx, sy = offx + 0.775 * scale, offy + 0.415 * scale
    a = math.radians(tusk_angle)
    tx, ty = sx + tusk_len * scale * math.cos(a), sy + tusk_len * scale * math.sin(a)
    nx, ny = math.cos(a + math.pi / 2), math.sin(a + math.pi / 2)
    base_w, tip_w = 0.036 * scale, 0.004 * scale
    tusk_poly = [
        (sx + nx * base_w, sy + ny * base_w),
        (tx + nx * tip_w, ty + ny * tip_w),
        (tx - nx * tip_w, ty - ny * tip_w),
        (sx - nx * base_w, sy - ny * base_w),
    ]
    d.polygon(tusk_poly, fill=BLUE)

    tusk_mask = Image.new('L', (S * SS, S * SS), 0)
    ImageDraw.Draw(tusk_mask).polygon(tusk_poly, fill=255)
    thread = Image.new('RGBA', (S * SS, S * SS), CLEAR)
    td = ImageDraw.Draw(thread)
    for i in range(threads):
        t = 0.08 + 0.62 * i / max(1, threads - 1)
        px, py = sx + (tx - sx) * t, sy + (ty - sy) * t
        w = base_w * (1 - t) * 0.9
        # a short diagonal cut: raised on one side, lower on the other
        td.line([(px - nx * w, py - ny * w), (px + nx * w * 0.35, py + ny * w * 0.35)], fill=THREAD, width=int(0.007 * scale))
        td.line([(px + nx * w * 0.35, py + ny * w * 0.35), (px + nx * w * 0.7, py + ny * w * 0.7 - 0.02 * scale * math.sin(a))], fill=THREAD, width=int(0.004 * scale))
    thread.putalpha(Image.composite(thread.getchannel('A'), Image.new('L', thread.size, 0), tusk_mask))
    body.alpha_composite(thread)


    im.alpha_composite(body)
    return finish(im)


def main():
    icon = build()
    icon.save(r'C:\Users\er-ka\Documents\deepseek-harness\dsh_mobile\artifacts\narwhal-s1-final.png')
    hero = Image.new('RGBA', (980, 470), WHITE)
    hero.paste(Image.new('RGBA', (490, 470), (18, 18, 18, 255)), (490, 0))
    big = icon.copy()
    big.thumbnail((360, 360))
    hero.alpha_composite(big, (65, 55))
    hero.alpha_composite(big, (555, 55))
    hero.alpha_composite(icon.resize((48, 48), Image.LANCZOS), (60, 415))
    sd = Image.new('RGBA', (80, 80), (18, 18, 18, 255))
    sd.alpha_composite(icon.resize((48, 48), Image.LANCZOS), (16, 16))
    hero.alpha_composite(sd, (550, 399))
    hero.convert('RGB').save(r'C:\Users\er-ka\Documents\deepseek-harness\dsh_mobile\artifacts\narwhal-s1-preview.png')
    print('ok')


if __name__ == '__main__':
    main()
