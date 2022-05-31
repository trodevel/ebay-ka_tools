#!/bin/bash

LINK=$1
FOLDER=$2

[[ -z $LINK ]]   && echo "ERROR: no URL is given" && exit 1
[[ -z $FOLDER ]] && echo "ERROR: no output FOLDER is given" && exit 1

[[ ! -d $FOLDER ]] && mkdir $FOLDER

datum=$( date -u +"%Y%m%d_%H%M%S" )
PAGE=$FOLDER/get_photos_page_${datum}_${RANDOM}

./fetch_page.sh "$LINK" "$PAGE"

links=$( grep "\$_59" $PAGE | grep "img src" | grep -o "https.*JPG" )

i=1

for s in $links
do
    wget $s -O $FOLDER/$i.jpg
    i=$((i+1))
done

rm $PAGE
