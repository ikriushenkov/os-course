#!/bin/bash
read a
ans=""
while [[ $a != "q" ]]
do
ans=$ans$a
read a
done
echo $ans