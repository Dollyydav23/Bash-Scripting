#!/bin/bash

# This script checks the CPU, Memory, Disk usage,Uptime and Processes and saves the result in the system_health.log.

#!/bin/bash

LOG_FILE="/var/log/system_health.log"

# Function to print header
print_header() {
    echo "=============================="
    echo "   System Health Report"
    echo "   Date: $(date)"
    echo "=============================="
}

# Function to check CPU usage
check_cpu() {
    echo "[CPU Usage]"
    mpstat 1 1 | awk '/Average/ && $12 ~ /[0-9.]+/ {print 100 - $12 "% used"}'
    echo
}

# Function to check memory usage
check_memory() {
    echo "[Memory Usage]"
    free -h | awk '/Mem/ {print "Used: "$3" / Total: "$2" ("$3*100/$2"%)"}'
    echo
}

# Function to check disk usage
check_disk() {
    echo "[Disk Usage]"
    df -h --output=source,size,used,avail,pcent,target | column -t
    echo
}

# Function to check system uptime
check_uptime() {
    echo "[Uptime]"
    uptime -p
    echo
}

# Function to check top 5 processes by CPU and Memory
check_top_processes() {
    echo "[Top 5 Processes by CPU]"
    ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
    echo
    echo "[Top 5 Processes by Memory]"
    ps -eo pid,comm,%mem --sort=-%mem | head -n 6
    echo
}

# Run Checks

{
    print_header
    check_cpu
    check_memory
    check_disk
    check_uptime
    check_top_processes
    echo "Report saved at: $LOG_FILE"
    echo "--------------------------------------------"
} | tee -a "$LOG_FILE"

