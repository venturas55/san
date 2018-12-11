
<?php
   #En la consulta no se puede usar $_REQUEST , no funciona...
   $nif=$_REQUEST['nif'];

    #PREPARAMOS LAS VARIABLES PARA LAS RUTAS...
    $foto=$_FILES['foto']['name'];
    $partes=explode(".",$foto);
    $nombrearchivo=$nif.".".$partes[1];
     

    if($_FILES['foto']['tmp_name']!=""){

                    #SI YA EXISTE LA BORRAMOS (con cualquier extension...)
            if(file_exists("./img/".$nif.".png")) {
                unlink("./img/".$nif.".png");
                echo "Archivo borrado";
                }
            if(file_exists("./img/".$nif.".jpg")) {
                unlink("./img/".$nif.".jpg");
                echo "Archivo borrado";
                }
    }
    
    
    
    #   HACEMOS EL INSERT DE LA FOTO (Parece que si que sobreescribe)
    echo '<pre>';
    if (move_uploaded_file($_FILES['foto']['tmp_name'], "./img/".$nombrearchivo)) {
        echo "El fichero es válido y se subió con éxito.\n";
    } else {
        echo "¡Posible ataque de subida de ficheros!\n";
    }
    
    #echo 'Más información de depuración:';
    #print_r($_FILES);
    #print "</pre>";

?>
<html>
<head> </head>
<body>

<p>volver <a href="./san.php"> atras </a> </p>
</body>
</html>