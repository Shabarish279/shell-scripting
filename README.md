# Shell Scripting Practice

This repository contains useful shell scripts for DevOps practice.

## Scripts

### 1. Backup Script

* Creates compressed backups
* Deletes old backups

---

### 2. Log Monitoring Script

* Monitors logs in real-time
* Alerts on ERROR, FAIL, CRITICAL

---

### 3. System Health Script

* Monitors system resources including disk, memory, and CPU usage
* Displays top processes consuming high CPU and memory
* Alerts when disk usage exceeds a defined threshold
* Performs cleanup of temporary files to maintain system health

---

### 4. Daily System Report Script

* Collects system metrics (disk, memory, CPU)
* Displays top resource-consuming processes
* Generates a formatted daily report
* Sends the report via email to a configured recipient
* Designed to run automatically using cron

---

### 5. Log Rotation Script

* Compresses log files older than 7 days
* Deletes logs older than 30 days
* Helps manage disk space efficiently
* Logs all actions with timestamps for tracking
* Designed to run periodically using cron

---

## How to Run

Make the script executable:

```bash
chmod +x script.sh
```

Run the script:

```bash
./script.sh
```

---

## Email Setup (Required for Report Script)

Install mail utility:

### Ubuntu / Debian

```bash
sudo apt update
sudo apt install mailutils -y
```

### Amazon Linux / RHEL

```bash
sudo yum install mailx -y
```

Test email:

```bash
echo "Test email from server" | mail -s "Test Mail" your-email@example.com
```

---

## Cron Setup (Automation)

Open crontab:

```bash
crontab -e
```

Add this line (runs every day at 9 AM and 9 PM):

```bash
0 9,21 * * * /home/ubuntu/daily_report.sh
```

---

## Example Schedules

Run every day at 9 AM:

```bash
0 9 * * *
```

Run every hour:

```bash
0 * * * *
```

Run every 5 minutes:

```bash
*/5 * * * *
```
