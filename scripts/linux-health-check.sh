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