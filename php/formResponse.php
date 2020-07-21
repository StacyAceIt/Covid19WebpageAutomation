
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
    
  <tr height=150><td><?php echo $_GET["state"];?></td>
                <td><?php echo $_GET["date"];?></td>
                <td>

<?php
    $state = $_GET["state"];
    $date = $_GET["date"];
    $state = escapeshellarg($state);
    $date = escapeshellarg($date);
//passes value to bash
    $command1 = './parseFormResponse.sh " '.$state.' " " '.$date.' "';
    echo shell_exec($command1);
    
// doesn't work; nothing prints out
//    $command = "./parseFormResponse.sh {$state} {$date})";
//
//
//    echo shell_exec($command);

?>


                </td></tr>
    
  </tbody>
        
  </table>
  </center>
</html>



