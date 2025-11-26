#!/bin/bash

# Directory where app logs are stored
LOG_DIR="/var/log/app_logs"

# Base name for the log files
LOG_NAME="app_log"

# Make sure the log directory exists
mkdir -p "$LOG_DIR"

# Today's date (e.g. 2025-11-26)
TODAY=$(date +%F)

# Today's log file
TODAY_LOG="${LOG_DIR}/${LOG_NAME}_${TODAY}.log"

# 1) Delete log files older than 30 days (.log and compressed .gz)
find "$LOG_DIR" -type f -name "${LOG_NAME}_*.log"    -mtime +30 -exec rm -f {} \;
find "$LOG_DIR" -type f -name "${LOG_NAME}_*.log.gz" -mtime +30 -exec rm -f {} \;

# 2) Compress all previous log files (everything except today's .log)
find "$LOG_DIR" -type f -name "${LOG_NAME}_*.log" ! -name "$(basename "$TODAY_LOG")" -exec gzip -f {} \;

# 3) Ensure today's log file exists
if [ ! -f "$TODAY_LOG" ]; then
    touch "$TODAY_LOG"
fi

echo "Log rotation complete."
echo "Today's log file: $TODAY_LOG"