<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="./css/style.css" media="screen" />
<title>Proyecto BBDD de SAN</title>
</head>

<body>
    <?php
            $nif=$_GET['nif'];
            include_once("funciones.php");
            $usuario="root";
            $contrasena="administrador";
            $db = conectaDb($usuario,$contrasena);
    ?>

    <!-- CABECERA -->
        <div id="cabecera">
                <img src="./img/apvlogo.jpg" />
                <h1>MODIFICACION CARACTERISTICAS DEL BALIZAMIENTO NIF:<?php echo " ".$_GET['nif']; ?>  </h1>
                <a href="./san.php" class="boton1">INICIO</a>
        </div>
 
             <!-- CUERPO -->
        <div id="cuerpo">  
        <!-- <img src="./img/<?php echo $_GET['nif']?>.png" \> -->

                <div id="info" class="container">
                        <form action="./modBBDDcaracteristicas.php" method="post">
                            <input type="hidden" name="nif" value="<?php echo $nif;?>">
                            <table>
                                <!--<tr> <th>NIF</th>     <td><input type="text" name="nif" value="<?php echo $_GET['nif'] ?>" /></td> </tr> -->
                                <tr> <th>Num.Internacional</th>     <td><input type="text" name="num_internacional" value="<?php echo $_GET['num_internacional']?>" /></td> </tr>
                                <tr> <th>tipo</th> <td><select size="1" name="tipo"><option value="boya"    <?php if ($_GET['tipo']=="boya") echo "selected"; ?> >Boya</option>    <!--falta pasar TIPO como parametro!! -->
                                                                                    <option value="baliza"  <?php if ($_GET['tipo']=="baliza") echo "selected"; ?>  >Baliza</option>
                                                                                    <option value="faro"    <?php if ($_GET['tipo']=="faro") echo "selected"; ?>  >Faro</option>
                                                    </select></td></tr>
                                <tr> <th>Alcance</th><td><input type="text" name="alcance" value="<?php echo $_GET['alcance'] ?>" /></td></tr>
                                <tr> <th>Apariencia</th>     <td><input type="text" name="apariencia" value="<?php echo $_GET['apariencia'] ?>" /></td> </tr>
                                <tr> <th>Periodo</th>     <td><input type="text" name="periodo" value="<?php echo $_GET['periodo'] ?>" /></td> </tr>
                                <tr> <th>Caracteristica</th>     <td><input type="text" name="caracteristica" value="<?php echo $_GET['caracteristica'] ?>" /></td> </tr>
                            </table>
                            <input type="submit" value="Modificar"/>
                        </form>
                </div>
        </div>
</body>
</html>