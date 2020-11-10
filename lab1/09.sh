#!/bin/bash
input="/var/log/"
ans=0
for i in $(find $input -name '*.log' 2>/dev/null)
do 
a=($(wc -l $i 2>/dev/null))
let ans=ans\+a
done
echo $ans

