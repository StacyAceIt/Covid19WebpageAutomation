#!/bin/bash
echo Content-type: text/html
echo ""

cat<<HTML_top

<!DOCTYPE html>
<html>
<style>
table, th, td {border: 1.5px solid green;font-size:20px;text-align:center;vertical-align:middle}

</style>
<center>
<table>
<thead>
  
<tr height=150><th width=300>State</th>
               <th width=300>Date</th>
               <th width=300>Positive Cases</th></tr>
  
</thead>
  
<tbody>
  
<tr height=150><td>

HTML_top

state_query=$(echo "$QUERY_STRING"|awk '{split($0,array,"&")} END{print array[1]}')

state_value=$(echo $state_query|awk '{split($0,array,"=")} END{print array[2]}')

echo $state_value



#echo state

cat<<BETWEEN_STATE_AND_DATE

</td>
<td>

BETWEEN_STATE_AND_DATE

#echo date

date_query=$(echo "$QUERY_STRING"|awk '{split($0,array,"&")} END{print array[2]}')

date_value=$(echo $date_query|awk '{split($0,array,"=")} END{print array[2]}')
echo $date_value


cat<<PRINT_CASES
</td>
<td>

PRINT_CASES

#echo positive cases
stateFile=../data/stateDaily.txt

echo "from awk"
cat $stateFile|perl -pe "s|},{|\n|g"|awk -v myState="$state_value" -v myDate="$date_value" 'BEGIN{FS=","} $1~myDate && $2~myState {print $3}'|awk -F ':' '{print $2}'

echo "from jq"
cat $stateFile|jq -r '.[]|date'

cat<<HTML_bot

                </td></tr>
    
  </tbody>
        
  </table>
  </center>
</html>

HTML_bot

