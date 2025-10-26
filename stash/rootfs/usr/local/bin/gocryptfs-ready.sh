#!/bin/sh
# Copyright (c) Kasefuchs
# SPDX-License-Identifier: MIT

set -eu

GOCRYPTFS_MOUNT_PATH="${GOCRYPTFS_MOUNT_PATH:-/decrypted}"

exec mountpoint -q "$GOCRYPTFS_MOUNT_PATH"
