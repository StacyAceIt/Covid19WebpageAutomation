#!/bin/bash

#  runAll.sh
#  
#
#  Created by Tianyu Zhang on 7/17/20.
#

siteFolder=/Users/yolanda7zhang/Sites/Covid19Project

cd bin/

chmod 755 getData.sh
./getData.sh

chmod 755 runGenerateEachStateHtml.sh
./runGenerateEachStateHtml.sh

chmod 755 runGenerateCovid19Html.sh
./runGenerateCovid19Html.sh

chmod 755 runGenerateFormHtml.sh
./runGenerateFormHtml.sh

cd ..

echo "copying output to Site folder"
cp -r output $siteFolder
cp -r data $siteFolder
cp -r bin $siteFolder

apachectl start

myCgi=/Users/yolanda7zhang/Sites/Covid19Project/bin/formResponse.cgi

chmod 755 $myCgi

open -a Google\ Chrome http://127.0.0.1/Covid19Project/output/Covid19.html


open -a Google\ Chrome http://127.0.0.1/Covid19Project/output/Form.html



