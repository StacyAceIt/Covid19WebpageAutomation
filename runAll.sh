#!/bin/bash

#  runAll.sh
#  
#
#  Created by Tianyu Zhang on 7/17/20.
#  

chmod 755 getData.sh
./getData.sh

chmod 755 runGenerateEachStateHtml.sh
./runGenerateEachStateHtml.sh

chmod 755 runGenerateCovid19Html.sh
./runGenerateCovid19Html.sh

chmod 755 runGenerateFormHtml.sh
./runGenerateFormHtml.sh


