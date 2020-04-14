<?php
  $servername = "localhost";
  $username = "u960245160_root";
  $password = "webdeveloper1510";
  $dbname = "u960245160_covid";

  $conn = new mysqli($servername, $username, $password, $dbname);
  if ($conn->connect_error) {
    echo("Connection failed: " . $conn->connect_error);
  }

?>
