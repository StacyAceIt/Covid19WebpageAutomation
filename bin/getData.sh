#!/bin/bash

#  getData.sh
#  
#
#  Created by Tianyu Zhang on 7/17/20.
#  


states_daily=https://covidtracking.com/api/states/daily
us_daily=https://covidtracking.com/api/us/daily

stateFile=../data/stateDaily.txt
usFile=../data/usDaily.txt

#download json datasets

if ! [[ -f "$stateFile" ]]; then
    echo "stateFile does not exists";
    echo "downloading state data";
    mkdir -p ../data;
    curl $states_daily > $stateFile;
fi

if ! [[ -f $usFile ]]; then
    echo "usFile does not exists";
    echo "downloading us data";
    mkdir -p ../data;
    curl $us_daily > $usFile;
fi
