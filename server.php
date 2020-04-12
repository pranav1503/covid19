<?php
include 'db.php';


$link = "https://api.covid19india.org/data.json";
$response = file_get_contents($link);
$obj = json_decode($response,true);
$past = $obj["cases_time_series"];

//--------------------  Total ---------------------//

$total = $obj["statewise"][0];
$confirmed = $total['confirmed'];
$recovered = $total['recovered'];
$deaths = $total['deaths'];
$active = $total['active'];
$iconfirmed = $total['deltaconfirmed'];
$irecovered = $total['deltarecovered'];
$ideaths = $total['deltadeaths'];
$dateupdate = date_format(date_create(str_replace('/','-', $total['lastupdatedtime'])),'Y-m-d H:i:s');
print_r($total);
echo "<br>".$confirmed."<br>".$recovered."<br>".$active."<br>".$deaths."<br>".$dateupdate."<br>";
$sql = "UPDATE total set total=$confirmed, active=$active, recovered=$recovered, deaths=$deaths, itotal=$iconfirmed, irecovered=$irecovered, ideaths=$ideaths, last_update='$dateupdate' where id=1";
$result = $conn->query($sql);
print_r(mysqli_error($conn));

//--------------------  State ---------------------//

$states_wise = array_slice($obj["statewise"], 1, sizeof($obj["statewise"])-1, true);
// print_r($states_wise);
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
  $dateupdate = date_format(date_create(str_replace('/','-', $s['lastupdatedtime'])),'Y-m-d H:i:s');
  // echo $dateupdate."<br>";
  $sql = "INSERT INTO states(state,confirmed,active,recovered,deaths,iconfirmed,irecovered,ideaths,last_update) VALUES ('$state',$confirmed,$active,$recovered,$deaths,$iconfirmed,$irecovered,$ideaths,'$dateupdate')";
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

//--------------------  PAST DATA ---------------------//

$sql = "DELETE from past_data";
$result = $conn->query($sql);
foreach ($past as $key => $value) {
  $confirmed = $value["totalconfirmed"];
  $recovered = $value["totalrecovered"];
  $deaths = $value["totalrecovered"];
  $iconfirmed = $value["dailyconfirmed"];
  $ideaths = $value["dailydeceased"];
  $irecovered = $value["dailyrecovered"];
  $date = date("Y-m-d",strtotime($value["date"]." ".date("Y")));
  $sql = "INSERT INTO past_data(confirmed,recovered,deaths,iconfirmed,irecovered,ideaths,date_cause) VALUES ($confirmed,$recovered,$deaths,$iconfirmed,$irecovered,$ideaths,'$date')";
  $result = $conn->query($sql);
}

?>
