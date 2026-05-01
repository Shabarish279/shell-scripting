#!/bin/bash

echo "===== System Health Check ====="

# Disk usage
echo "Checking disk usage..."
df -h | grep -v tmpfs

# Memory usage
echo "Checking memory usage..."
free -h

# CPU load
echo "Checking CPU load..."
uptime

# Top CPU processes
echo "Top processes using CPU:"
ps aux --sort=-%cpu | head -n 5

# Top Memory processes
echo "Top processes using Memory:"
ps aux --sort=-%mem | head -n 5

# Alert if disk usage > 80%
echo "Checking for high disk usage..."
df -h | awk '{print $5 " " $1}' | while read output;
do
  usage=$(echo $output | awk '{print $1}' | cut -d'%' -f1)
  partition=$(echo $output | awk '{print $2}')

  if [ "$usage" -gt 80 ]; then
    echo "⚠️ WARNING: High disk usage on $partition ($usage%)"
  fi
done

# Clean temp files
echo "Cleaning temp files..."
rm -rf /tmp/*

echo "===== Maintenance Completed ====="
