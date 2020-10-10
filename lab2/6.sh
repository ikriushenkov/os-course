#!/bin/bash
for i in $(ps -A -o pid | tail -n +2)
do
if [ ! -f "/proc/$i/status" ]
 then 
    continue
  fi
grep -E "^VmRSS:" /proc/$i/status | awk -v var="$i" '{print $2 " " var}'
done | sort -n | tail -n 1 | awk '{print $2}'