#!/usr/bin/env python3
"""Recompress a Narwhal rootfs tar.xz with dead weight removed.

Streams the existing archive (lzma + tarfile), drops members that match the
prune spec, and writes a new tar (GNU format, original member order, modes,
owners and mtimes) through `xz -T4 -6 -c` -- exactly the compressor invocation
runtime/build-runtime.sh uses, so the result keeps 24 MiB blocks and stays
inside the app's ParallelXZInputStream limit.

Usage: prune.py SRC DST --list spec.json [--report report.json]
"""
import argparse
import hashlib
import io
import json
import lzma
import os
import subprocess
import sys
import tarfile


class HashingWriter:
    def __init__(self, fh):
        self.fh = fh
        self.n = 0
        self.h = hashlib.sha256()

    def write(self, b):
        self.h.update(b)
        self.n += len(b)
        return self.fh.write(b)

    def flush(self):
        self.fh.flush()

    def close(self):
        pass


def compile_matcher(spec):
    prefixes = tuple(p.strip("/") for p in spec.get("drop_prefixes", []))
    files = set(p.strip("/") for p in spec.get("drop_files", []))
    gconv = spec.get("gconv")
    keep = set(gconv["keep"]) if gconv else set()
    gdir = gconv["dir"].strip("/") if gconv else None

    def drop(name):
        n = name.strip("/")
        if n in files:
            return True
        for p in prefixes:
            if n == p or n.startswith(p + "/"):
                return True
        if gdir and n.startswith(gdir + "/") and n.endswith(".so"):
            base = n.rsplit("/", 1)[-1]
            if base not in keep:
                return True
        return False

    return drop


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("src")
    ap.add_argument("dst")
    ap.add_argument("--list", required=True)
    ap.add_argument("--report")
    ap.add_argument("--threads", default="4")
    ap.add_argument("--preset", default="6")
    args = ap.parse_args()

    spec = json.load(open(args.list))
    drop = compile_matcher(spec)

    comp = subprocess.Popen(
        ["xz", "-T%s" % args.threads, "-%s" % args.preset, "-c"],
        stdin=subprocess.PIPE, stdout=open(args.dst, "wb"))
    hw = HashingWriter(comp.stdin)
    counts = {"dir": 0, "file": 0, "symlink": 0, "other": 0}
    file_bytes = 0
    dropped = {}
    dropped_bytes = 0

    with lzma.open(args.src, "rb") as raw:
        with tarfile.open(fileobj=raw, mode="r|") as src:
            with tarfile.open(fileobj=hw, mode="w|", format=tarfile.GNU_FORMAT) as dst:
                for m in src:
                    name = m.name.strip("/")
                    if drop(name):
                        kind = "dir" if m.isdir() else "symlink" if m.issym() else "file"
                        key = "%s:%s" % (kind, name.rsplit("/", 1)[0] if "/" in name else ".")
                        dropped[key] = dropped.get(key, [0, 0])
                        dropped[key][0] += 1
                        dropped[key][1] += m.size or 0
                        dropped_bytes += m.size or 0
                        continue
                    if m.isreg():
                        data = src.extractfile(m).read()
                        m.size = len(data)
                        file_bytes += len(data)
                        counts["file"] += 1
                        dst.addfile(m, io.BytesIO(data))
                    elif m.isdir():
                        counts["dir"] += 1
                        dst.addfile(m)
                    elif m.issym():
                        counts["symlink"] += 1
                        dst.addfile(m)
                    else:
                        counts["other"] += 1
                        dst.addfile(m)

    hw.flush()
    comp.stdin.close()
    if comp.wait() != 0:
        sys.exit("xz failed")

    with open(args.dst, "rb") as f:
        archive_sha = hashlib.sha256(f.read()).hexdigest()

    report = {
        "archive": os.path.basename(args.dst),
        "archiveBytes": os.path.getsize(args.dst),
        "archiveSha256": archive_sha,
        "tarBytes": hw.n,
        "tarSha256": hw.h.hexdigest(),
        "uncompressedBytes": file_bytes,
        "counts": counts,
        "droppedBytes": dropped_bytes,
        "dropped": {k: {"entries": v[0], "bytes": v[1]} for k, v in sorted(dropped.items())},
    }
    text = json.dumps(report, indent=2, sort_keys=True)
    print(text)
    if args.report:
        with open(args.report, "w") as f:
            f.write(text + "\n")


if __name__ == "__main__":
    main()
