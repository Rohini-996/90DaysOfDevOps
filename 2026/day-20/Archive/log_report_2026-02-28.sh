#!/bin/bash

LOG_FILE="zookeeper.log"
DATE=$(date +%F)
REPORT_FILE="log_report_${DATE}.txt"

echo "Generating log summary report..."

{
echo "==================== LOG SUMMARY REPORT ===================="
echo "Date of Analysis: $(date)"
echo "Log File Name: $LOG_FILE"

echo
echo "Total Lines Processed:"
wc -l < "$LOG_FILE"

echo
echo "Total ERROR Count:"
grep -i "error" "$LOG_FILE" | wc -l

echo
echo "Top 5 ERROR Messages (with count):"
grep -i "error" "$LOG_FILE" | sort | uniq -c | sort -nr | head -5

echo
echo "CRITICAL Events (with line numbers):"
grep -n "CRITICAL" "$LOG_FILE"

echo "============================================================"

} > "$REPORT_FILE"

echo "Report saved to: $REPORT_FILE"
