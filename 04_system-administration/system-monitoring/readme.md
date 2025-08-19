
# 📡 Linux System Monitoring Script

## Overview
A lightweight shell script that monitors CPU, RAM, and Disk usage, alerting if thresholds are exceeded.

## Features
- Monitor CPU, memory, and disk usage
- Threshold-based alerts
- Sends log report

## Technologies
- Bash scripting
- Cron jobs

## Usage
```bash
chmod +x monitor.sh
./monitor.sh

```

---

To run every 5 minutes with cron:

> */5 * * * * /path/to/monitor.sh >> /var/log/sysmonitor.log

---

Impact

Proactive system health monitoring

Reduced downtime with early alerts


**Script (`monitor.sh`)**
```bash
#!/bin/bash
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
MEM=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
DISK=$(df / | grep / | awk '{print $5}' | sed 's/%//g')

echo "CPU: $CPU% | MEM: $MEM% | DISK: $DISK%"

if [ $(echo "$CPU > 80" | bc) -eq 1 ]; then
  echo "High CPU usage detected!"
fi

if [ $(echo "$MEM > 80" | bc) -eq 1 ]; then
  echo "High Memory usage detected!"
fi

if [ $DISK -gt 80 ]; then
  echo "Disk usage is above 80%!"
fi
