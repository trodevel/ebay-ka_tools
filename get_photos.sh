#!/bin/bash

LINK=$1
FOLDER=$2

[[ -z $LINK ]]   && echo "ERROR: no URL is given" && exit 1
[[ -z $FOLDER ]] && echo "ERROR: no output FOLDER is given" && exit 1

[[ ! -d $FOLDER ]] && mkdir $FOLDER

datum=$( date -u +"%Y%m%d_%H%M%S" )
PAGE=$FOLDER/get_photos_page_${datum}_${RANDOM}

./fetch_page.sh "$LINK" "$PAGE"

./fetch_photos.sh "$PAGE" "$FOLDER"

rm $PAGE
