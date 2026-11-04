#!/usr/bin/env python3
"""Verify a pruned archive against its source.

Checks that every member of the new archive exists in the source with identical
type, mode, uid/gid, uname/gname, mtime, linkname and size; that no member was
added; and that the only missing members are the ones the prune spec drops.
"""
import argparse
import hashlib
import json
import lzma
import sys
import tarfile


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
        if gdir and n.startswith(gdir + "/") and n.endswith(".so") and n.rsplit("/", 1)[-1] not in keep:
            return True
        return False

    return drop


def members(path):
    out = {}
    with lzma.open(path, "rb") as raw, tarfile.open(fileobj=raw, mode="r|") as tf:
        for m in tf:
            out[m.name.strip("/")] = (
                "dir" if m.isdir() else "symlink" if m.issym() else "file" if m.isreg() else "other",
                m.mode, m.uid, m.gid, m.uname, m.gname, m.mtime, m.linkname, m.size,
            )
    return out


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("src")
    ap.add_argument("dst")
    ap.add_argument("--list", required=True)
    args = ap.parse_args()
    drop = compile_matcher(json.load(open(args.list)))

    src = members(args.src)
    dst = members(args.dst)
    problems = []
    dropped = sorted(p for p in src if drop(p))
    for p in sorted(set(src) & set(dst)):
        if src[p] != dst[p]:
            problems.append("changed %s: %r -> %r" % (p, src[p], dst[p]))
    added = sorted(set(dst) - set(src))
    for p in added[:20]:
        problems.append("added " + p)
    unexpected = sorted(p for p in set(src) - set(dst) if not drop(p))
    for p in unexpected[:20]:
        problems.append("unexpectedly missing " + p)
    kept_but_dropped = sorted(p for p in dropped if p in dst)
    for p in kept_but_dropped[:20]:
        problems.append("spec dropped but kept " + p)

    print("src members: %d" % len(src))
    print("dst members: %d" % len(dst))
    print("dropped by spec: %d (present in src: %d)" % (len(dropped), len([p for p in dropped if p in src])))
    print("problems: %d" % len(problems))
    for line in problems[:40]:
        print("  " + line)
    sys.exit(1 if problems else 0)


if __name__ == "__main__":
    main()
