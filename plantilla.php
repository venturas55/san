<!DOCTYPE html>
<html land="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="./css/bootstrap.min.css" rel="stylesheet" />  
    <link href="./css/style.css" rel="stylesheet" type="text/css"/>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
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

             <!-- CABECERA -->
        <div data-spy="affix" data-offset-top="0">
            <nav class="navbar navbar-dark  bg-primary">
                      <div class="container-fluid">
                       <ul class="nav navbar-nav">
                            <li ><div class="itemMenu"><a target="_blank" href="https://www.valenciaport.com/"><img src="./img/images/logo-valenciaport-home.svg" /></a></div></li>        
                            <li ><div class="itemMenu"><h1>FICHA BALIZAMIENTO NIF: <?php echo " ".$_GET['nif'] ?></h1></div></li>
                            <li ><div class="itemMenu"><a href="./san.php" class="btn btn-success btn-sm btn-lg" >INICIO </a></div></li>
                            <li ><div class="itemMenu"><a target="_blank" href="http://www.puertos.es/es-es/aton/Documents/formulario2.pdf" class="btn btn-danger btn-sm btn-lg" >DAR DE BAJA</a></div></li>
                        </ul>
                        </div>
            </nav>
        </div>
    
                                <!-- CUERPO -->

   <div class="container" > <!-- id="cuerpo" --> 
            <!-- PRIMER DIV LA FOTO -->
    <div class="row">
        <div  class="col-sm-4 col-xs-12"> <!-- id="divfoto" -->
                     
            <div class="carousel slide" id="miCarrusel" data-ride="carousel">
                       <ol class="carousel-indicators">
                                  <?php
                                        $directory="img/".$nif;
                                        if(file_exists($directory))
                                        {
                                            $dirint = dir($directory);
                                            $cont=0;
                                            while (($archivo = $dirint->read()) !== false)
                                            {
                                                if ( $archivo!="." && $archivo!=".."){
                                                    if ($cont==0){
                                                        echo "<li data-target='miCarrusel' data-slide-to='".$cont."' class='active'></li>";
                                                        $cont++;}
                                                    else{
                                                        echo "<li data-target='miCarrusel' data-slide-to='".$cont."'></li>";
                                                        $cont++;}
                                                }


                                            }
                                            $dirint -> close();
                                        }
                                    ?>
                        </ol>
                   
                       <div class="carousel-inner">
                                <?php
                                        $cont=0;
                                        $directory="img/".$nif;
                                        if(file_exists($directory))
                                        {
                                                $dirint = dir($directory);
                                                while (($archivo = $dirint->read()) !== false)
                                                {
                                                    if ( $archivo!="." && $archivo!=".."){
                                                        if($cont==0){
                                                            echo "<div class='item active'>";
                                                            echo "<img src='./img/".$nif."/".$archivo."' >";
                                                            echo "<div class='carousel-caption'>" .$archivo."</div>";
                                                            echo "</div>";
                                                            $cont++;
                                                        }
                                                        else{
                                                            echo "<div class='item'>";
                                                            echo "<img src='./img/".$nif."/".$archivo."' >";
                                                            echo "<div class='carousel-caption'>" .$archivo."</div>";
                                                            echo "</div>";
                                                            $cont++;
                                                            }
                                                    }
                                                }
                                                $dirint -> close();
                                        }
                                        else{
                                            echo "<h1>No hay imagenes</h1>";
                                            echo "<h1>disponibles.</h1>";}
                                ?>
                        </div>

                            <a href="#miCarrusel" data-slide="prev" class="left carousel-control">   <span class="glyphicon glyphicon-chevron-left"></span>      </a>
                            <a href="#miCarrusel" data-slide="next" class="right carousel-control">    <span class="glyphicon glyphicon-chevron-right"></span>   </a>
                    </div>
                <form action="actualizarBBDDfoto.php" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="nif" value="<?php echo  $nif; ?>">
                    <input type="file" name="foto" >
                    <input type="submit" value="Subir foto" class="btn btn-primary btn-xs btn-block" />
                </form>

        </div>


                                <!-- SEGUNDO DIVS LA CARACTERISTICAS -->
        <div class="col-sm-4 col-xs-12">  <!-- id="divcaracteristicas" -->
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
                                                " class=\"btn btn-primary btn-xs btn-block\"\">ACTUALIZAR CARACTERISTICAS</a>";
                                             }
                                    }
                            ?>
        </div>
  
                            <!-- TERCER DIV LA LOCALIZACION -->
        <div class="col-sm-4 col-xs-12">      <!-- id="divlocalizacion" -->
            <h1> Localizacion </h1>
                    <table class="table table-striped"> 
                        <?php
                            $consultalocalizacion = "SELECT * FROM localizacion  where nif=$nif";
                            $localizacion = $db->query($consultalocalizacion);
                            if (!$localizacion) {
                                echo "<p>Error en la consulta.</p>\n";
                            } else {
                                foreach ($localizacion as $i) {
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
                                    " class=\"btn btn-primary btn-xs btn-block\"\">ACTUALIZAR LOCALIZACION </a>";
                                    }
                                }
                        ?>
        </div>
    </div>
    
    
    
    <div class="row">
                            <!-- CUARTO DIV OBSERVACIONES -->
        <div class="col-sm-12 col-xs-12"> <!-- id="divmantenimiento" -->
                <h1> Observaciones </h1>
            
                <table class="table table-striped"> 
                        <tr>
                            <th>Descripcion</th>
                            <th>Borrar</th>
                        </tr>
                        <?php
                                $consultaobservaciones = "SELECT * FROM observaciones  where nif=$nif";
                                $observaciones = $db->query($consultaobservaciones);
                                if (!$observaciones) {
                                    echo "<p>Error en la consulta.</p>\n";
                                } else {
                                    foreach ($observaciones as $i) {
                                        echo "<tr> <td>$i[observaciones]</td> <td> <a href=\"./borrarObservacion.php?nif=$i[nif]&observaciones=$i[observaciones]\" class=\"btn btn-primary btn-xs btn-block\"> borrar </a> </td>  </tr>\n";
                                }
                            }
                        #$db= NULL;
                        ?>
                        <form action="./modBBDDobservacion.php" method="post">
                            <input type="hidden" name="nif" value="<?php echo  $nif; ?>">
                        <tr><td><input type="text" name="observacion" /></td>  <td>  <input type="submit" value="añadir" class="btn btn-primary btn-xs btn-block"/></td></tr>
                        </form>
                </table> 
        </div>
    </div>
    
    
    
    
    

    <div class="row">
                            <!-- QUINTO DIV  MANTENIMIENTO -->
        <div class="col-sm-12 col-xs-12"> <!-- id="divmantenimiento" -->
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
                            <input type="submit" value="Eliminar" class="btn btn-danger btn-xs"/>
                        </form>
                </div>
        </div>

</div>





</body>
</html>