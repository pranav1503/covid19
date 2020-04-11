<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
    <!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"> -->
    <style>
* {
  box-sizing: border-box;
}

body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

/* The grid: Three equal mycolumns that floats next to each other */
.myrow{
  background-color: #383737;
  padding: 5px 0 5px 0;
  border-bottom: 1px solid white;
}

.myrow:nth-child(1){
  background-color: #141414;
}

.disrow{
  background-color: #383737;
  width: 40%;
  padding: 2px 0 2px 0;
  border-bottom: 1px solid white;
}

@media only screen and (max-width:1200px) {
  .disrow{
    width: 100%;
  }
}

.discolumn{
  float: left;
  padding: 5px;
  /* text-align: center; */
  font-size: 15px;
  cursor: pointer;
  color: white;
}
.discolumn:nth-child(1){
  width: 60%;
}
.discolumn:nth-child(2){
  width: 40%;
}

.mycolumn {
  float: left;
  width: 17%;
  padding: 5px;
  /* text-align: center; */
  font-size: 15px;
  cursor: pointer;
  color: white;
  line-height: 16px;
}

.mycolumn:nth-child(1) {
  width: 32%;
}
.mycolumn:nth-child(2) {
  width: 20%;
}
.mycolumn:nth-child(3) {
  width: 14%;
}

/* .myrow:nth-child(1) .mycolumn{
  font-size: 20px;
} */

.containerTab {
  padding: 20px;
  color: white;
}

/* Clear floats after the mycolumns */
.myrow:after {
  content: "";
  display: table;
  clear: both;
}
.disrow:after {
  content: "";
  display: table;
  clear: both;
}

/* Closable button inside the container tab */

</style>
  </head>
  <body>

<div class="" style="overflow-x:scroll;">
  <div class="myrow">
    <div class="mycolumn">
      State
    </div>
    <div class="mycolumn">
      CNFMD
    </div>
    <div class="mycolumn">
      ACTV
    </div>
    <div class="mycolumn">
      RCVRD
    </div>
    <div class="mycolumn">
      DCSD
    </div>
  </div>

  <?php
    include 'db.php';
    $sql = "SELECT * from states";
    $result = $conn->query($sql);
          if ($result->num_rows > 0) {
              // output data of each row
              while($row = $result->fetch_assoc()) {
                  $state = $row['state'];
                  $confirmed = $row['confirmed'];
                  $active = $row['active'];
                  $recovered = $row['recovered'];
                  $deaths = $row['deaths'];
   ?>

  <div class="myrow"  onclick="openTab('<?php echo str_replace(' ', '', $state); ?>');">
    <div class="mycolumn">
      <?php echo $state; ?>
    </div>
    <div class="mycolumn" >
      <?php echo $confirmed; ?>
    </div>
    <div class="mycolumn" >
      <?php echo $active; ?>
    </div>
    <div class="mycolumn" >
      <?php echo $recovered; ?>
    </div>
    <div class="mycolumn" >
      <?php echo $deaths; ?>
    </div>
  </div>

  <div id="<?php echo str_replace(' ', '', $state); ?>" class="containerTab" style="display:none;">
    <div class="disrow">
      <div class="discolumn">
        District
      </div>
      <div class="discolumn">
        CONFIRMED
      </div>
    </div>
    <div class="disrow">
      <div class="discolumn">
        dis1
      </div>
      <div class="discolumn">
        1000
      </div>
    </div>
  </div>

  <?php
      }
    }
   ?>
</div>
<script>
function openTab(tabName) {
  if(document.getElementById(tabName).style.display !== "block"){
  	var i, x;
    x = document.getElementsByClassName("containerTab");
    for (i = 0; i < x.length; i++) {
      x[i].style.display = "none";
    }
    document.getElementById(tabName).style.display = "block";
  }else{
  	var i, x;
    x = document.getElementsByClassName("containerTab");
    for (i = 0; i < x.length; i++) {
      x[i].style.display = "none";
    }
  }


}
</script>

  </body>
  <!-- <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script> -->

</html>
