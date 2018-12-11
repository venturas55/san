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
 
<h1>MODIFICACION CARACTERISTICAS DE LA  <?php echo " ".$_GET['tipo']." ".$_GET['nif']; ?> </h1>
   
<img src="./img/<?php echo $_GET['nif']?>.png" \>

<div id="info" class="container">
<form action="./modBBDDcaracteristicas.php" method="post">
    <table>
        <tr> <th>NIF</th>     <td><input type="text" name="nif" value="<?php echo $_GET['nif'] ?>" /></td> </tr>
        <tr> <th>Num.Internacional</th>     <td><input type="text" name="num_internacional" value="<?php echo $_GET['num_internacional']?>" /></td> </tr>
        <tr> <th>tipo</th> <td><select size="1" name="tipo"><option value="boya"    <?php if ($_GET['tipo']=="boya") echo "selected"; ?> >Boya</option>
                                                            <option value="baliza"  <?php if ($_GET['tipo']=="baliza") echo "selected"; ?>  >Baliza</option>
                                                            <option value="faro"    <?php if ($_GET['tipo']=="faro") echo "selected"; ?>  >Faro</option>
                            </select></td></tr>
        <tr> <th>Alcance</th>     <td><input type="text" name="alcance" value="<?php echo $_GET['alcance'] ?>" /></td> </tr>
        <tr> <th>Apariencia</th>     <td><input type="text" name="apariencia" value="<?php echo $_GET['apariencia'] ?>" /></td> </tr>
        <tr> <th>Periodo</th>     <td><input type="text" name="periodo" value="<?php echo $_GET['periodo'] ?>" /></td> </tr>
        <tr> <th>Caracteristica</th>     <td><input type="text" name="caracteristica" value="<?php echo $_GET['caracteristica'] ?>" /></td> </tr>
    </table>
    <input type="submit" value="Modificar"/>
</form>


</div>
<p>volver <a href="./san.php"> atras </a> </p>
</body>
</html>