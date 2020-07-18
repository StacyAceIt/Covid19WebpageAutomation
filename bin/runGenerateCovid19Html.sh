#!/bin/bash

#need to install libaries jq


mkdir -p ../output

fileName=Covid19.html

#create generateCovid19Html.html
echo "create table for all states"
chmod 755 generateCovid19Html.sh
./generateCovid19Html.sh>../output/$fileName

