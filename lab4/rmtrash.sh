#!/bin/bash
[ -d ~/.trash ] || mkdir ~/.trash
if [[ ! -f $1 ]]
then
    echo "File doesn't exist!"
    exit 1
fi
ln "$1" ~/.trash/$(cat .number)
echo "original: $(realpath $1)  link: $(cat .number)" >> ~/.trash.log
echo $(($(cat .number) + 1)) > .number
rm $1