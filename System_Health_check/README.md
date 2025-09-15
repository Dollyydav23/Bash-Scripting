# System Health Check Script

A simple Bash script to monitor the health of your Linux system. It provides CPU usage, memory usage, disk usage, uptime, and top processes by CPU and memory.

---

## Features

- ✅ Check CPU usage  
- ✅ Check memory usage  
- ✅ Check disk usage  
- ✅ Display system uptime  
- ✅ Show top 5 processes by CPU and memory  
- ✅ Save the report to a log file (`/var/log/system_health.log`)

---

## Requirements

- Linux system  
- Bash shell  
- `mpstat` (part of `sysstat` package)  
- `awk`, `ps`, `df`, `free`, `uptime` (usually pre-installed)

## Make the script executable:

chmod +x system_health.sh


## Run the script:

sudo ./system_health.sh


## Output will be displayed in the terminal and saved to:

/var/log/system_health.log

