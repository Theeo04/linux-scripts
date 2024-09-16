#!/bin/bash

#	This script was written and explained  using ChatGPT!

# Path to the log file
LOGFILE=$1

# Check if the log file is specified
if [ -z "$LOGFILE" ]; then
    echo "Please specify the path to the log file."
    exit 1
fi

# Check if the log file exists
if [ ! -f "$LOGFILE" ]; then
    echo "Log file does not exist: $LOGFILE"
    exit 1
fi

echo "Analyzing log file: $LOGFILE"
echo

# Total number of GET requests
total_requests=$(grep -c 'GET' "$LOGFILE")
echo "Total number of GET requests: $total_requests"

# Total number of 404 errors
total_errors_404=$(grep -c '404' "$LOGFILE")
echo "Total number of 404 errors: $total_errors_404"

# Top 5 IP addresses generating 404 errors
echo "Top 5 IP addresses generating 404 errors:"
grep '404' "$LOGFILE" | awk '{print $1}' | sort | uniq -c | sort -nr | head -n 5

# Top 5 error messages
echo "Top 5 error messages:"
grep '404' "$LOGFILE" | awk '{print $9}' | sort | uniq -c | sort -nr | head -n 5

# Requests per hour
echo "Requests per hour:"
awk '{print $4}' "$LOGFILE" | cut -d: -f1 | sort | uniq -c | sort -nr

# Top 5 requested URIs
echo "Top 5 requested URIs:"
grep 'GET' "$LOGFILE" | awk '{print $7}' | sort | uniq -c | sort -nr | head -n 5

echo
echo "Analysis complete."
