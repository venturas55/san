<?php
    header('location: ./san.php'); 
    
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
    #En la consulta no se puede usar $_REQUEST , no funciona...
    $nif=$_REQUEST['nif'];
    $fecha=$_REQUEST['fecha'];
    $mantenimiento=$_REQUEST['mantenimiento'];
  
    $db = conectaDb();
    $consulta = "insert into mantenimiento values($nif,'$fecha','$mantenimiento')";


        #se ejecuta la consulta
    if ($db->query($consulta)) {
        echo "<script type=\"text/javascript\"> alert(\"Mantenimiento añadido con exito\"); </script>";
    } else {
        echo "<script type=\"text/javascript\"> alert(\"Error al añadir operación\"); </script>";
    }
    $db = NULL; # se cierra la conexión.

        #A LA CONSOLA!
    echo "<script type=\"text/javascript\"> console.log(".json_encode($consulta).")</script>";
    
?>


<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="./css/style.css" media="screen" />
        <title>Proyecto BBDD de SAN</title>
    </head>
    <body>
    </body>
</html>
