#!/bin/bash 

echo " ====================== TASK 1 - INPUT AND VALIDATION ==================================="

if [ $# -eq 0 ]; then
	echo "Error: No log file provided."
    	echo "Usage: ./log_analyzer.sh <logfile>"
        exit 1
fi 

# Store argument in variable
LOGFILE=$1

# Check if file exists
if [ ! -f "$LOGFILE" ]; then
    echo "Error: File '$LOGFILE' does not exist."
    exit 1
fi

echo "Log file found: $LOGFILE"
echo "Input validation successful!"

echo " ============================= TASK 2 - ERROR COUNT ==============================="

echo "Count the total number of lines containing the keyword ERROR or Failed"

awk '/ERROR/ {print $1, $3, $4, $6, $7, $8, $9, $10}' zookeeper.log
echo "Print the total error count to the console"

awk '/ERROR/ {print $1, $3, $4, $6, $7, $8, $9, $10}' zookeeper.log | wc -l 


echo " ============================= TASK 3 - CRITICAL EVENTS  ==============================="

echo "Search for lines containing the keyword CRITICAL"
awk '/CRITICAL/ {print $1, $3, $4, $6, $7, $8, $9, $10}' zookeeper.log

echo "Print those lines along with their line number"
awk '/CRITICAL/ {print $1, $3, $4, $6, $7, $8, $9, $10}' zookeeper.log | wc -l

echo "Log analysis completed."

echo "============================= TASK 4 - TOP ERROR MESSAGES ==============================="

echo "Display top error messages using occurrence count, sorted in descending order"

grep "ERROR" zookeeper.log | awk '{$1=$2=$3=""; print}' | sort | uniq -c | sort -rn | head -5
echo "Error Message Displayed"

