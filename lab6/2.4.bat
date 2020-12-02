@echo off
tasklist | find "Robocopy.exe" & taskkill /f /im "Robocopy.exe"