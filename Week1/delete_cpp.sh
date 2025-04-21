#!/bin/bash

#This is a script that will perform cleanup by deleting all CPP files in the given directory. Using cron this script will be automated to run every 5 minutes.

TARGET_DIR="/home/kartik/SysDevPrep/Week1/testcleanup"
LOG_FILE="/home/kartik/SysDevPrep/Week1/cppcleanup.log"

find "$TARGET_DIR" -type f -name "*.cpp" -delete

echo "Deleted .cpp files at $(date)" >>  "$LOG_FILE"
