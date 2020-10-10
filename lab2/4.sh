#!/bin/bash
output="output4.txt"
for i in $(ps -A -o pid | tail -n +2)
do
if [ ! -f "/proc/$i/sched" ] || [ ! -f "/proc/$i/status" ]
 then 
    continue
  fi
r1=$(grep -E "^PPid:" /proc/$i/status | awk '{print $2}')
r2=$(grep -E "^se.sum_exec_runtime" /proc/$i/sched | awk '{print $3}' | awk -F. '{print $1}')
r3=$(grep -E "^nr_switches" /proc/$i/sched | awk '{print $3}')
let r2=r3\/r2 2>/dev/null
echo "ProcessID="$i" : Parent_ProcessID="$r1" : Average_Running_Time="$r2 >> $output
done