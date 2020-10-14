#!/bin/bash
echo $$ > 6.pid
s=1
cur=0
usr1() 
{
    cur=0
}
usr2() 
{
    cur=1
}
term() 
{
    cur=2
}
trap 'usr1' USR1
trap 'usr2' USR2
trap 'term' SIGTERM
while true 
do
    if [[ $cur == 0 ]]
    then
        s=$(($s + 2))
    elif [[ $cur == 1 ]]
    then
        s=$(($s * 2))
    elif [[ $cur == 2 ]]
    then
        echo "Get signal to exit from gen"
        echo $s
        exit 0
    fi
    sleep 1
done