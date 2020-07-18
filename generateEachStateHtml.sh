#!/bin/bash

#  generateEachState.sh
#  
#
#  Created by Tianyu Zhang on 7/16/20.
#  

#!/bin/bash

#  Covid19.sh
#
#
#  Created by Tianyu Zhang on 7/15/20.
# This script create webpages for each state in the US
state=$1

cat<<HTML_top


<!DOCTYPE html>


<html>
    <head>
        <title>Covid19 Tracking</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
        table, th, td {
            border: 1.5px solid green;
        }
        </style>
    </head>

    <body>
        <center>
        <h1>Covid-19 Data: $state</h1>
        <table>

HTML_top
    
#need to install libaries jq

stateFile=data/stateDaily.txt
usFile=data/usDaily.txt


cat "$stateFile"|jq -r --arg v "$state" '.[]|select(.state==$v)|"\(.date)\t\(.state)\t\(.positive)"'|awk -v FS="\t" 'BEGIN{print "<thead><tr><th>Date</th><th>State</th><th>Positive Cases</th></tr></thead><tbody>"}{printf("<tr><td style=\"text-align:center;height:50px;width:100px\">%s</td><td style=\"text-align:center;height:50px;width:100px\">%s</td><td style=\"text-align:center;height:50px;width:100px\">%s</td></tr>\n",$1,$2,$3);} END {print "</tbody>"}'


cat<<HTML_BOT

            </center>
            </table>
            </body>

        </html>

HTML_BOT

