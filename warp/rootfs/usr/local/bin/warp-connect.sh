#!/usr/bin/env bash
set -eu

if [ -n "${WARP_ACCEPT_TOS:-}" ]; then
  mkdir -p ~/.local/share/warp/
  touch ~/.local/share/warp/accepted-tos.txt
else
  echo "TOS is not accepted (WARP_ACCEPT_TOS)" >&2
  exit 1
fi

if ! warp-cli registration show >/dev/null 2>&1; then
  warp-cli registration new
fi

warp-cli mode proxy
warp-cli proxy port 32000

exec warp-cli connect
