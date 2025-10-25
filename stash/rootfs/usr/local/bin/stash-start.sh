#!/bin/sh
# Copyright (c) Kasefuchs
# SPDX-License-Identifier: MIT

set -eu

/usr/local/bin/gocryptfs-ready.sh && exec /usr/bin/stash
