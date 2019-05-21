<?php 
echo "Hola<br>";
$servername = 'casaculturalamon.com';
$username = 'casacult_admin';
$password = 'ABCDEFG12345';
$databasename = 'casacult_casa_cultural';

$con = mysqli_connect($servername,$username, $password, $databasename); 



if (!$con) {
    die("Connection failed: " . mysqli_connect_error());
}
echo "Connected successfully";
mysqli_set_charset($con,"utf8");
return $con;


?>