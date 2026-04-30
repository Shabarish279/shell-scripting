#!/bin/bash

set -x
set -e
set -o pipefail

SOURCE_DIR="/home/user/data"
BACKUP_DIR="/home/user/backups"

echo "starting backup process..."

TIMESTAMP=$(date+"%Y-%m-%d_%H-%M-%S")
BACKUPFILE="Backup_$TIMESTAMP.tar.gz"

tar -czf "BACKUP_DIR/BACKUPFILE" "SOURCE_DIR"

if [ $? = 0 ]; then
echo "Backup successful"
else
echo "Backup failed"
exit 1
fi

find "BACKUP_DIR" -type f -mtime +7 -name "*.tar.gz" - delete
echo "Old backup cleaned up"
