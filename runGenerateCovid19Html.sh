#!/bin/bash

#need to install libaries jq

#stateFile=data/stateDaily.txt
#usFile=data/usDaily.txt

mkdir -p output

#create generateCovid19Html.html
echo "create table for all states"
chmod 755 generateCovid19Html.sh
./generateCovid19Html.sh>output/Covid19.html

open -a Google\ Chrome ./output/Covid19.html
