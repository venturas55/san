<?php
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
    $puerto=$_REQUEST['puerto'];
    $num_local=$_REQUEST['num_local'];
    $nif= $_REQUEST['nif'];
    $localizacion=$_REQUEST['localizacion'] ;
    $longitud= $_REQUEST['longitud'];
    $latitud= $_REQUEST['latitud'];

    $db = conectaDb();
    $consulta = "UPDATE localizacion set puerto=\"$puerto\", num_local=$num_local,localizacion=\"$localizacion\",latitud=\"$latitud\",longitud=\"$longitud\" where nif=$nif";
    echo $consulta."<br>";


            #A LA CONSOLA!
            echo "<script type=\"text/javascript\"> console.log(".json_encode($consulta).")</script>";

    if ($db->query($consulta)) {
        echo "<script type=\"text/javascript\"> alert(\"Actualizacion exitosa\"); </script>";
    } else {
    echo "<script type=\"text/javascript\"> alert(\"Error al actualizar\"); </script>";
    }
    $db = NULL;
    header('location: ./san.php'); 
?>

