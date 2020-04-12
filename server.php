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
  $deaths = $value["totaldeceased"];
  $iconfirmed = $value["dailyconfirmed"];
  $ideaths = $value["dailydeceased"];
  $irecovered = $value["dailyrecovered"];
  $date = date("Y-m-d",strtotime($value["date"]." ".date("Y")));
  $sql = "INSERT INTO past_data(confirmed,recovered,deaths,iconfirmed,irecovered,ideaths,date_cause) VALUES ($confirmed,$recovered,$deaths,$iconfirmed,$irecovered,$ideaths,'$date')";
  $result = $conn->query($sql);
}

//--------------------  GENDER AGE NATIONALITY ---------------------//

$link = "https://api.covid19india.org/raw_data.json";
$response = file_get_contents($link);
$obj = json_decode($response,true);
$male = 0;
$female = 0;
$gender_awaiting = 0;
$keys = array('0-10','10-20','20-30','30-40','40-50','50-60','60-70','70-80','80-90','90-100','100+','awaiting');
$a = array_fill_keys($keys, 0);
$nationality =  array();
foreach ($obj["raw_data"] as $key => $value) {
  $gender = $value["gender"];
  if($gender == "F"){
    $female += 1;
  }elseif($gender == "M"){
    $male += 1;
  }else {
    $gender_awaiting += 1;
  }

  $age = $value["agebracket"];
  if($age>0 && $age<=10){
    $a['0-10'] += 1;
  }elseif ($age>10 && $age<=20) {
    $a['10-20'] += 1;
  }elseif ($age>20 && $age<=30) {
    $a['20-30'] += 1;
  }
  elseif ($age>30 && $age<=40) {
    $a['30-40'] += 1;
  }elseif ($age>40 && $age<=50) {
    $a['40-50'] += 1;
  }elseif ($age>50 && $age<=60) {
    $a['50-60'] += 1;
  }elseif ($age>60 && $age<=70) {
    $a['60-70'] += 1;
  }
  elseif ($age>70 && $age<=80) {
    $a['70-80'] += 1;
  }elseif ($age>80 && $age<=90) {
    $a['80-90'] += 1;
  }
  elseif ($age>90 && $age<=100) {
    $a['90-100'] += 1;
  }elseif($age>100) {
    $a['100+'] += 1;
  }else{
    $a['awaiting'] += 1;
  }

  $nation = $value["nationality"];
  $nationality['awaiting'] = 0;
  if ($nation != "") {
    if (array_key_exists($nation,$nationality)) {
      $nationality[$nation] += 1;
    }else {
      $nationality[$nation] = 1;
    }
  }else {
    $nationality["awaiting"] += 1;
  }

}

$sql = "DELETE FROM gender";
$response = $conn->query($sql);
$sql = "INSERT INTO gender(male,female,awaiting) VALUES ($male,$female,$gender_awaiting)";
$response = $conn->query($sql);
$sql = "DELETE FROM age";
$response = $conn->query($sql);
foreach ($a as $key => $value) {
  $sql = "INSERT INTO age(age_range,counts) VALUES ('$key',$value)";
  $response = $conn->query($sql);
}
$sql = "DELETE FROM nationality_count";
$response = $conn->query($sql);
foreach ($nationality as $key => $value) {
  $sql = "INSERT INTO nationality_count(nationality,count) VALUES ('$key',$value)";
  $response = $conn->query($sql);
}


?>
