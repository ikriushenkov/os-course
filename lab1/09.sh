#!/bin/bash
input="/var/log/"
ans=0
for i in $(find $input -name '*.log' 2>/dev/null)
do 
a=($(wc -l $i 2>/dev/null))
let ans=ans\+a
done
echo $ans

find /var/log/ -name '*.log' -type f -print0 2>/dev/null | xargs -0 cat 2>/dev/null | wc -l


