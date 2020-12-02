@echo off
schtasks /create /sc minute /mo 1 /tn twopointtwo /tr d:\code\os\2.2.bat