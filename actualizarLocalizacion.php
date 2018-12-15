<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="./css/style.css" media="screen" />
<title>Proyecto BBDD de SAN</title>
</head>

<body>

 
<h1>MODIFICACION LOCALIZACION DE LA  <?php echo " ".$_GET['nif']; ?> </h1> 
 
<!-- <img src="./img/<?php echo $_GET['nif']?>.png" \> -->

<div id="info" class="container">
<form action="./modBBDDlocalizacion.php" method="post">
    <table>
        <tr> <th>NIF</th>     <td><input type="text" name="nif" value="<?php echo $_GET['nif']; ?>" /></td> </tr>
        <tr> <th>Puerto</th>     <td><input type="text" name="puerto" value="<?php echo $_GET['puerto'];?>" /></td> </tr>
        <tr> <th>Numero Local</th>     <td><input type="text" name="num_local" value="<?php echo $_GET['num_local']; ?>" /></td> </tr>
        <tr> <th>Localizacion</th>     <td><input type="text" name="localizacion" value="<?php echo $_GET['localizacion']; ?>" /></td> </tr>
        <tr> <th>Latitud</th>     <td><input type="text" name="latitud" value="<?php echo $_GET['latitud']; ?>" /></td> </tr>
        <tr> <th>Longitud</th>     <td><input type="text" name="longitud" value="<?php echo $_GET['longitud']; ?>" /></td> </tr>
    </table>
    <input type="submit" value="Modificar"/>
</form>


</div>
<p>volver <a href="./san.php"> atras </a> </p>
</body>
</html>