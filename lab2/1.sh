#!/bin/bash
user="ilya"
output="output1.txt"
ans=$(ps U $user | tail -n +2 | awk '{print $1 ":" $5}')
echo "$ans" | wc -l > $output
echo "$ans" >> $output