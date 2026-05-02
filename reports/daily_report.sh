#!/bin/bash

EMAIL="manager@example.com"
HOSTNAME=$(hostname)
DATE=$(date)

REPORT="===== Daily System Report =====\n"
REPORT+="Server: $HOSTNAME\n"
REPORT+="Date: $DATE\n\n"

# Disk Usage
REPORT+="--- Disk Usage ---\n"
REPORT+="$(df -h | grep -v tmpfs)\n\n"

# Memory Usage
REPORT+="--- Memory Usage ---\n"
REPORT+="$(free -h)\n\n"

# CPU Load
REPORT+="--- CPU Load ---\n"
REPORT+="$(uptime)\n\n"

# Top CPU Processes
REPORT+="--- Top CPU Processes ---\n"
REPORT+="$(ps aux --sort=-%cpu | head -n 5)\n\n"

# Top Memory Processes
REPORT+="--- Top Memory Processes ---\n"
REPORT+="$(ps aux --sort=-%mem | head -n 5)\n\n"

# Send Email
echo -e "$REPORT" | mail -s "📊 Daily System Report - $HOSTNAME" $EMAIL
