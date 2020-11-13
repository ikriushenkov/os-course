#!/bin/bash
Date=$(date +"%Y-%m-%d")
min=9223372036854775807
dir=""
for l in $(ls -dl ~/*/ | awk '{print $9}' | awk -F/ '{print $4}' | grep -E "^Backup-[0-9]{4}-[0-9]{2}-[0-9]{2}")
do
    oldDate=$(echo "$l" | awk -F'-' '{print $2"-"$3"-"$4}')
    diff=$((($(date -d "$Date" +%s) - $(date -d "$oldDate" +%s)) / 86400))
    if [[ "$diff" -lt "$min" ]]
    then
        min="$diff"
        dir="$l"
    fi
done
if [[ -n "$dir" ]]
then
    oldDate=$(echo "$l" | awk -F'-' '{print $2"-"$3"-"$4}')
    find ~/"$dir" -type f | grep -v ".[0-9]{4}-[0-9]{2}-[0-9]{2}$" |
    while read l
    do
        file=$(echo "$l" | awk -F/ 'OFS="/"{$4="restore" ; print $0}')
        mkdir -p $(echo "$file" | awk -F/ 'OFS="/"{$NF="" ; print $0}')
        cp "$l" "$file"
    done
fi