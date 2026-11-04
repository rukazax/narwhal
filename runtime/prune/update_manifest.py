#!/usr/bin/env python3
"""Update runtime/out/<abi>/assets/runtime/manifest.json after a pruned rebuild.

Only the fields tied to the archive (and the runtimeVersion that makes an
upgrade re-unpack) are rewritten; every other byte of the generated file is
left as runtime/build-runtime.sh wrote it.
"""
import argparse
import json
import re
import sys


FIELDS = {
    "rootfsSha256": r'("rootfsSha256"\s*:\s*")[0-9a-fA-F]+(")',
    "rootfsBytes": r'("rootfsBytes"\s*:\s*)\d+',
    "tarBytes": r'("tarBytes"\s*:\s*)\d+',
    "tarSha256": r'("tarSha256"\s*:\s*")[0-9a-fA-F]+(")',
    "uncompressedBytes": r'("uncompressedBytes"\s*:\s*)\d+',
}


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--manifest", required=True)
    ap.add_argument("--report", required=True)
    ap.add_argument("--version-suffix", default="")
    args = ap.parse_args()

    report = json.load(open(args.report))
    text = open(args.manifest, encoding="utf-8").read()
    before = json.loads(text)

    new = {
        "rootfsSha256": report["archiveSha256"],
        "rootfsBytes": report["archiveBytes"],
        "tarBytes": report["tarBytes"],
        "tarSha256": report["tarSha256"],
        "uncompressedBytes": report["uncompressedBytes"],
    }

    def sub(name, value):
        nonlocal text
        pattern = FIELDS[name]
        if len(re.findall(pattern, text)) != 1:
            sys.exit("pattern for %s matched %d times" % (name, len(re.findall(pattern, text))))
        if isinstance(value, int):
            repl = r"\g<1>%d" % value
        else:
            repl = r"\g<1>%s\g<2>" % value
        text = re.sub(pattern, repl, text, count=1)

    for name, value in new.items():
        sub(name, value)

    # entries counts
    pat = r'("entries"\s*:\s*\{\s*"dir"\s*:\s*)\d+(,\s*"file"\s*:\s*)\d+(,\s*"symlink"\s*:\s*)\d+'
    if len(re.findall(pat, text)) != 1:
        sys.exit("entries pattern mismatch")
    c = report["counts"]
    text = re.sub(pat, r"\g<1>%d\g<2>%d\g<3>%d" % (c["dir"], c["file"], c["symlink"]), text, count=1)

    if args.version_suffix:
        pat = r'("runtimeVersion"\s*:\s*")[^"]+(")'
        if len(re.findall(pat, text)) != 1:
            sys.exit("runtimeVersion pattern mismatch")
        version = before["runtimeVersion"] + args.version_suffix
        text = re.sub(pat, r"\g<1>%s\g<2>" % version, text, count=1)

    after = json.loads(text)
    changed = {k: (before[k], after[k]) for k in before if before[k] != after[k]}
    for k, (old, newv) in changed.items():
        print("%-20s %s -> %s" % (k, old, newv))
    print("changed fields: %d" % len(changed))
    open(args.manifest, "w", encoding="utf-8", newline="\n").write(text)


if __name__ == "__main__":
    main()
