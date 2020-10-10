#!/bin/bash
input="output4.txt"
output="output5.txt"
predppid=""
s=1
a=0
while read l
do
ppid=$(echo "$l" | awk -F: '{print $1}' | awk -F= '{print $2}')
aver=$(echo "$l" | awk -F: '{print $2}' | awk -F= '{print $2}')
if [[ -z $predppid ]]
  then
    predppid=$ppid
    continue
  fi
if [[ $ppid == $predppid ]]
 then
    let s=s\+1
    let a=a\+aver
else
    let a=a\/s
    echo "Average_Sleeping_Children_of_ParentID="$predppid" is "$a
    predppid=$ppid
    a=$aver
    s=1
fi
done < $input > $output

let a=a\/s
echo "Average_Sleeping_Children_of_ParentID="$ppid" is "$a >> $output