#!/bin/bash
array=()
while [[ ${#array[*]} -le $1 ]]
do
    array+=(0 1 2 3 4)
done