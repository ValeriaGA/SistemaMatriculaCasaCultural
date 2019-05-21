<?php

 

//Esta funcion devuelve la variable con, es el resultado de intentar conectarse a la base de datos.
function conectar(){
        $servername = 'localhost';
        $username = 'root';
        $password = 'root';
        $databasename = 'casacult_casa_cultural';
            
        $con = mysqli_connect($servername,$username, $password, $databasename); 
        mysqli_set_charset($con,"utf8");
        return $con;
    }

?>