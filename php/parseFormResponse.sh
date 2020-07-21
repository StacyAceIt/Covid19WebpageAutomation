#!/bin/bash

#  parseCresponse.sh
#  
#
#  Created by Tianyu Zhang on 7/19/20.
#  
stateFile=/Users/yolanda7zhang/Sites/Covid19Project/data/stateDaily.txt
usFile=/Users/yolanda7zhang/Sites/Covid19Project/data/usDaily.txt

state_value=$(echo $1|tr -dc [:alnum:])
date_value=$(echo $2|tr -dc [:alnum:])

#echo "state $state_value"
#echo "date $date_value"

echo "from awk"
cat $stateFile|perl -pe "s|},{|\n|g"|awk -v myState="$state_value" -v myDate="$date_value" 'BEGIN{FS=","} $2~myState && $1~myDate {print $3}'|awk -F ':' '{print $2}'

echo "from jq"
cat $stateFile|jq '.[]|.date'
#|select(((.date|tonumber)==($date|tonumber)) and (.state==$state))|.positive
