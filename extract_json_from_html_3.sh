#!/bin/bash

INP=$1
OUTP=$2

[[ -z $INP ]]   && echo "ERROR: INP is not given" && exit 1
[[ -z $OUTP ]]  && echo "ERROR: OUTP is not given" && exit 1

[[ ! -f $INP ]] && echo "ERROR: file $INP not found" && exit 1

awk '/Belen.Search.ViewAdView.init\({/,/}\);/' $INP | sed -e "s/Belen.Search.ViewAdView.init(//" -e "s/});/}/" | grep -v "adImageUrl" | sed 's/\(\w\+\):/"\1":/' | tr "'" '"' | jq . > $OUTP
