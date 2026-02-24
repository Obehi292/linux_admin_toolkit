#!/bin/bash

LOG_FILE="../logs/system.log"
BACKUP_DIR="../backups"

mkdir -p "$BACKUP_DIR"

if [ -z "$1" ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

TARGET=$1
TIMESTAMP=$(date '+%Y%m%d_%H%M%S')
ARCHIVE_NAME="backup_${TIMESTAMP}.tar.gz"

if [ -d "$TARGET" ]; then
    tar -czf "$BACKUP_DIR/$ARCHIVE_NAME" "$TARGET"
    echo "Backup successful: $ARCHIVE_NAME"
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] SUCCESS: Backup of $TARGET" >> "$LOG_FILE"
    exit 0
else
    echo "Directory does not exist."
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] FAILED: Backup failed for $TARGET" >> "$LOG_FILE"
    exit 2
fi