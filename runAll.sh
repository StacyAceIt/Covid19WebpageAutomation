#!/bin/bash

#  runAll.sh
#  
#
#  Created by Tianyu Zhang on 7/17/20.
#  

chmod 755 bin/getData.sh
./bin/getData.sh

chmod 755 bin/runGenerateEachStateHtml.sh
./bin/runGenerateEachStateHtml.sh

chmod 755 bin/runGenerateCovid19Html.sh
./bin/runGenerateCovid19Html.sh

chmod 755 bin/runGenerateFormHtml.sh
./bin/runGenerateFormHtml.sh

apachectl start

