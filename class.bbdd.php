<?php
class Conexion{
        public function get_conexion(){
            $user = "root";
            $pass ="administrador";
            $host = "localhost";
            $db="san";
            $conexion = new PDO("mysql:host=$host;dbname=$db;",$user,$pass);
            return $conexion;
        }
}
?>