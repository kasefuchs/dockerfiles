#!/bin/sh
# Copyright (c) Kasefuchs
# SPDX-License-Identifier: MIT

set -eu

GOCRYPTFS_ENCRYPTED_PATH="${GOCRYPTFS_ENCRYPTED_PATH:-/encrypted}"
GOCRYPTFS_MOUNT_PATH="${GOCRYPTFS_MOUNT_PATH:-/decrypted}"
GOCRYPTFS_PASSWORD="${GOCRYPTFS_PASSWORD:?GOCRYPTFS_PASSWORD not set}"
GOCRYPTFS_MOUNT_OPTIONS="${GOCRYPTFS_MOUNT_OPTIONS:--nosyslog}"
GOCRYPTFS_INIT_OPTIONS="${GOCRYPTFS_INIT_OPTIONS:-}"

mkdir -p "$GOCRYPTFS_ENCRYPTED_PATH" "$GOCRYPTFS_MOUNT_PATH"
echo "Ensured directories: encrypted='$GOCRYPTFS_ENCRYPTED_PATH', mount='$GOCRYPTFS_MOUNT_PATH'"

if [ ! -f "$GOCRYPTFS_ENCRYPTED_PATH/gocryptfs.conf" ]; then
    echo "No config found, initializing new encrypted volume"
    gocryptfs -init -extpass 'printenv GOCRYPTFS_PASSWORD' $GOCRYPTFS_INIT_OPTIONS "$GOCRYPTFS_ENCRYPTED_PATH"
fi

echo "Mounting encrypted volume"
exec gocryptfs -fg -extpass 'printenv GOCRYPTFS_PASSWORD' $GOCRYPTFS_MOUNT_OPTIONS "$GOCRYPTFS_ENCRYPTED_PATH" "$GOCRYPTFS_MOUNT_PATH"
