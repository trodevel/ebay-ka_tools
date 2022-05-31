#!/bin/bash

ID=$1

[[ -z $ID ]]     && echo "ERROR: no ID is given" && exit 1

AGENT="user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.182 Safari/537.36"

LINK="https://www.ebay-kleinanzeigen.de/s-vac-inc-get.json?adId=$ID"

datum=$( date -u +"%Y%m%d_%H%M%S" )
OUTP=/tmp/get_views_by_id_${datum}_${RANDOM}

curl -H "$AGENT" "$LINK" -s > $OUTP
res=$?

[[ $req -ne 0 ]] && echo "ERROR: cannot fetch data, ec $res" && exit 1

jq ".numVisits" $OUTP

rm $OUTP

exit 0
