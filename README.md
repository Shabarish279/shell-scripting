# Shell Scripting Practice

This repository contains useful shell scripts for DevOps practice.

## Scripts

### 1. Backup Script
- Creates compressed backups
- Deletes old backups

### 2. Log Monitoring Script
- Monitors logs in real-time
- Alerts on ERROR, FAIL, CRITICAL

### 3. System Health Script
- Monitors system resources including disk, memory, and CPU usage
- Displays top processes consuming high CPU and memory
- Alerts when disk usage exceeds a defined threshold
- Performs cleanup of temporary files to maintain system health

### 4. Daily System Report Script
- Collects system metrics (disk, memory, CPU)  
- Displays top resource-consuming processes  
- Generates a formatted daily report  
- Sends the report via email to a configured recipient  
- Designed to run automatically using cron  

---

## How to Run

chmod +x script.sh
./script.sh

## Email Setup (Required for Report Script)

Install mail utility:

### Ubuntu / Debian

sudo apt update
sudo apt install mailutils -y


### Amazon Linux / RHEL

sudo yum install mailx -y


Test email:

echo "Test email from server" | mail -s "Test Mail" your-email@example.com



## Cron Setup (Automation)

Open crontab:

crontab -e

Add this line (runs every day at 9 AM):

0 9 * * * /home/ubuntu/daily_report.sh

## Cron Format

* * * * *
| | | | |
| | | | └── Day of week (0 - 7)
| | | └──── Month (1 - 12)
| | └────── Day of month (1 - 31)
| └──────── Hour (0 - 23)
└────────── Minute (0 - 59)

## Example Schedules

Run every day at 9 AM:

0 9 * * *

Run every hour:

0 * * * *

Run every 5 minutes:

*/5 * * * *

