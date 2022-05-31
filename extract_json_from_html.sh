#!/bin/bash

INP=$1
OUTP=$2

[[ -z $INP ]]   && echo "ERROR: INP is not given" && exit 1
[[ -z $OUTP ]]  && echo "ERROR: OUTP is not given" && exit 1

[[ ! -f $INP ]] && echo "ERROR: file $INP not found" && exit 1

grep -o "dimensions: {.*" $INP | sed -e "s/^dimensions: //" -e "s/,$//" | jq . > $OUTP
