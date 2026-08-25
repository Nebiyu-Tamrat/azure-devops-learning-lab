# Linux System Health Check

## Description

A Bash-based system health-check automation tool that collects key Linux system metrics and evaluates selected resource usage against predefined thresholds.

## Purpose

The purpose of this project is to automate basic Linux system health checks and provide actionable information about system resource utilization, system load, running processes, failed services, and recent system warnings.

## Features

The script currently performs the following checks:

- CPU utilization monitoring
- Memory utilization monitoring
- Disk utilization monitoring
- System uptime
- System load average
- Running process information
- Failed systemd services
- Recent warning-level system logs
- Health-check completion status

## Thresholds

The following resource thresholds are currently configured:

| Resource | Threshold | Status |
|---|---:|---|
| CPU | 80% | WARNING when exceeded |
| Memory | 80% | WARNING when exceeded |
| Disk | 80% | WARNING when exceeded |

Resources within their defined thresholds are reported as `OK`.

## Requirements

The script is designed for Linux systems with Bash and the following utilities available:

- Bash
- `top`
- `awk`
- `free`
- `df`
- `uptime`
- `ps`
- `systemctl`
- `journalctl`

Some functionality, particularly systemd service and journal checks, requires a Linux distribution using systemd.

## Usage

Make the script executable:

```bash
chmod +x scripts/linux-health-check.sh