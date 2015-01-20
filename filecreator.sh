#!/bin/sh

index=$(ls newfile* 2> /dev/null | wc -l | sed 's/^[ \t]*//;s/[ \t]*$//')
echo $index
echo '' > "newfile $index.txt"
