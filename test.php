<?php include 'db.php';?>
<?php
date_default_timezone_set('Asia/Kolkata');
$sql = "SELECT * FROM total where id=1";
$result = $conn->query($sql);
      if ($result->num_rows > 0) {
          while($row = $result->fetch_assoc()) {
              $total = $row['total'];
              $active = $row['active'];
              $recovered = $row['recovered'];
              $deaths = $row['deaths'];
              $itotal = $row['itotal'];
              $irecovered = $row['irecovered'];
              $ideaths = $row['ideaths'];
              $last_update = $row['last_update'];
              $last_update = strtotime($last_update);
              $last_update_str = date("d M, H:i", $last_update);
          }
      }
      if($itotal != 0){
        $total = $total."[+".$itotal."]";
      }
      if($irecovered != 0){
        $recovered = $recovered."[+".$irecovered."]";
      }
      if($ideaths != 0){
        $deaths = $deaths."[+".$ideaths."]";
      }

      $diff_total = strtotime(date('Y-m-d H:i:s')) - $last_update;

      if($diff_total<60){
        $diff_str = $diff_total." Minutes Ago";
      }
 ?>
<?php

$date = (date('Y-m-d H:i:s'));
echo strtotime($date)."<br>".$last_update."<br>".strtotime('2020-04-11 22:35:24');
 ?>
