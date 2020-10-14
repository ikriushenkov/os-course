#!/bin/bash
pid=$(cat 6.pid)
while read l
do
    if [[ $l == "+" ]]
    then
        kill -USR1 $pid
    elif [[ $l == "*" ]]
    then
        kill -USR2 $pid
    elif [[ $l == "TERM" ]]
    then 
        kill -SIGTERM $pid
    fi
done