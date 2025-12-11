#!/bin/sh
set -eu

/usr/local/bin/gocryptfs-ready.sh && exec /usr/bin/stash
