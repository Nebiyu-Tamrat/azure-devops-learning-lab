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