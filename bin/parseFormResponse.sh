#!/bin/bash

#  parseCresponse.sh
#  
#
#  Created by Tianyu Zhang on 7/19/20.
#  
stateFile=../data/stateDaily.txt
usFile=../data/usDaily.txt

state=$1
date=$2

echo "state: $state"
echo "date: $date"

cat "$stateFile"|jq -r  --arg s ${state} --arg d ${date} '.[]|select(((.date|tonumber)==($d|tonumber)) and (.state==$s))|.positive'

result=$(cat "$stateFile"|jq -r  --arg s ${state} --arg d ${date} '.[]|select(((.date|tonumber)==($d|tonumber)) and (.state==$s))|.positive')

echo "positive cases: $result"
