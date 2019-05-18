<?php

//Esta funcion devuelve la variable con, es el resultado de intentar conectarse a la base de datos.
function conectar(){
        $con = mysqli_connect('localhost', 'root', '', 'casacult_casa_cultural'); 
        mysqli_set_charset($con,"utf8");
        return $con;
    }

?>