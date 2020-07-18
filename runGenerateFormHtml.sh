#!/bin/bash

#  runInteractivePage.sh
#  
#
#  Created by Tianyu Zhang on 7/17/20.
#

#stateFile=data/stateDaily.txt
#usFile=data/usDaily.txt

mkdir -p ./output

chmod 755 generateFormHtml.sh
./generateFormHtml.sh>./output/Form.html

open -a Google\ Chrome ./output/Form.html
