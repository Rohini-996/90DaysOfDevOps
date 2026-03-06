#!/bin/bash

# Function 1: Check Disk Usage
check_disk() {
    disk_usage=$(df -h / | tail -1)
    echo "$disk_usage"
}

# Function 2: Check Memory Usage
check_memory() {
    memory_usage=$(free -h | grep Mem)
    echo "$memory_usage"
}

# Main Section
echo "Disk Usage of / :"
check_disk

echo ""
echo "Memory Usage :"
check_memory

