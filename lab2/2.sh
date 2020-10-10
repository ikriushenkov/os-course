#!/bin/bash
output="output2.txt"
ps -ef | awk '{if ($8 ~ /^\/sbin\//) print $2}' > $output