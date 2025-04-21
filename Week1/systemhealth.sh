#!/bin/bash

LOG_FILE="/home/kartik/SysDevPrep/Week1/system_health.log"
NOW=$(date '+%Y-%m-%d %H:%M:%S')

echo "========== System Health Report at $NOW ==========" >> "$LOG_FILE"

# CPU Load (1, 5, 15 minute average)
echo "CPU Load Average:" >> "$LOG_FILE"
uptime | awk -F'load average:' '{ print $2 }' >> "$LOG_FILE"

# Memory Usage
echo -e "\nMemory Usage:" >> "$LOG_FILE"
free -h >> "$LOG_FILE"

# Disk Usage
echo -e "\nDisk Usage:" >> "$LOG_FILE"
df -h / >> "$LOG_FILE"

# Uptime
echo -e "\nSystem Uptime:" >> "$LOG_FILE"
uptime -p >> "$LOG_FILE"

# Top 5 Memory-consuming processes
echo -e "\nTop 5 Memory Consuming Processes:" >> "$LOG_FILE"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 6 >> "$LOG_FILE"

echo -e "=====================================================\n" >> "$LOG_FILE"
