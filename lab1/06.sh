#!/bin/bash
input="/home/ilya/.local/share/xorg/Xorg.0.log"
output="full.log"
warning="(WW)"
info="(II)"
new_warning="Warning:"
new_info="Information:"

warnings=$(grep $warning $input)
informations=$(grep $info $input)
echo "${warnings//$warning/$new_warning}" > $output
echo "${informations//$info/$new_info}" >> $output
