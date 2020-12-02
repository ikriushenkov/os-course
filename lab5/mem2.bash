#!/bin/bash
array=()
i=0
while true
do
    array+=(0 1 2 3 4)
    i=$(((i + 1) % 10000))
    if [[ $i -eq 0 ]]
    then
        echo ${#array[*]}
    fi
done > report2.log