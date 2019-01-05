<!DOCTYPE html>
<html land="es">
<head>
    <meta charset="uft-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="./css/bootstrap.min.css" rel="stylesheet" />  
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
<div class="container" > <!-- id="cuerpo" -->
             <!-- CABECERA -->
        <div class="row">
            <div class="col-sm-10 cabecera" >  <!-- id="cabecera" -->
                <img src="./img/apvlogo.jpg" />
                <h1>FICHA BALIZAMIENTO NIF: <?php echo " ".$_GET['nif'] ?> </h1>
            </div>
            <div class="col-sm-2" > 
                <a href="./san.php" class="btn btn-primary btn-lg btn-block" >INICIO </a>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12" >
                <div class="progress">
                    <div class="progress-bar progress-bar-warning progress-bar-stripped active" style="min-width:2em;width:90%">90%</div>
                    <div class="progress-bar progress-bar-info progress-bar-stripped" style="min-width:2em;width:10%">10%</div>
                </div>
            </div>
        </div>
   
    
            <!-- CUERPO -->

    
                            <!-- PRIMER DIV LA FOTO -->
    <div class="row">
        <div  class="col-sm-4"> <!-- id="divfoto" -->
                <?php
                if (file_exists("./img/".$nif.".png"))
                    echo "<img src=\"./img/" . $nif . ".png\"> ";
                else if (file_exists("./img/".$nif.".jpg"))
                    echo "<img src=\"./img/" . $nif . ".jpg\"> ";
                else    
                        echo "Imagen N/A";
                ?>

                <form action="actualizarBBDDfoto.php" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="nif" value="<?php echo  $nif; ?>">
                    <input type="file" name="foto" >
                    <input type="submit" value="Actualizar" class="btn btn-primary btn-lg btn-block" />
                </form>

        </div>


                                <!-- SEGUNDO DIVS LA CARACTERISTICAS -->
        <div class="col-sm-4">  <!-- id="divcaracteristicas" -->
            <h1> Caracteristicas </h1>
                        <table class="table table-striped"> 
                            <?php
                                        $consultabalizamiento = "SELECT * FROM balizamiento  where nif=$nif";
                                        $consultaobservaciones = "SELECT * FROM observaciones  where nif=$nif";

                                        $balizamiento = $db->query($consultabalizamiento);
                                        $observaciones = $db->query($consultaobservaciones);


                                        if (!$balizamiento || !$observaciones) {
                                            echo "<p>Error en la consulta.</p>\n";
                                        } else {

                                            foreach ($balizamiento as $i) {
                                                $tipo=$i[tipo];
                                                echo "<tr> <th>NIF</th>     <td>$i[nif]</td> </tr>";
                                                echo "<tr> <th>Num.Internacional</th>     <td>$i[num_internacional]</td> </tr>";
                                                echo "<tr> <th>tipo</th>     <td>$i[tipo]</td> </tr>";
                                                echo "<tr> <th>Alcance</th>     <td>$i[alcance]</td> </tr>";
                                                echo "<tr> <th>Apariencia</th>     <td>$i[apariencia]</td> </tr>";
                                                echo "<tr> <th>Periodo</th>     <td>$i[periodo]</td> </tr>";
                                                echo "<tr> <th>Caracteristica</th>     <td>$i[caracteristica]</td> </tr>";
                                                echo "</table>";
                                                echo "<a class=\"btn btn-primary btn-xs btn-block\" href=\"actualizarCaracteristicas.php?nif=".$i[nif].
                                                "&num_internacional=".$i[num_internacional].
                                                "&tipo=".$i[tipo].
                                                "&alcance=".$i[alcance].
                                                "&apariencia=".$i[apariencia].
                                                "&periodo=".$i[periodo].
                                                "&caracteristica=".$i[caracteristica].         
                                                " class=\"btn btn-primary btn-lg btn-block\"\">ACTUALIZAR CARACTERISTICAS</a>";
                                             }
                                    }
                            ?>
        </div>
  
                            <!-- TERCER DIV LA LOCALIZACION -->
        <div class="col-sm-4">      <!-- id="divlocalizacion" -->
            <h1> Localizacion </h1>
                    <table class="table table-striped"> 
                        <?php
                            $consultalocalizacion = "SELECT * FROM localizacion  where nif=$nif";
                            $localizacion = $db->query($consultalocalizacion);
                            if (!$localizacion) {
                                echo "<p>Error en la consulta.</p>\n";
                            } else {
                                foreach ($localizacion as $i) {
                                    echo "<tr> <th>NIF</th>     <td>$i[nif]</td> </tr>";
                                    echo "<tr> <th>Puerto</th>     <td>$i[puerto]</td> </tr>";
                                    echo "<tr> <th>Numero Local</th>     <td>$i[num_local]</td> </tr>";
                                    echo "<tr> <th>localizacion</th>     <td>$i[localizacion]</td> </tr>";
                                    echo "<tr> <th>latitud</th>     <td>$i[latitud]</td> </tr>";
                                    echo "<tr> <th>longitud</th>     <td>$i[longitud]</td> </tr>";
                                    echo "</table>";
                                    echo "<a class=\"btn btn-primary btn-xs btn-block\" href=\"actualizarLocalizacion.php?nif=".$i[nif].
                                    "&puerto=".$i[puerto].
                                    "&num_local=".$i[num_local].
                                    "&localizacion=".$i[localizacion].
                                    "&latitud=".$i[latitud].
                                    "&longitud=".$i[longitud].
                                    "&tipo=".$tipo.
                                    " class=\"btn btn-primary btn-lg btn-block\"\">ACTUALIZAR LOCALIZACION </a>";
                                    }
                                }
                        ?>
        </div>
    </div>

    <div class="row">
                            <!-- CUARTO DIV EL MANTENIMIENTO -->
        <div class="col-sm-12"> <!-- id="divmantenimiento" -->
                <h1> Mantenimiento </h1>
            
                <table class="table table-striped"> 
                        <tr>

                            <th>Fecha</th>
                            <th>Descripcion</th>
                            <th>Borrar</th>
                        </tr>
                        <?php
                                $consultamantenimiento = "SELECT * FROM mantenimiento  where nif=$nif order by fecha DESC";
                                $mantenimiento = $db->query($consultamantenimiento);
                                if (!$mantenimiento) {
                                    echo "<p>Error en la consulta.</p>\n";
                                } else {
                                    foreach ($mantenimiento as $i) {
                                        echo "<tr> <td>$i[fecha]</td> <td>$i[mantenimiento]</td> <td> <a href=\"./borrarMantenimiento.php?nif=$i[nif]&fecha=$i[fecha]&mantenimiento=$i[mantenimiento]\" class=\"btn btn-primary btn-xs btn-block\"> borrar </a> </td>  </tr>\n";
                                }
                            }
                        #$db= NULL;
                        ?>
                        <form action="./modBBDDmantenimiento.php" method="post">
                            <input type="hidden" name="nif" value="<?php echo  $nif; ?>">
                        <tr><td><input type="date" name="fecha" /></td> <td><input type="text" name="mantenimiento" /></td>  <td>  <input type="submit" value="añadir" class="btn btn-primary btn-xs btn-block"/></td></tr>
                        </form>
                </table> 


                    <!-- <a href="./actualizarMantenimiento.php?nif= <?php echo $nif ?> "  class="boton1">AÑADIR MANTENIMIENTO </a> -->


        </div>
    </div>

        <div class="row">
                <div id="divmenubotones">
                        <form action="./borrarBalizamiento.php" method="post">
                            <input type="hidden" name="nif" value="<?php echo $nif; ?>">
                            <input type="submit" value="Eliminar" class="btn btn-primary btn-lg btn-block"/>
                        </form>
                </div>
        </div>

</div>





</body>
</html>