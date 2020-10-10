#!/bin/bash
a=()
for i in $(top -b -n 1 | tail -n +8 | awk '{print $6 "|" $1 "|" $12}')
do
 a+=($i)
done
sleep 1m
a1=()
for i in $(top -b -n 1 | tail -n +8 | awk '{print $6 "|" $1 "|" $12}')
do
 a1+=($i)
done
for i in ${!a[@]}
do
b1=$(echo ${a[i]} | awk -F'|' '{print $1}')
b2=$(echo ${a1[i]} | awk -F'|' '{print $1}')
pid=$(echo ${a[i]} | awk -F'|' '{print $2}')
cmd=$(echo ${a[i]} | awk -F'|' '{print $3}')
let dif=b1\-b2
echo $dif" "$pid" "$cmd
done | sort -n -r | head -n 3 | awk '{print $2 ":" $3 ":" $1}'