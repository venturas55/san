<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
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
            $puerto=ucwords($_GET['puerto']);
        ?>

                     <h1>Bienvenido a la BBDD de SAN. </h1>

                     <!-- CABECERA -->
        <div data-spy="affix" data-offset-top="0">
            <nav class="navbar navbar-dark  bg-primary">
                <div class="container-fluid">
                    <ul class="nav navbar-nav">
                        <li ><div class="itemMenu"><a target="_blank" href="https://www.valenciaport.com/"><img src="./img/images/logo-valenciaport-home.svg" /></a></div></li>     
                        <li ><div class="itemMenu"><h1>Listado Balizamiento de <?php echo " ".$puerto ?></h1></div></li>
                        <li ><div class="itemMenu"><a href="./index.html" class="btn btn-success btn-sm btn-lg" >CAMBIAR DE PUERTO </a></div></li>
                        <li ><div class="itemMenu"><form action="./altaBalizamiento.php"><input type="submit" value="ALTA NUEVA" class="btn btn-success btn-sm"/></form></div></li>
                    </ul>
                </div>
            </nav>
        </div>                     
                 
                         
                     <!-- CUERPO -->
    <div class="container">   <!-- id="cuerpo" -->
     <div class="row">    
        <div class="table-responsive">
            <table class="table table-hover"> 
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
                    $consulta = "SELECT * FROM balizamiento b, localizacion l where b.nif=l.nif AND l.puerto like '%$puerto%' order by l.nif";
                    $result = $db->query($consulta);
                    if (!$result) {
                        echo "<p>Error en la consulta.</p>\n";
                    } else {
                        foreach ($result as $i) {
                            echo "<tr  class=\"seleccion\" style=\"background: red\">  <td> $i[nif] </td> <td>$i[num_internacional]</td>  <td>$i[tipo]</td>    <td>$i[alcance]</td>  <td>$i[apariencia]</td> <td>$i[periodo]</td> <td>$i[caracteristica]</td>    </tr>\n";
                    }
                }
                $db= null;
                ?>
            </table> 
        </div>
    </div>
    </div>
    
    
    
    <nav class="navbar navbar-light bg-primary footer">
			<div class="container">
			<div class="row">

				<!-- footer copyright -->
                <div class="col-md-6">
					<p>Autoridad Portuaria de Valencia © 2018 · Todos los derechos reservados</p>
                </div>

				<!-- footer menu -->
				
                    <div class="footer-menu col-md-6">
                        <div class="container-fluid">
                               <ul class="nav navbar-nav">
                                   <li class="itemFooter"><p><a target="_blank" href="https://www.valenciaport.com/politica-de-privacidad/">Política de privacidad</a></p></li>
                                    <li class="itemFooter"><p><a target="_blank" href="https://www.valenciaport.com/nota-legal/">Nota legal</a></p></li>
                                    <li class="itemFooter"><p><a target="_blank" href="https://www.valenciaport.com/politica-de-cookies/">Política de cookies</a></p></li>
                                </ul>
                        </div>	
                    </div>
			</div>
			</div>
    </nav>

  


    
    
    
    
    


</body>
</html>