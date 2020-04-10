<?php
include 'db.php';
//--------------------  Total ---------------------//

$link = "https://api.covid19india.org/data.json";
$response = file_get_contents($link);
$obj = json_decode($response,true);
$total = $obj["statewise"][0];
$confirmed = $total['confirmed'];
$recovered = $total['recovered'];
$deaths = $total['deaths'];
$active = $total['active'];
$iconfirmed = $total['deltaconfirmed'];
$irecovered = $total['deltarecovered'];
$ideaths = $total['deltadeaths'];
print_r($total);
echo "<br>".$confirmed."<br>".$recovered."<br>".$active."<br>".$deaths;
$sql = "UPDATE total set total=$confirmed, active=$active, recovered=$recovered, deaths=$deaths, itotal=$iconfirmed, irecovered=$irecovered, ideaths=$ideaths where id=1";
$result = $conn->query($sql);
print_r(mysqli_error($conn));

//--------------------  State ---------------------//

$states_wise = array_slice($obj["statewise"], 1, sizeof($obj["statewise"])-1, true);
$sql = "DELETE FROM states";
$result = $conn->query($sql);
foreach ($states_wise as $s) {
  $state = $s['state'];
  $confirmed = $s['confirmed'];
  $active = $s['active'];
  $recovered = $s['recovered'];
  $deaths = $s['deaths'];
  $iconfirmed = $s['deltaconfirmed'];
  $irecovered = $s['deltarecovered'];
  $ideaths = $s['deltadeaths'];
  $sql = "INSERT INTO states(state,confirmed,active,recovered,deaths,iconfirmed,irecovered,ideaths) VALUES ('$state',$confirmed,$active,$recovered,$deaths,$iconfirmed,$irecovered,$ideaths)";
  $result = $conn->query($sql);
}

//--------------------  Districts ---------------------//

$link1 = "https://api.covid19india.org/state_district_wise.json";
$response1 = file_get_contents($link1);
$obj1 = json_decode($response1,true);
$sql = "DELETE FROM districts";
$result = $conn->query($sql);
foreach ($obj1 as $key => $value) {
  $districts = $value['districtData'];
  foreach ($districts as $k => $v) {
    $val = $v['confirmed'];
    $inc = $v['delta']['confirmed'];
    $sql = "INSERT INTO districts(state,district,confirmed,increased) VALUES ('$key','$k',$val,$inc)";
    $result = $conn->query($sql);
    echo mysqli_error($conn);
  }
}

?>
