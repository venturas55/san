<?php
error_reporting(E_ALL);
ini_set('display_errors','1');

function volver(){
    echo'<p> <a href="../index.php"> Volver</<></p>';
    echo "\n";
}

function recoge($campo){
    
    if (isset($_REQUEST[$campo])) {
        $valor = htmlspecialchars(trim(strip_tags($_REQUEST[$campo])));
    }else {
        $valor="";
    };
    return $valor;
}

function conectaDb()
{
//uso de las excepciones en php try y catch
try {
        $db = new PDO("mysql:host=localhost;dbname=san", "root", "administrador");
        $db->setAttribute(PDO::MYSQL_ATTR_USE_BUFFERED_QUERY, TRUE);
        return($db);
    } catch (PDOExcepton $e) {
        print "<p>Error: No puede conectarse con la base de datos.</p>\n";
        print "<p>Error: " . $e->getMessage() . "</p>\n";
        exit();
    }
}
?>