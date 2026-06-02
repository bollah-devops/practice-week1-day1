#!/bin/bash


TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
HEALTH_LOG="/var/log/monitor/health.log"
ALERT_LOG="/var/log/monitor.alerts.log"

mkdir -p /var/log/monitor

# Get logs from last 10 minutes
RECENT_LOGS=$(awk -v date="$(date --date='10 minutes ago' '+%Y-%m-%d %H:%M:%S')" \
    '$0 >= date' $HEALTH_LOG 2>/dev/null)

# Count CRITICAL entries
CRITICAL_COUNT=$(echo "$RECENT_LOGS" | grep -c "CRITICAL")

# 
# Alert if threshold exceeded
if [ "$CRITICAL_COUNT" -gt 3 ]; then
    echo "$TIMESTAMP - ALERT - $CRITICAL_COUNT critical events in last 10 minutes" >> $ALERT_LOG
fi


chmod +x ~/Documents/practice/week1-day1/scripts/alert_checker.sh