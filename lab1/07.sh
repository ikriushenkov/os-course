#!/bin/bash
input="/etc"
output="emails.lst"
email="\w+@\w+\.\w+"
emails=$(grep -r -E -o -h --text -s $input -e $email)
echo $emails > $output