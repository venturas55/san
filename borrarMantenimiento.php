<?php
   #En la consulta no se puede usar $_REQUEST , no funciona...
    $nif=$_REQUEST['nif'];
    $fecha=$_REQUEST['fecha'];
    $mantenimiento=$_REQUEST['mantenimiento'];

    function conectaDb()
        {
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

    $db = conectaDb();

    $consulta = "delete from mantenimiento where nif=$nif AND fecha='$fecha' AND mantenimiento='$mantenimiento'";

         #A LA CONSOLA!
         echo "<script type=\"text/javascript\"> console.log(".json_encode($consulta).")</script>";
    
    if ($db->query($consulta)) {
        echo "<script type=\"text/javascript\"> alert(\"Mantenimiento Borrado con exito\"); </script>";
    } else {
        echo "<script type=\"text/javascript\"> alert(\"Error al intentar borrar la operacion de mantenimiento\"); </script>";
    }

    $db = NULL;
    #print_r($_REQUEST);
    echo "<script>window.history.go(-1);</script>";
    #header("location: href=./san.php");
?>

