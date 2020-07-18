#!/bin/bash

#  generateFormHtml.sh
#  
#
#  Created by Tianyu Zhang on 7/17/20.
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
        
        select,input{
            font-size:20px
        }
        </style>
    </head>

    <body>
        <center>
        <h1>Covid-19 Data Tracking</h1>
        
        
        <form>
        <h2><label>Select a State and a Date</label></h2>

        <select name="state" id="state">
HTML_top

#need to install libaries jq

stateFile=data/stateDaily.txt
usFile=data/usDaily.txt


stateList=$(cat "$stateFile"|jq -r '.[]|select(.date==20200715)|.state')

dateList=$(cat "$stateFile"|jq '.[]|select(.state=="WA")|.date')

#create state dropdown list
echo "<option value=\"select a state\">Select a State</option>"
for i in $stateList
do
    echo "<option value=\""$i"\">$i</option>"
done

cat<<HTML_dateSelction

</select>

<select name="date" id="date">

HTML_dateSelction

#create date dropdownlist
echo "<option value=\"select a date\">Select a Date</option>"
for i in $dateList
do
    echo "<option value=\""$i"\">$i</option>"
done



cat<<HTML_BOT
            </select>

            <br><br>
           <input type="submit" value="Submit">
            </form>

        </center>
        </body>

        </html>

HTML_BOT

