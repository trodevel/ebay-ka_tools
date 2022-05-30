#!/bin/bash

LINK=$1
FOLDER=$2

[[ -z $LINK ]]   && echo "ERROR: no URL is given" && exit 1
[[ -z $FOLDER ]] && echo "ERROR: no FOLDER is given" && exit 1

[[ ! -d $FOLDER ]] && mkdir $FOLDER

AGENT="user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36"

datum=$( date -u +"%Y%m%d_%H%M%S" )
PAGE=get_photos_page_${datum}_${RANDOM}

curl -H "$AGENT" "$LINK" > $PAGE

links=$( grep "\$_59" $PAGE | grep "img src" | grep -o "https.*JPG" )

i=1

for s in $links
do
    wget $s -O $i.jpg
    i=$((i+1))
done

rm $PAGE
