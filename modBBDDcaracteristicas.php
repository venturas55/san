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
    $nif=$_REQUEST['nif'];
    $num_internacional=$_REQUEST['num_internacional'];
    $tipo=$_REQUEST['tipo'];
    $alcance=$_REQUEST['alcance'];
    $apariencia=$_REQUEST['apariencia'];
    $periodo=$_REQUEST['periodo'];
    $caracteristica=$_REQUEST['caracteristica'];
    $db = conectaDb();
    $consulta = "UPDATE balizamiento set num_internacional=\"$num_internacional\", tipo=\"$tipo\",alcance=$alcance,apariencia=\"$apariencia\",periodo=$periodo,caracteristica=\"$caracteristica\" where nif=$nif";
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

