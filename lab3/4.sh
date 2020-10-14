#!/bin/bash
cpulimit --limit 20 ./4_dop.sh 2>/dev/null
nice ./4_dop.sh &
nice ./4_dop.sh &
kill $!