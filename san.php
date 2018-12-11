<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="./css/style.css" media="screen" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="./js/scripts.js" type='text/javascript'></script>
<title>Proyecto BBDD de SAN</title>
</head>
<body>
 

             <!-- CABECERA -->
<div id="cabecera">
            <img src="./img/apvlogo.jpg" />
            <h1>Bienvenido a la BBDD de SAN </h1>
</div>

            <!-- CUERPO -->
<div id="cuerpo">
    <table> 
            <tr>
                <th>NIF</th>
                <th>Numero Internacional</th>
                <th>Tipo</th>
                <th>Alcance</th>
                <th>Apariencia</th>
                <th>Periodo</th>
                <th>Caracteristica</th>
            </tr>
            <?php
            function conectaDb()
                {
                $usuario="root";
                $contrasena="administrador";
                //uso de las excepciones en php try y catch
                try {
                        $db = new PDO("mysql:host=localhost;dbname=san", $usuario, $contrasena);
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
                $consulta = "SELECT * FROM balizamiento order by nif";
                $result = $db->query($consulta);
                if (!$result) {
                    echo "<p>Error en la consulta.</p>\n";
                } else {
                    foreach ($result as $i) {
                        echo "<tr  class=\"seleccion\">  <td> $i[nif] </td> <td>$i[num_internacional]</td>  <td>$i[tipo]</td>    <td>$i[alcance]</td>  <td>$i[apariencia]</td> <td>$i[periodo]</td> <td>$i[caracteristica]</td>    </tr>\n";
                }
            }
            $db= null;
            ?>
    </table> 
    <br>

    <form action="./altaBalizamiento.php">
        <input type="submit" value="ALTA NUEVA" />
    </form>

</div>
</body>
</html>