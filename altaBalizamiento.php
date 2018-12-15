<!DOCTYPE html>
<html>
<head>
    <meta charset="uft-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="./css/bootstrap.min.css" rel="stylesheet" />  
    <link rel="stylesheet" type="text/css" href="./css/style.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="./js/bootstrap.min.js"></script>
    <script src="./js/main.js" type='text/javascript'></script>
    <title>Proyecto BBDD de SAN</title>
</head>

<body>
<?php
        function conectaDb()
            {

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
 
<h1>ALTA DE NUEVO BALIZAMIENTO</h1>

<div id="info" class="container">
<form action="./altaNueva.php" method="post" enctype="multipart/form-data">
    <table>
        <tr> <th>NIF</th> <td><input type="text" name="nif"/></td> </tr>
        <tr> <th>Num.Internacional</th> <td><input type="text" name="num_internacional"/></td> </tr>
        <tr> <th>tipo</th> <td><select size="1" name="tipo"><option value="boya">Boya</option><option value="baliza">Baliza</option><option value="faro">Faro</option></select></td></tr>
        <tr> <th>Alcance</th> <td><input type="text" name="alcance"/></td> </tr>
        <tr> <th>Apariencia</th> <td><input type="text" name="apariencia"/></td> </tr>
        <tr> <th>Periodo</th> <td><input type="text" name="periodo"/></td> </tr>
        <tr> <th>Caracteristica</th> <td><input type="text" name="caracteristica"/></td> </tr>
    </table>
    <br>
    <table>
        <tr> <th>Puerto</th>     <td><input type="text" name="puerto"/></td> </tr>
        <tr> <th>Numero Local</th>     <td><input type="text" name="num_local"/></td> </tr>
        <tr> <th>Localizacion</th>     <td><input type="text" name="localizacion"/></td> </tr>
        <tr> <th>Latitud</th>     <td><input type="text" name="latitud"/></td> </tr>
        <tr> <th>Longitud</th>     <td><input type="text" name="longitud"/></td> </tr>
    </table>
    <table>
        <tr> <th>Insertar foto...</th>     <td><input name="foto" type="file" /></td> </tr>
    </table>
    <input type="submit" value="ENVIAR ALTA" class="btn btn-success btn-sm"/>
</form>





</div>





<p><a href="./san.php" class="btn btn-info btn-xs"> atras </a> </p>



</body>
</html>