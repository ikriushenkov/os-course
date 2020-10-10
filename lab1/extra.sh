#!/bin/bash
# /var/log все имена файлов
find /var/log -maxdepth 1 -type f | awk -F/ '{print $4}' | sort