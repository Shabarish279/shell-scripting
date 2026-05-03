#!/bin/bash

# Directory where logs are stored

LOG_DIR="/var/log/myapp"
LOG_FILE="$LOG_DIR/log_rotation.log"

# Check if log directory exists

if [ ! -d "$LOG_DIR" ]; then
echo "[$(date '+%Y-%m-%d %H:%M:%S')] ERROR: Log directory $LOG_DIR does not exist!" >> "$LOG_FILE"
exit 1
fi

# Compress .log files older than 7 days but newer than 30 days

find "$LOG_DIR" -type f -name "*.log" -mtime +7 -mtime -30 ! -name "*.gz" 
-exec gzip {} ; 
-exec echo "[$(date '+%Y-%m-%d %H:%M:%S')] Compressed: {}" >> "$LOG_FILE" ;

# Delete compressed (.gz) logs older than 30 days

find "$LOG_DIR" -type f -name "*.gz" -mtime +30 
-exec rm -f {} ; 
-exec echo "[$(date '+%Y-%m-%d %H:%M:%S')] Deleted compressed: {}" >> "$LOG_FILE" ;

# Delete uncompressed .log files older than 30 days

find "$LOG_DIR" -type f -name "*.log" -mtime +30 
-exec rm -f {} ; 
-exec echo "[$(date '+%Y-%m-%d %H:%M:%S')] Deleted uncompressed: {}" >> "$LOG_FILE" ;

# Log completion message

echo "[$(date '+%Y-%m-%d %H:%M:%S')] Log rotation completed successfully." >> "$LOG_FILE"
