#!/bin/bash

LINK=$1
OUTP=$2

[[ -z $LINK ]]   && echo "ERROR: no URL is given" && exit 1
[[ -z $OUTP ]]   && echo "ERROR: no OUTP is given" && exit 1

AGENT="user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36"

curl -H "$AGENT" "$LINK" > $OUTP
