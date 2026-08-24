#!/bin/bash

echo "================================="
echo "      Linux System Health Check"
echo "================================="

CPU_USAGE=$(top -bn1 | awk '/Cpu\(s\)/ {print 100 - $8}')
echo "CPU Usage: ${CPU_USAGE}%"

CPU_THRESHOLD=80

if (( $(echo "$CPU_USAGE > $CPU_THRESHOLD" | bc -l) )); then
    echo "CPU Status: WARNING"
else
    echo "CPU Status: OK"
fi

MEMORY_USAGE=$(free | awk '/Mem:/ {printf "%.0f", ($3/$2)*100}')
MEMORY_THRESHOLD=80

echo "Memory Usage: ${MEMORY_USAGE}%"

if [ "$MEMORY_USAGE" -gt "$MEMORY_THRESHOLD" ]; then
    echo "Memory Status: WARNING"
else
    echo "Memory Status: OK"
fi

echo ""
echo "System Uptime:"
uptime -p

echo ""
echo "Load Average:"
uptime | awk -F'load average:' '{print $2}'
DISK_THRESHOLD=80

echo ""
echo "Disk Usage:"

df -h --output=target,pcent | awk 'NR>1 {
    gsub("%","",$2)
    printf "%-20s %s%%\n", $1, $2
}'

ROOT_DISK_USAGE=$(df / | awk 'NR==2 {gsub("%","",$5); print $5}')

if [ "$ROOT_DISK_USAGE" -gt "$DISK_THRESHOLD" ]; then
    echo "Disk Status: WARNING"
else
    echo "Disk Status: OK"
fi

echo ""
echo "Top Running Processes:"
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6

echo ""
echo "Failed systemd Services:"

FAILED_SERVICES=$(systemctl --failed --no-legend)

if [ -z "$FAILED_SERVICES" ]; then
    echo "Service Status: OK"
else
    echo "Service Status: WARNING"
    echo "$FAILED_SERVICES"
fi

echo ""
echo "Recent System Logs:"
journalctl -p warning -n 10 --no-pager
