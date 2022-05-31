#!/bin/bash

PAGE=$1
FOLDER=$2

[[ -z $PAGE ]]   && echo "ERROR: no URL is given" && exit 1
[[ -z $FOLDER ]] && echo "ERROR: no output FOLDER is given" && exit 1

[[ ! -f $PAGE ]] && echo "ERROR: cannot find input file $PAGE" && exit 1

links=$( grep "\$_59" $PAGE | grep "img src" | grep -o "https.*JPG" )

i=1

for s in $links
do
    wget $s -O $FOLDER/$i.jpg
    i=$((i+1))
done
