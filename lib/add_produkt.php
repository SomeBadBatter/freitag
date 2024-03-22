<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "freitag";

// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);
// Check connection
if (!$conn) {
  die("Connection failed: " . mysqli_connect_error());
}

$name = $_POST['produktname'];
$prozessor = $_POST['prozessor']; 
$ram = $_POST['ram'];
$speicher = $_POST['speicher']; 
$preis = $_POST['preis']; 

$sql = "INSERT INTO model (`name`, prozessor, ram, speicher, preis)
VALUES ('".$name."', '".$prozessor."', '".$ram."', '".$speicher."', '".$preis."')";

if (mysqli_query($conn, $sql)) {
  echo "New record created successfully";
} else {
  echo "Error: " . $sql . "<br>" . mysqli_error($conn);
}

mysqli_close($conn);
?> 