<?php

function connectToDB($server, $username, $password, $database) {
  $conn = mysqli_connect($server, $username, $password, $database);

  if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
  }

  return $conn;
}

function checkLogin($conn, $username, $password) {
  $sql = "SELECT * FROM administrator WHERE username='$username' AND password='$password'";
  $result = mysqli_query($conn, $sql);

  return mysqli_num_rows($result) > 0;
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $conn = connectToDB("localhost", "root", "", "clase");
  $username = $_POST["username"];
  $password = $_POST["password"];

  if (checkLogin($conn, $username, $password)) {
    session_start();
    $_SESSION["loggedin"] = true;
    echo "<script>location.assign('menu.html');</script>";
  }
  else {
	
	 echo '<script>alert("Parola sau user incorect! Incearca din nou!");</script>';
	 echo "<script>location.assign('index.html');</script>";
  }
}

?>