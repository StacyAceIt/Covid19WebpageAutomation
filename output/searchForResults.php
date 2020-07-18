<?php
 
    $state=$_GET['state'];
    $date=$_GET['date'];
    
    if(empty($state)||empty($date)){
        echo "<h4>Please enter State and Date</h4>\n";
        die("Please enter again");
        
    }
    
    echo "<table><thead><tr><th>State</th> </tr> <tr><th>date</th> </tr></thead><tbody><tr><td>$state</td><td>$date</td></tr></tbody></table>";
    
?>
