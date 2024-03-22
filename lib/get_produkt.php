<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = 'freitag';

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$id = $_POST['id_model'];

$sql = "SELECT * 
FROM model
WHERE id_model = ".$id." ";

$result = $conn->query($sql);

$a_result = [];

while($row = $result->fetch_assoc()) {
    $a_result[] = $row;
  }
echo json_encode($a_result);

$conn->close();
?> 