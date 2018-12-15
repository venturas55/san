<html>
<head> </head>
<body>
<?php
   #En la consulta no se puede usar $_REQUEST , no funciona...
    $nif=$_REQUEST['nif'];
    $num_internacional=$_REQUEST['num_internacional'];
    $tipo=$_REQUEST['tipo'];
    $alcance=$_REQUEST['alcance'];
    $apariencia=$_REQUEST['apariencia'];
    $periodo=$_REQUEST['periodo'];
    $caracteristica=$_REQUEST['caracteristica'];
    $puerto=$_REQUEST['puerto'];
    $num_local=$_REQUEST['num_local'];
    $localizacion=$_REQUEST['localizacion'];
    $latitud=$_REQUEST['latitud'];
    $longitud=$_REQUEST['longitud'];
    $foto=$_FILES['foto']['name'];
    $partes=explode(".",$foto);
    $nombrearchivo=$nif.".".$partes[1];


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
#   HACEMOS EL INSERT EN LA TABLA BALIZAMIENTO
    $db = conectaDb();
    $consulta = "insert into balizamiento values($nif,'$num_internacional','$tipo',$alcance,'$apariencia',$periodo,'$caracteristica')";
    echo $consulta."<br>";

    if ($db->query($consulta)) {
        echo "<script type=\"text/javascript\"> alert(\"Caracteristicas del alta nueva realizada con exito\"); </script>";
    } else {
        echo "<script type=\"text/javascript\"> alert(\"Error al insertar las caracteristicas del nuevo Balizamiento\"); </script>";
    }
#   HACEMOS EL INSERT EN LA TABLA LOCALIZACION
    $consulta = "insert into localizacion values($nif,'$puerto',$num_local,'$localizacion','$latitud','$longitud')";
    echo $consulta."<br>";
    
    if ($db->query($consulta)) {
        echo "<script type=\"text/javascript\"> alert(\"Localizacion del alta nueva realizada con exito\"); </script>";
    } else {
        echo "<script type=\"text/javascript\"> alert(\"Error al insertar la localizacion del nuevo Balizamiento\"); </script>";
    }


    $db = NULL;


    #   HACEMOS EL INSERT DE LA FOTO
    
    # Si no existe la carpeta la creamos.
    $carpeta= "./img/".$nif;
    if(!file_exists($carpeta))
            mkdir($carpeta,0777,TRUE);
    
    $dir_subida = $carpeta."/";
    $rutacompleta = $dir_subida . $nombrearchivo;
    echo "ruta completa ".$rutacompleta;
    
    echo "<pre>";
    if (move_uploaded_file($_FILES['foto']['tmp_name'], $rutacompleta)) {
        echo "El fichero es válido y se subió con éxito.\n";
    } else {
        echo "¡Posible ataque de subida de ficheros!\n";
    }
    
    #echo 'Más información de depuración:';
    #print_r($_FILES);
    
    print "</pre>";



?>
<a href=./san.php>Volver</a>
</body>
</html>