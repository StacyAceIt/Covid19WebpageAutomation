#!/bin/bash

#need to install libaries jq

stateFile=data/stateDaily.txt
usFile=data/usDaily.txt


#create output/StateData/*.html

stateNames=$(cat "$stateFile"|jq -r '.[]|select(.date==20200715)|.state')
mkdir -p output/stateData
chmod 755 generateEachStateHtml.sh

for i in $stateNames
do
    echo "creating page for $i state"
    
    ./generateEachStateHtml.sh $i>"output/stateData/$i.html"

done

