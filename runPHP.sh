#!/bin/bash

#  runPHP.sh
#  
#
#  Created by Tianyu Zhang on 7/20/20.
#  
dest=/Users/yolanda7zhang/Sites/Covid19Project/php/

cp -r php/* $dest

chmod 755 /Users/yolanda7zhang/Sites/Covid19Project/php/parseFormResponse.sh

open -a Google\ Chrome http://127.0.0.1/Covid19Project/php/form.html

