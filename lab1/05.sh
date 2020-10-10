#!/bin/bash
input="/var/log/syslog"
output="info.log"
awk '{if ($6 == "<info>") print $0}' $input >> $output