#!/bin/bash

#  runCgi.sh
#  
#
#  Created by Tianyu Zhang on 7/20/20.
#  



dest=/Users/yolanda7zhang/Sites/Covid19Project/cgi/

mkdir -p $dest
cp -r cgi/* $dest

chmod 755 /Users/yolanda7zhang/Sites/Covid19Project/cgi/formResponse.cgi

open -a Google\ Chrome http://127.0.0.1/Covid19Project/cgi/form.html
