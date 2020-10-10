#!/bin/bash
ps -A -o pid,stime | tail -n +2 | sort -k2 | tail -n 1 | awk '{print $1}'