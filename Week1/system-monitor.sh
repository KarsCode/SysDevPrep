#!/bin/bash

#========================================
#System Monitoring Script.
#Logs key system health metrics to a timestamped log file.
#========================================

#Create a logs directory if it does not exist.
LOG_DIR="./system-monitor-logs"
mkdir -p "$LOG_DIR"

#Create a timestamped log file.
TIMESTAMP=$(date "+%Y-%m-%d_%H-%m-%s")
LOG_FILE="$LOG_DIR/monitor_$TIMESTAMP.log"


# Log start
echo "=============================================" >> "$LOG_FILE"
echo "System Monitor Log - $(date)" >> "$LOG_FILE"
echo "=============================================" >> "$LOG_FILE"

# Uptime and load average
echo -e "\n--- UPTIME & LOAD AVERAGE ---" >> "$LOG_FILE"
uptime >> "$LOG_FILE"

# CPU usage
echo -e "\n--- CPU USAGE ---" >> "$LOG_FILE"
top -bn1 | grep "Cpu(s)" >> "$LOG_FILE"


# Memory usage
echo -e "\n--- MEMORY USAGE ---" >> "$LOG_FILE"
free -h >> "$LOG_FILE"

# Disk usage
echo -e "\n--- DISK USAGE ---" >> "$LOG_FILE"
df -h >> "$LOG_FILE"

# Top 5 memory consuming processes
echo -e "\n--- TOP 5 MEMORY-CONSUMING PROCESSES ---" >> "$LOG_FILE"
ps aux --sort=-%mem | awk 'NR<=6 {print $1, $2, $3, $4, $11}' >> "$LOG_FILE"

# Logged-in users
echo -e "\n--- ACTIVE USERS ---" >> "$LOG_FILE"
who >> "$LOG_FILE"

# Log end
echo -e "\nLog saved to $LOG_FILE"


