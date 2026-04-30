#!/bin/bash

LOG_FILE="/var/log/app.log"
KEYWORDS="ERROR|CRITICAL|FAIL"

echo "Monitoring log file: $LOG_FILE" 

tail -n 0 -f "$LOG_FILE" | while read line
do
  if echo "$line" | grep -E "$KEYWORDS" > /dev/null
  then
    echo "🚨 ALERT: Issue detected!"
    echo "$line"
  fi
done
