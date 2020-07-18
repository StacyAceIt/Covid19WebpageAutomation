#!/bin/bash

#  generateCovid19Html.sh
#  
#
#  Created by Tianyu Zhang on 7/15/20.
#  

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
        <h1>Covid-19 Data by State</h1>
        <table>

HTML_top

#need to install libaries jq

stateFile=../data/stateDaily.txt
usFile=../data/usDaily.txt


mostRecentDate=$(cat "$stateFile"|jq 'max_by(.date).date')
cat "$stateFile"|jq -r --arg v "$mostRecentDate" '.[]|select(.date==($v|tonumber))|"\(.date)\t\(.state)\t\(.positive)"'|awk -v FS="\t" 'BEGIN{print "<thead><tr><th>Date</th><th>State</th><th>Positive Cases</th></tr></thead><tbody>"}{printf("<tr><td style=\"text-align:center;height:50px;width:100px\">%s</td><td style=\"text-align:center;height:50px;width:100px\"><a href=\"stateData/%s.html\">%s</a></td><td style=\"text-align:center;height:50px;width:100px\">%s</td></tr>\n",$1,$2,$2,$3);}END{print "</tbody>"}'



cat<<HTML_BOT

            </center>
            </table>
            </body>

        </html>

HTML_BOT

