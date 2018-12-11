<?php
   #En la consulta no se puede usar $_REQUEST , no funciona...
    $nif=$_REQUEST['nif'];

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
    

    $consulta = "delete from localizacion where nif=$nif";


            #A LA CONSOLA!
            echo "<script type=\"text/javascript\"> console.log(".json_encode($consulta).")</script>";
            #Se borra de la tabla localizacion
    if ($db->query($consulta)) {
        echo "<script type=\"text/javascript\"> alert(\"Borrado con exito de la tabla localizacion\"); </script>";
    } else {
        echo "<script type=\"text/javascript\"> alert(\"Error al intentar borrar en la tabla localizacion\"); </script>";
    }

    $consulta = "delete from balizamiento where nif=$nif";

            #A LA CONSOLA!
            echo "<script type=\"text/javascript\"> console.log(".json_encode($consulta).")</script>";
            #Se borra de la tabla balizamiento
    if ($db->query($consulta)) {
        echo "<script type=\"text/javascript\"> alert(\"Borrado con exito de la tabla balizamiento\"); </script>";
    } else {
        echo "<script type=\"text/javascript\"> alert(\"Error al intentar borrar en la tabla balizamiento\"); </script>";
    }

    $db = NULL;

    header("location: ./san.php");
?>
