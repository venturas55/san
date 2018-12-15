
<?php
            echo '<pre>';
            $sistema=strtoupper(substr(PHP_OS, 0, 3));
            #En la consulta no se puede usar $_REQUEST , no funciona...
            $nif=$_REQUEST['nif'];
            
            # Si no existe la carpeta la creamos.
            $carpeta= "./img/".$nif;
            if(!file_exists($carpeta))
                    mkdir($carpeta,0777,TRUE);
            
    

            #PREPARAMOS LAS VARIABLES PARA LAS RUTAS...
            $foto=$_FILES['foto']['name'];
            $partes=explode(".",$foto);
            $nombrearchivo=$nif.".".$partes[1];
            
            echo "foto: ".$foto."\n";
            echo "extension: ".$partes[1]."\n";
            echo "nombrefichero: ".$nombrearchivo."\n";
            echo "files: ".$_FILES['foto']['tmp_name']."\n";


           # if($_FILES['foto']['tmp_name']!=""){

                            #SI YA EXISTE LA BORRAMOS (con cualquier extension...)
            ##        if(file_exists("./img/".$nif.".png")) {
              #          unlink("./img/".$nif.".png");
               #         echo "Archivo borrado";
                 #       }
            #        if(file_exists("./img/".$nif.".jpg")) {
             #           unlink("./img/".$nif.".jpg");
              #          echo "Archivo borrado";
               #         }
            #}



            #   HACEMOS EL INSERT DE LA FOTO (Parece que si que sobreescribe)
            
            if (move_uploaded_file($_FILES['foto']['tmp_name'], "./img/".$nif."/".$foto)) {
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