#!/bin/sh
here="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
sys="$(uname -s)"
case "$sys" in
MINGW* | MSYS* | CYGWIN*) rel="x86_64-pc-windows-msvc/gray-share.exe" ;;
Darwin*)
    case "$(uname -m)" in
    arm64) rel="aarch64-apple-darwin/gray-share" ;;
    *) rel="x86_64-apple-darwin/gray-share" ;;
    esac ;;
*)
    case "$(uname -m)" in
    aarch64 | arm64) rel="aarch64-unknown-linux-musl/gray-share" ;;
    *) rel="x86_64-unknown-linux-musl/gray-share" ;;
    esac ;;
esac
if [ -x "$here/$rel" ]; then exec "$here/$rel" "$@"; fi
for cand in "$here/target/release/gray-share.exe" "$here/target/release/gray-share" "$here/target/debug/gray-share.exe" "$here/target/debug/gray-share"; do
    if [ -x "$cand" ]; then exec "$cand" "$@"; fi
done
echo "gray-share binary not found in $here" >&2
exit 1
