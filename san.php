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

                     <h1>Bienvenido a la BBDD de SAN. </h1>

                     <!-- CABECERA -->
        <div data-spy="affix" data-offset-top="40">
            <nav class="navbar navbar-dark bg-primary">
                      <div class="container-fluid">
                       <ul class="nav navbar-nav">
                            <li >  <!-- id="cabecera" -->
                                       <div class="itemMenu">
                                           <a href="https://www.valenciaport.com/">
                                                <img src="./img/apvlogo.jpg" />  <!-- style="height:75px;"-->
                                            </a>
                                        </div> 
                            </li>        
                            <li >     <div class="itemMenu">
                                        <h1>Listado Balizamiento Sagunto </h1>
                                        </div>       

                            </li>
                            <li >     <div class="itemMenu">
                                        <form action="./altaBalizamiento.php">
                                                <input type="submit" value="ALTA NUEVA" class="btn btn-success btn-sm"/> 
                                        </form>
                                    </div>
                            </li>
                        </ul>
                        </div>
            </nav>
        </div>
    <div class="container">   <!-- id="cuerpo" -->
                <!-- CUERPO -->
     <div class="row">    
        <div class="table-responsive">
            <table class="table" id="tabla"> 
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
        </div>
    </div>
    
    
    
    
    <div class="footer b_green">
			<div class="container">
			<div class="row">

				<!-- footer copyright -->
                <div class="col-md-6">
					<p>Autoridad Portuaria de Valencia © 2018 · Todos los derechos reservados</p>
                </div>

				<!-- footer menu -->
				<div class="footer-menu col-md-6">
                    <div class="menu-footermenu-container">
                           <ul id="menu-footermenu" class="menu">
                               <li id="menu-item-659" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-659"><a href="https://www.valenciaport.com/politica-de-privacidad/">Política de privacidad</a></li>
                                <li id="menu-item-660" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-660"><a href="https://www.valenciaport.com/nota-legal/">Nota legal</a></li>
                                <li id="menu-item-3803" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-3803"><a href="https://www.valenciaport.com/politica-de-cookies/">Política de cookies</a></li>
                            </ul>
                    </div>	
                </div>
			</div>
			</div>
		</div>
    

  


    
    
    
    
    
</div>

</body>
</html>