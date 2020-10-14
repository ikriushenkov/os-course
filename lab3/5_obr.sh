#!/bin/bash
is_num="^[0-9]+"
cur=0
s=1
(tail -n 0 -f channel_5.txt) | 
while read l
do
    if [[ $l == "+" ]]
    then
        cur=0
    elif [[ $l == "*" ]]
    then
        cur=1
    elif [[ $l == "QUIT" ]]
    then
        echo $s
        exit 0
    elif [[ $l =~ $is_num ]]
    then
        if [[ $cur == 0 ]]
        then
            s=$(($s + $l))
        else
            s=$(($s * $l))
        fi
    else
        echo "ERROR! It's not a number"
        exit 1
    fi
done
