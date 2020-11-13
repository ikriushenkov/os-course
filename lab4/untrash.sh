#!/bin/bash
grep -E "^original: " ~/.trash.log |
while read l
do
    copy=~/.trash/$(echo "$l" | awk '{print $4}')
    if [[ ! -f "$copy" ]]
    then
        continue
    fi
    file=$(echo "$l" | awk '{print $2}')
    name=$(echo "$file" | awk -F/ '{print $NF}')
    if [[ "$name" == "$1" ]]
    then
        read -p "Return $file? y/n " ans <&1
        if [[ "$ans" == "y" ]]
        then
            dir=$(echo "$file" | awk -F/ 'OFS="/"{$NF="" ; print $0}')
            if [[ ! -d "$dir" ]]
            then
                echo "$dir already deleted. Returned in home directory"
                dir=~/
            fi
            while [[ -f "$dir"/"$name" ]]
            do
                read -p "File with this name already exists. Please, enter new name: " name <&1
            done
            ln "$copy" "$dir/$name"
            rm "$copy"
        fi
    fi
done