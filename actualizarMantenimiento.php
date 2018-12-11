<!-- obsoleta pagina -->
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="./css/style.css" media="screen" />
<title>Proyecto BBDD de SAN</title>
</head>

<body>
<?php
        $nif=$_GET['nif'];
        function conectaDb()
            {
            $usuario="root";
            $contrasena="administrador";
            //uso de las excepciones en php try y catch
            try {
                    $db = new PDO("mysql:host=localhost;dbname=san", "root", "administrador");
                    $db->setAttribute(PDO::MYSQL_ATTR_USE_BUFFERED_QUERY, TRUE);
                    return($db);
                } catch (PDOExcepton $e) {
                    //cabecera("Error grave");
                    print "<p>Error: No puede conectarse con la base de datos.</p>\n";
                    //
                    print "<p>Error: " . $e->getMessage() . "</p>\n";
                    //pie();
                    exit();
                }
            }

            $db = conectaDb();
?>
 
<h1>NUEVA OPERACION DE MANTENIMIENTO A INSERTAR EN LA AYUDA A LA NAVEGACION CON NIF <?php echo " ".$nif; ?> </h1>
  
<?php 
if (file_exists("./img/".$nif.".png"))
        echo "<img src=\"./img/" . $nif . ".png\"> ";
    else if (file_exists("./img/".$nif.".jpg"))
        echo "<img src=\"./img/" . $nif . ".jpg\"> ";
    else    
            echo "Imagen N/A";
?>


<div id="info" class="container">
<form action="./modBBDDmantenimiento.php" method="post">
    <input type="hidden" name="nif" value="<?php echo  $nif; ?>">
    <table>
        <tr> <th>FECHA</th>     <td><input type="date" name="fecha" /></td> </tr>
        <tr> <th>OPERACION</th>     <td><input type="text" name="mantenimiento" /></td> </tr>
    </table>
    <input type="submit" value="añadir"/>
</form>


</div>
<p>volver <a href="./san.php"> atras </a> </p>
</body>
</html>