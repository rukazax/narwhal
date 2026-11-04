# Narwhal runtime rootfs prune (2026-11-04)

Scratch + recipe for the size cut of `runtime/out/arm64-v8a/assets/runtime/rootfs-arm64-v8a.tar.xz`.
Everything here is outside the dsh-Go repo: the only repo files touched are that archive and its
`manifest.json` (both under `runtime/out`, which `runtime/.gitignore` ignores).

## Result

| | before | after | delta |
|---|---|---|---|
| APK (`app-arm64-release.apk`) | 188 451 988 | **177 330 755** | −11 121 233 (−5.90 %) |
| reference APK `artifacts/narwhal-1.0.0-arm64.apk` | 191 708 210 | **177 330 755** | −14 377 455 (−7.50 %) |
| rootfs archive | 158 276 592 | **147 155 360** | −11 121 232 (−7.03 %) |
| tar | 810 629 120 | 725 934 080 | −84 695 040 |
| unpacked file bytes | 786 065 073 | 703 150 310 | −82 914 763 (−10.55 %) |
| tar members | 32 143 | 29 761 | −2 382 |

final archive sha256 `23b5523ee4d510f6afa663b972ada24756379e86fc5f3890a1a4699d3136b85f`
tar sha256 `c2647e11a8c7f0326876a8abf739bb7a924fe2eb151b5cd9c34e71277252cb2d`
runtimeVersion `r15-dsh0.2.1-rc.4-node24.22.1-ubuntu24.04.5-6c5ff4454b59-p1`

## What was dropped (uncompressed bytes, apparent size)

| path | size | why |
|---|---|---|
| `usr/lib/aarch64-linux-gnu/perl/5.38.2/**` | 27.4 MB | perl XS modules + CORE headers; no perl in the engine |
| `usr/share/perl/5.38.2/**` | 18.7 MB | pure-perl modules, unicore, CPAN, pod |
| `usr/bin/perl5.38.2` | 3.9 MB | duplicate of `/usr/bin/perl` (hardlink in a real install) |
| `usr/lib/aarch64-linux-gnu/gconv/*.so` (216 of 253) | 17.2 MB | CJK/EBCDIC/IBM/exotic charsets; 37 modules kept (UNICODE, UTF-7/16/32, ISO8859-1..16+9E, CP1250–1258, KOI8-R/U/RU, CP737, CP775, IBM850, IBM866, MACINTOSH) |
| `opt/python/lib/{tcl9.0,tk9.0,tcl9,thread3.0.6,libtcl9.0.so,libtcl9tk9.0.so}` | 8.7 MB | Tcl/Tk runtime; the bundled Python has no `_tkinter` at all |
| `usr/lib/git-core/{scalar,git-shell,git-http-push,git-http-fetch,git-imap-send,git-http-backend,git-daemon,git-instaweb}`, `usr/bin/{scalar,git-shell}` | 5.3 MB | server-side / dumb-HTTP / obsolete subcommands |
| `usr/share/gitweb/**`, `usr/share/git-core/**` | 0.4 MB | gitweb + sample hook templates |
| `usr/lib/aarch64-linux-gnu/perl/5.38`, `usr/share/perl/5.38`, `usr/lib/aarch64-linux-gnu/perl/cross-config-5.38.2/**` | 0 | symlinks into the trees above (would dangle) |

Kept on purpose: `/usr/bin/perl` + perl-base modules + libperl (perl one-liners and dpkg/debconf
postinst still work), every git client binary including `git-remote-http(s)`, all of Python, Node,
pnpm, DSH and sherpa-onnx.

## Recipe (reproducible from the original archive)

```bash
# 0) prerequisites: the original archive, python3, xz 5.x
# 1) prune + recompress: stream the tar, drop the spec's members, xz -T4 -6 -c
#    (same compressor call as runtime/build-runtime.sh -> 24 MiB blocks, dict 8 MiB, CRC64)
python3 prune.py rootfs-arm64-v8a.tar.xz rootfs-pruned.tar.xz \
  --list prune-spec.json --report prune-report.json
# 2) verify: every kept member identical, only the spec's members missing
python3 verify.py rootfs-arm64-v8a.tar.xz rootfs-pruned.tar.xz --list prune-spec.json
# 3) update the manifest in place (rootfsSha256/rootfsBytes/tarBytes/tarSha256/
#    uncompressedBytes/entries and runtimeVersion, so an upgrade re-unpacks)
python3 update_manifest.py --manifest runtime/out/arm64-v8a/assets/runtime/manifest.json \
  --report prune-report.json --version-suffix=-p1
# 4) build in WSL (release keystore)
/tmp/build_nb.sh            # -> app/build/app/outputs/flutter-apk/app-arm64-release.apk
# 5) install and verify on the phone
adb -s 909f194a install -r app-arm64-release.apk
```

`/tmp/build_nb.sh` is wiped when the WSL VM restarts; it is:

```bash
#!/usr/bin/env bash
set -euo pipefail
cd /root/narwhal-build/app
export PATH=/opt/flutter/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
export ANDROID_HOME=/opt/android-sdk
export ANDROID_SDK_ROOT=/opt/android-sdk
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64
mkdir -p /root/narwhal-symbols
flutter build apk --release --flavor arm64 --target-platform android-arm64 \
  --obfuscate --split-debug-info=/root/narwhal-symbols \
  --build-name 1.0.0-narwhal --build-number 11040153 \
  --dart-define=DSH_APP_VERSION=1.0.0-narwhal+11040153 \
  --dart-define=UPSTREAM_BASE_VERSION=1.0.9 \
  --dart-define=DSH_SELF_UPDATE=false
```

## Verification evidence (screenshots in this folder)

- `t01_onboard.png` — fresh install (pm clear) welcome page.
- `t03.png` — onboarding step 2/4, bottom line "Подготовка среды, готово 52 %".
- `t05_home.png` — home after install, header "Этот телефон" with a green dot.
- `t07_chat.png` — message "Privet iz pruned rootfs" answered by the engine in 0.5 s
  (the DeepSeek-key card is the engine's answer).
- `t10_checks.png` — guest terminal: `ls …/gconv | wc -l` → 40, `ls /usr/share/perl` → empty,
  `git --version` → 2.43.0, `perl -v` → 5.38.2, `node -v` → v24.22.1.
- `f6_plugins_final.png` — plugin page on the final build: "Плагины · Установлено",
  official DSH plugins at 0.2.1-rc.4.
- `s20_plugins_page.png` — the same page on the first (-p1) build.
- `s04_engine_up.png` — engine running after the upgrade install (chat reply card).
- `s01_launch.png` — upgrade install progress "80 / 140 MB" (the new archive size).

Health check used on the phone: `adb forward tcp:3080 tcp:3080` then
`curl -s -o /dev/null -w '%{http_code}' http://127.0.0.1:3080/` → `401`
(the manifest's contract for "server up, unauthenticated").
