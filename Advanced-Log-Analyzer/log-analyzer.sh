#!/bin/bash

#Creating a advanced log analyzer where we parsing a log file along 
#with counting occurrence of "ERROR", "WARNIG", and "INFO".
#at the end printing the summary report with percentage.

set -euo pipefail

if [ "${1:-}" = "" ]; then
	echo "Usage: $0 /path/to/logfile"
	exit 1
fi

 log="$1"
if [ ! -f "$log" ]; then
	 echo " File not found: $log"
	 exit 1
fi

# Countig the occurences (case-insenitive) and total lines

read -r error warnings infos total < <(
awk 'BEGIN{IGNORECASE=1; e=0; w=0; i=0; t=0}
{ t++ }
(/ERROR/){ e++ }
(/WARNING/){ w++ }
(/INFO/){ i++ }
END{ print e, w, i,t }' "$log"
)

percent(){
	awk -v n="$1" -v t="$2" 'BEGIN{ if (t==0) {print "0.00"} else {printf "%.2f", (n/t)*100 } }'
}

err_p=$(percent "$errors" "$total")
warn_p=$(percent "$warnings" "$total")
info_p=$(percent "$infos" "$total")

printf "Analyzing: %s\n\n" "$log"
printf "----- Log Summary -----\n"
printf "INFO:    %d  (%s%%)\n" "$infos" "$info_p"
printf "WARNING: %d  (%s%%)\n" "$warnings" "$warn_p"
printf "ERROR:   %d  (%s%%)\n" "$errors" "$err_p"
printf "-----------------------\n"
printf "Total lines analyzed: %d\n" "$total"


