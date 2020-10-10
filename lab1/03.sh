#!/bin/bash
options=("Open nano" "Open vi" "Open links" "Quit")
for((i=0; i < ${#options[*]}; i++))
do
echo $i") "${options[i]}
done
while true
do
echo "Select your choise: "
read choice
case $choice in
    0)
        nano
        ;;
    1)
        vi
        ;;
    2)
        links
        ;;
    3)
        break
        ;;
    *)
esac
done