#!/bin/bash

# Disk Space Usage Monitor script
# this script checks disk space usage and logs warning or send email if usage > 80%

THRESHOLD=80
LOGFILE="/var/log/disk-alert.log"
EMAIL="ydolly2307@gmail.com"

# Getting the disk usage percentage from the root partition
USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

# Here checking the usage exceed threshold
if [ "$USAGE" -gt "$THRESHOLD" ]; then
	MESSAGE = "Warning: Disk usage is at ${USAGE}% on ${hotsname} - $(date)"

        # Writing the log file  
        echo "$MESSAGE" >> "$LOGFILE"

        # optionally sending the email to intended user that his/her disk usage is exceeded on hostname 
        if command -v  mail > /dev/null 2>&1; then
		echo "MESSAGE" | mail -s "Disk Space Alert: $(hostname)"  "$EMAIL"
	fi
fi
