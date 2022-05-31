#!/bin/bash

INP=$1
OUTP=$2

[[ -z $INP ]]   && echo "ERROR: INP is not given" && exit 1
[[ -z $OUTP ]]  && echo "ERROR: OUTP is not given" && exit 1

[[ ! -f $INP ]] && echo "ERROR: file $INP not found" && exit 1

#grep -o "LibertyWrapper.init({.*" $INP | sed -e "s/^LibertyWrapper.init(//" -e "s/);$//" | sed -e 's/, {"%ENCODED_BIDDER_CUSTOM_PARAMS%".*//' | jq . > ${INP}_2.json
grep -o "LibertyWrapper.init({.*" $INP | sed -e "s/^LibertyWrapper.init(//" -e "s/);$//" | grep -o '{"%ENCODED_BIDDER_CUSTOM_PARAMS%".*' | jq . > $OUTP
