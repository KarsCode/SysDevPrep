#!/bin/bash

LOG_FILE="test.log"

echo "Running analysis on log file: $LOG_FILE"

echo "-------------------------------------"

#1. Extracting users who logged in.

echo -e "\nUsers who logged in: "
grep "User login" $LOG_FILE | awk -F'user=' '{print $2}' | awk '{print $1}'

#2. Replace all IP addresses with [REDACTED]

echo -e "\nLogs with IPs redacted:"
sed -E 's/ip=[0-9/.]+/ip=[REDACTED]/' $LOG_FILE

#3. Count number of ERROR(s)

echo -e "\nNumber of ERROR(S)"
grep -c "ERROR" $LOG_FILE

# 4. Count each log level (INFO, ERROR, WARN)
echo -e "\nLog level counts:"
awk '{print $3}' $LOG_FILE | sort | uniq -c


# 5. Extract timestamps of all ERRORs
echo -e "\nTimestamps of ERRORs:"
grep "ERROR" $LOG_FILE | awk '{print $1, $2}'


# 6. Find users who uploaded files
echo -e "\nUsers who uploaded files:"
grep "File uploaded" $LOG_FILE | awk '{print $8}' | sed -e 's/user=//'


# 7. Extract user actions (login/logout)
echo -e "\nUser login/logout activity:"
grep -E "User (login|logout)" $LOG_FILE | awk -F' - ' '{print $2}'


# 8. Highlight WARN messages (yellow)
echo -e "\nHighlighted WARN messages:"
grep "WARN" $LOG_FILE | sed 's/WARN/\x1b[4;33mWARN\x1b[0m/g'


# 9. Advanced: Logins after 10:14:00 with redacted IPs
echo -e "\nUsers who logged in after 10:14:00 (with redacted IPs):"
awk '$2 > "10:14:00" && /User login/' $LOG_FILE \
| sed -E 's/ip=[0-9\.]+/ip=[REDACTED]/g' \
| awk -F'user=' '{print $2}' | awk '{print $1}'

echo -e "\n Done!"
