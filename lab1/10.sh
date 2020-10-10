#!/bin/bash
regex="\w{4,}"
man bash | grep -o -E $regex | tr [A-Z] [a-z] | sort | uniq -c | sort -r -n | head -n 3
