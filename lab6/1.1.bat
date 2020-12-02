@echo off
chcp 65001
md c:\lab6
cd /d c:\lab6
ver > ver.txt
systeminfo | find "Virtual Memory: Available:" > system_info_find1.txt
systeminfo | find "Virtual Memory: In Use:" > system_info_find2.txt
echo list volume | diskpart | more +7 > diskpart.txt