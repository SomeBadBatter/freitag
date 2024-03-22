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

$id_produkt = $_POST['id_model'];
$name = $_POST['produktname'];
$prozessor = $_POST['prozessor']; 
$ram = $_POST['ram'];
$speicher = $_POST['speicher']; 
$preis = $_POST['preis']; 

$sql = "UPDATE model SET `name` = '".$name."', prozessor = '".$prozessor."', ram = '".$ram."', speicher = ".$speicher.", preis = ".$preis." WHERE id_model = ".$id_produkt."";

if (mysqli_query($conn, $sql)) {
  echo "Updated successfully";
} else {
  echo "Error: " . $sql . "<br>" . mysqli_error($conn);
}

mysqli_close($conn);
?> 