#!/bin/bash
Date=$(date +"%m-%d-%y_%T")
mkdir ~/test && {
    echo "catalog test was created successfully" > ~/report
    touch ~/test/$Date
  }
ping www.net_nikogo.ru 2>/dev/null || echo $Date" the requested host is unavailable" >> ~/report