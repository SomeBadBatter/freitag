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

$id = $_POST['id_produkt'];

$a_erg = []; 
$a_erg['erg'] = 'OK';
$a_erg['detail'] = '';

$sql = "SELECT id_model
FROM model
where id_model = '".$id."' ";
$result = $conn->query($sql);

$model = $result->fetch_object();

if ($model) {
    $sql = "DELETE
            FROM model
            WHERE id_model = '".$model->id_model."'";

    if (!mysqli_query($conn, $sql)) {
        $a_erg['erg'] = 'NOK';
        $a_erg['detail'] = 'Fehler bei löschen des einer Verbindung';
    }

    if ($a_erg == 'OK') {
        $sql = "DELETE 
        FROM projekt 
        WHERE id_projekt = '".$model->id_projekt."'";
        
        if (mysqli_query($conn, $sql)) {
          $a_erg['detail'] = 'Produkt gelöscht';
        } else {
          $a_erg['detail'] = 'Fehler bei löschen des Produkts';
        }
    }

} else {
    $a_erg['erg'] = 'NOK'; 
    $a_erg['detail'] = 'Unbekanntes Produkt';
}


echo json_encode($a_erg);
mysqli_close($conn);
?> 