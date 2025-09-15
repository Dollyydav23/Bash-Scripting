**Bash scripting top 4 task**
## Task:
1.	Bash script that monitors disk usage and generates an alert when usage exceeds a defined threshold (default: 80%).  It is ideal for system administrators and DevOps engineers to prevent servers from running out of disk space.
2.	Creating a advanced log analyzer where we parsing a log file along with counting occurrence of "ERROR", "WARNIG", and "INFO". at the end printing the summary report with percentage.
3. Bash script that checks the CPU, Memory, Disk Usage, Uptime and Processes and save the result in system_health.log.
4. This Bash script allows you to check the read, write, and execute permissions of a file for the current user.
5. This script will take a file and directory as input and create a backup copy and Changes the permissions of the original file/directory.

**Command used for  the task are as follow:**
## Explanation of Script Commands:- Task 1
1. set -euo pipefail
 - -e: Exit if any command fails.
 - -u: Error if an undefined variable is used.

 ----Argument & File Checks----
2. if [ "${1:-}" = "" ]; then ... fi :-->  this checks if the first argrument meas logfile path is provided is exist or not
3. if [ ! -f "$log" ]; then ... fi :--> this ensure that the file exits 
4. awk :--> It is mainly used for pattern scanning and processing
   syntax: 
   awk 'pattern { action }' filename
in task this used with various logics and i take help of google to write as per my task requrement
5. percent() function --> used to combined the logic of my script.

---
## Explanation of Script Commands:- Task 2
1. used the variable THRESHOLD=80 :--> sets the disk usage alert threshold to 80%
2. LOGFILE="/var/log/disk-alert.log" :--> its the file path for storing disk alert logs.
3. EMAIL="ydolly2307@gmail.com" :--> used email address to receive alerts.
4. df -h / :--> used to display disk usage in human readable formate.
5. awk 'NR==2 {print $5}' :--> this extracts the usage percentage value.
6. sed 's/%//' :--> this remove the symbol of % and give value in numeric.
7. used if else fi conditions to check the disk space usage and print the alert.
---
## Explanation of Script Commands:- Task 3
1. LOG_FILE="/var/log/system_health.log" :--> The report will be stored here 
2. print_header() :--> used the function to print the current date.
3. check_cpu() :--> uses the function with mpstat and awk commands
 **mpstat:** Used this from the sysstat package to get the CPU usage.
   **$12:** This is the idle CPU percentage and it subtract from 100 to get actual usage.
4. check_memory() :--> Used the function check memory with free -h nad awk cammand.
   **free -h:** This shows the memory usage in human readable form.
   **awk:** Extracts used and total memory and calculate the percentage.
5. Check_disk(): Used the function check disk with df -h and output and column -t.
   **df -h:** This command helps to list the partitions in human-readable size.
   **--output:** This show the device size, used, avaiable and %.
   **column -t:** This aligns everything in table formate.
6. check_uptime(): Show the how long the system has been running.
7. check_top_processes() : Used the function check_top_processes with the following commands.
   **ps -eo:** This shows the running processes with cloumns
   **pid:** Give the process id.
   **%cpu/ %mem:** Give the resource usage.
   then it sorted by highest usage , then head shows top 5 row.
---
## Explanation of Script Commands:- Task 4
1. 






