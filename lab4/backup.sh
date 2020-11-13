#!/bin/bash
Date=$(date +"%Y-%m-%d")
for l in $(ls -dl ~/*/ | awk '{print $9}' | awk -F/ '{print $4}' | grep -E "^Backup-[0-9]{4}-[0-9]{2}-[0-9]{2}")
do
    oldDate=$(echo "$l" | awk -F'-' '{print $2"-"$3"-"$4}')
    diff=$((($(date -d "$Date" +%s) - $(date -d "$oldDate" +%s)) / 86400))
    if [[ "$diff" -le 7 ]]
    then
        oldDir="$l"
        oldFiles=""
        newFiles=""
        for l in $(find ~/source -type f | cut -d/ -f 5-)
        do
            if [[ -f ~/"$oldDir"/"$l" ]]
            then
                if [[ $(stat --printf="%s" ~/"$oldDir"/"$l") -ne $(stat --printf="%s" ~/source/"$l") ]]
                then
                    mv ~/"$oldDir"/"$l" ~/"$oldDir"/"$l.$Date"
                    oldFiles="$oldFiles $l $l.$Date"
                    cp ~/source/"$l" ~/$oldDir/"$l"
                fi
            else
                mkdir -p $(echo ~/"$oldDir"/"$l" | awk -F/ 'OFS="/"{$NF="" ; print $0}')
                cp ~/source/"$l" ~/$oldDir/"$l"
                newFiles="$newFiles $l"
            fi
        done
        echo "Created new Backup-$Date" >> ~/backup_report
        echo "New files: $newFiles"$'\n'"Old files: $oldFiles" >> ~/backup_report
        exit 0
    fi
done
cp -a ~/source ~/Backup-"$Date"
echo "Created new Backup-$Date" >> ~/backup_report
ls -R ~/Backup-"$Date" >> ~/backup_report 