#SHOW FULL TABLES FROM san;
drop table localizacion;
drop table mantenimiento;
drop table observaciones;
drop table lampara;
drop table usuarios;
drop table balizamiento;


CREATE TABLE balizamiento (
    nif VARCHAR(8) NOT NULL,
    num_internacional varchar(12),
    tipo varchar(250),
    telecontrol varchar(200),
    apariencia varchar(50),
    periodo numeric(5,2) ,
    caracteristica varchar(50) NOT NULL,
    
  PRIMARY KEY (nif)
) engine=innodb DEFAULT CHARSET=latin1 COMMENT='tabla de balizas';


CREATE TABLE localizacion(
    nif VARCHAR(8) NOT NULL,
    puerto VARCHAR(50),
    num_local numeric(5,0),
    localizacion VARCHAR(70),
    latitud VARCHAR(15),
    longitud VARCHAR(15),
    PRIMARY KEY (nif),
    CONSTRAINT localizacion_FK FOREIGN KEY (nif) REFERENCES balizamiento (nif)
) engine=innodb DEFAULT CHARSET=latin1 COMMENT='tabla de localizacion del balizamiento';


CREATE TABLE mantenimiento(
    nif VARCHAR(8) NOT NULL,
    fecha date,
    mantenimiento varchar(250),
    PRIMARY KEY (nif,fecha,mantenimiento),
    CONSTRAINT mantenimiento_FK FOREIGN KEY (nif) REFERENCES balizamiento (nif)
)engine=innodb DEFAULT CHARSET=latin1 COMMENT='tabla de mantenimiento del balizamiento';


CREATE TABLE observaciones(
    nif VARCHAR(8) NOT NULL,
    observaciones varchar(250) NOT NULL,
    PRIMARY KEY (nif,observaciones),
    CONSTRAINT observaciones_FK FOREIGN KEY (nif) REFERENCES balizamiento (nif)
)engine=innodb DEFAULT CHARSET=latin1 COMMENT='tabla de observaciones del balizamiento';

CREATE TABLE lampara(
    nif VARCHAR(8) NOT NULL,
    altura INTEGER,
    elevación INTEGER,
    alcance INTEGER,
    linterna varchar(200),
    PRIMARY KEY (nif),
    CONSTRAINT lampara_FK FOREIGN KEY (nif) REFERENCES balizamiento (nif)
)engine=innodb DEFAULT CHARSET=latin1 COMMENT='tabla de detalles lampara';

CREATE TABLE usuarios (
    usuario VARCHAR(10) NOT NULL,
    contrasena varchar(15) NOT NULL,
    PRIMARY KEY (usuario)
) engine=innodb DEFAULT CHARSET=latin1 COMMENT='tabla de usuarios';




#VALENCIA DE LA EXCEL
INSERT INTO balizamiento VALUES ('25720','E-0200.4','Baliza Cilíndrica verde base blanca','RTU 06','DV',5,'L1 oc4');
INSERT INTO localizacion VALUES ('25720','Puerto de Valencia.',1,'Extremo dique del Este',"39º 26.028´N","000º18.171´ W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES ("25720",STR_TO_DATE("16/09/04","%d/%m/%y"),"Se instala tele-control de la baliza y dos lite-pipe."),("25720",STR_TO_DATE("29/01/07","%d/%m/%y"),"Avería de la fuente de alimentación montada por ANFER."),("25720",STR_TO_DATE("04/12/07","%d/%m/%y"),"reparar avería en lite-pipe."),("25720",STR_TO_DATE("15/01/08","%d/%m/%y"),"Sustituir y repara fuente de alimentación 220/12v."),("25720",STR_TO_DATE("14/04/08","%d/%m/%y"),"Se pinta baliza Verde-blanco."),("25720",STR_TO_DATE("24/03/10","%d/%m/%y"),"Se sincroniza con la verde del martillo 25.721"),("25720",STR_TO_DATE("04/05/11","%d/%m/%y"),"Sustituir fuente de alimentación por avería."),("25720",STR_TO_DATE("17/01/12","%d/%m/%y"),"Fallo de la linterna por tormenta, cambio de fuente de alimentación."),("25720",STR_TO_DATE("08/11/13","%d/%m/%y"),"Instalación de dos puntos de luz."),("25720",STR_TO_DATE("21/11/14","%d/%m/%y"),"Se sincronizan los lite-pipes con la linterna principal."),("25720",STR_TO_DATE("31/03/15","%d/%m/%y"),"Se repinta la baliza."),("25720",STR_TO_DATE("01/04/15","%d/%m/%y"),"Se repara la escotilla hidráulica de acceso a la cofa (taller mécanico)."),("25720",STR_TO_DATE("23/10/18","%d/%m/%y"),"Se repinta la torre."),("25720",STR_TO_DATE("20/11/18","%d/%m/%y"),"Se sustituye la batería de la linterna principal por avería (cortocircuitada).");


INSERT INTO balizamiento VALUES ('25740','','Boya Castillete roja y marca de tope','No lo necesita','D R',5,'L0.5 oc4.5');
INSERT INTO localizacion VALUES ('25740','Puerto de Valencia.',2,'Canal de entrada Br.',"39º 25.582´N","000º 18.187´ W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES ("25740",STR_TO_DATE("16/04/04","%d/%m/%y"),"Se instala el tele-control y se sustituye la linterna de Balizamar por una BDL 120 de ocho coronas."),("25740",STR_TO_DATE("12/05/06","%d/%m/%y"),"Siniestro de la boya por temporal se recupera en la playa de Pinedo y se fondea una sustituta con las mismas características en su lugar el día 21/06/06."),("25740",STR_TO_DATE("12/06/07","%d/%m/%y"),"Se sustituye la linterna."),("25740",STR_TO_DATE("23/09/08","%d/%m/%y"),"Sustituir tres baterías por avería, dañadas por temporal."),("25740",STR_TO_DATE("10/12/08","%d/%m/%y"),"Sustituir linterna por condensación."),("25740",STR_TO_DATE("05/10/09","%d/%m/%y"),"Sustituir PLC por avería."),("25740",STR_TO_DATE("14/12/09","%d/%m/%y"),"Sustituir boya por mantenimiento. Instalación del telecontrol en boya sustituta."),("25740",STR_TO_DATE("15/01/10","%d/%m/%y"),"Sustituir la marca de tope."),("25740",STR_TO_DATE("28/01/10","%d/%m/%y"),"Emplazar Moscad, que se había soltado y daba fallos."),("25740",STR_TO_DATE("08/04/11","%d/%m/%y"),"Sustituir boya por mantenimiento."),("25740",STR_TO_DATE("14/03/12","%d/%m/%y"),"Repara fallo periódico de comunicaciones con GPS. ANFER."),("25740",STR_TO_DATE("08/07/13","%d/%m/%y"),"Sustituir baterías del año 2005."),("25740",STR_TO_DATE("24/10/16","%d/%m/%y"),"Se saca a tierra por mantenimiento (batería baja)"),("25740",STR_TO_DATE("13/12/16","%d/%m/%y"),"Se fondea de nuevo la boya y se retira la provisional."),("25740",STR_TO_DATE("08/03/17","%d/%m/%y"),"Volvemos a sacar la boya para reparar los paneles solares (temporal)"),("25740",STR_TO_DATE("18/05/17","%d/%m/%y"),"Se fondea de nuevo una vez reparada y se retira la provisional.");


INSERT INTO balizamiento VALUES ('25721','E-0200.5','Baliza TPS 3.3','','D V',5,'L1 oc4');
INSERT INTO localizacion VALUES ('25721','Puerto de Valencia.',3,'Martillo dique del Este',"39° 26.139' N","00° 18.349' W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES ("25721",STR_TO_DATE("27/09/07","%d/%m/%y"),"Se instala baliza con una linterna nuestra (APV) porque Enrique no tenía."),("25721",STR_TO_DATE("04/04/08","%d/%m/%y"),"Se instala la nueva linterna."),("25721",STR_TO_DATE("24/03/10","%d/%m/%y"),"Se sincroniza con la 25.720"),("25721",STR_TO_DATE("22/09/10","%d/%m/%y"),"Se descarga la batería por fallo de red 230v"),("25721",STR_TO_DATE("08/11/13","%d/%m/%y"),"Sustitución del cuadro de acometida e instalación de punto de luz."),("25721",STR_TO_DATE("01/04/15","%d/%m/%y")," Se repinta la torre de la baliza dejando el tercio inferior de blanco."),("25721",STR_TO_DATE("27/09/16","%d/%m/%y")," Sustitución de la LDR nº 2 por avería."),("25721",STR_TO_DATE("16/10/18","%d/%m/%y"),"Se repinta la torre.");


INSERT INTO balizamiento VALUES ('25774','E-0201.11','Baliza Cilíndrica roja, base blanca','RTU 10','GpD (2)R',7,'L0.5 oc 1.5 L0.5 oc 4.5');
INSERT INTO localizacion VALUES ('25774','Puerto de Valencia.',4,'Contra dique, ángulo Este',"39º 25.840´N","00º18.561´ W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES ("25774",STR_TO_DATE("15/01/07","%d/%m/%y"),"El taller repara la puerta de acceso a la torre."),("25774",STR_TO_DATE("14/10/07","%d/%m/%y"),"Avería por fallo de red220v."),("25774",STR_TO_DATE("21/02/08","%d/%m/%y"),"Pintado de la torre Rojo-blanco."),("25774",STR_TO_DATE("15/02/09","%d/%m/%y"),"Instalación de una baliza lineal MLP 3000 (Mesemar)."),("25774",STR_TO_DATE("15/09/10","%d/%m/%y"),"Se incorpora al tele-control la baliza lineal."),("25774",STR_TO_DATE("22/11/12","%d/%m/%y"),"Se monta panel para crear un sector de oscuridad  270º  a  325º (55º)"),("25774",STR_TO_DATE("05/11/13","%d/%m/%y"),"Se reinstala el cuadro de acometida y se añade punto de luz"),("25774",STR_TO_DATE("16/01/14","%d/%m/%y"),"Se repara linterna vertical (MSM) sustituye el destellador y lo saca fuera."),("25774",STR_TO_DATE("24/11/14","%d/%m/%y")," Se sincroniza el lite-pipe con la linterna principal."),("25774",STR_TO_DATE("17/01/14","%d/%m/%y"),"Se repara y se repinta la torre por Dragados"),("25774",STR_TO_DATE("23/09/15","%d/%m/%y"),"Se sustituyen ambas LDR."),("25774",STR_TO_DATE("13/12/17","%d/%m/%y"),"Repintado de la torre manteniendo la base blanca.");


INSERT INTO balizamiento VALUES ('25761','','Boya Castillete amarilla y marca de tope','RTU 04','GpD (4) A',11,'[(L 0.5 oc 1.5) x3] L 0.5 oc 4.5');
INSERT INTO localizacion VALUES ('25761','Puerto de Valencia.',5,'Canal, ángulo Este del contradique.',"39º 25.898´N","000º 18.465´ W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES ("25761",STR_TO_DATE("16/04/04","%d/%m/%y"),"Se instala tele-control y se sustituye linterna de Balizamar  por BDL 120 de ocho coronas."),("25761",STR_TO_DATE("21/11/08","%d/%m/%y"),"Se sustituye la boya por una provisional por labores de mantenimiento."),("25761",STR_TO_DATE("05/10/12","%d/%m/%y"),"Se sustituye la boya por que se detecta en la revisión periódica que no tiene paneles solares, se da de baja."),("25761",STR_TO_DATE("15/02/13","%d/%m/%y"),"Una vez reparada se repone de nuevo y se retira la provisional (baterías nuevas y paneles nuevos)"),("25761",STR_TO_DATE("12/03/13","%d/%m/%y"),"Se sincroniza con la boya 25765. (ANFER)"),("25761",STR_TO_DATE("06/05/14","%d/%m/%y"),"Sustituida foto-célula por avería."),("25761",STR_TO_DATE("05/08/14","%d/%m/%y"),"Fallo de sincronia con la 25765. Se repara reseteando la RTU."),("25761",STR_TO_DATE("07/09/14","%d/%m/%y"),"Falla una fotocélula dejando encendida la boya"),("25761",STR_TO_DATE("08/09/14","%d/%m/%y"),"Se sutituye la fotocelula nº1 y se verifica funcionamiento."),("25761",STR_TO_DATE("02/10/14","%d/%m/%y"),"Se sustituye el PLC (ANFER) por que los problemas de LDR persistian. OK"),("25761",STR_TO_DATE("09/11/15","%d/%m/%y"),"Se sustituye la boya metálica por una EMB 2.2 reformada. "),("25761",STR_TO_DATE("30/01/18","%d/%m/%y"),"Se sustituye la foto-célula izquierda.");


INSERT INTO balizamiento VALUES ('25765','','Boya Castillete amarilla y marca de tope','RTU 02','GpD (4) A',11,'[(L 0.5 oc 1.5) x3] L 0.5 oc 4.5');
INSERT INTO localizacion VALUES ('25765','Puerto de Valencia.',6,'Canal, ángulo Norte del contradique.',"39º 26.143´N","00º 18.822´ W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES ("25765",STR_TO_DATE("16/04/04","%d/%m/%y"),"Se instala tele-control y se sustituye linterna de Balizamar por BDL 120 de ocho coronas."),("25765",STR_TO_DATE("09/06/08","%d/%m/%y"),"Se sustituye por una provisional por labores de mantenimiento."),("25765",STR_TO_DATE("21/10/10","%d/%m/%y"),"Se instalan nuevas baterías por averia."),("25765",STR_TO_DATE("27/02/12","%d/%m/%y"),"Fallos de comunicaciones por exceso de transmisiones. ANFER."),("25765",STR_TO_DATE("14/09/12","%d/%m/%y"),"Se recorta el radio de borneo de la boya acortando la cadena 5m."),("25765",STR_TO_DATE("12/03/13","%d/%m/%y"),"Se sincroniza con la boya 25761. (ANFER)"),("25765",STR_TO_DATE("03/09/14","%d/%m/%y"),"Se recupera la marca de tope del fondo marino, rota por la base y se instala de nuevo."),("25765",STR_TO_DATE("05/09/14","%d/%m/%y"),"Fallo de sincronia con la 25761. Se repara reseteando la RTU."),("25765",STR_TO_DATE("08/10/15","%d/%m/%y"),"Se sustituye la boya metálica por una EMB 2.2 reformada.");


INSERT INTO balizamiento VALUES ('25776','E-0201.25','Baliza TPS 3.3','','GpD(3)R',9,'[(L0.5 oc1.5)x2]+L0.5 oc 4.');
INSERT INTO localizacion VALUES ('25776','Puerto de Valencia.',7,'Extremo del contradique.',"39° 26.106' N","00° 18.811' W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES ("25776",STR_TO_DATE("09/09/09","%d/%m/%y"),"Montaje de nueva torre TPS 3.3 (LMV)."),("25776",STR_TO_DATE("09/03/11","%d/%m/%y"),"Se instala tele-control y sincronización con 25.777 (ANFER)"),("25776",STR_TO_DATE("09/06/11","%d/%m/%y"),"Se repara avería de “Fallo de comunicaciones” ocasionada por tormenta."),("25776",STR_TO_DATE("14/06/13","%d/%m/%y"),"Averia de "Fallo de comunicaciones""),("25776",STR_TO_DATE("06/11/13","%d/%m/%y"),"Se sustituye cuadro de acometida."),("25776",STR_TO_DATE("04/10/13","%d/%m/%y"),"Fallo de comunicaciones."),("25776",STR_TO_DATE("14/11/13","%d/%m/%y"),"Se repara la radio Anfer."),("25776",STR_TO_DATE("22/11/13","%d/%m/%y"),"Anfer repara la radio (Etapa de potencia averiada)."),("25776",STR_TO_DATE("25/06/14","%d/%m/%y"),"De nuevo caen las comunicaciones (Hay tormentas en la zona)."),("25776",STR_TO_DATE("26/08/14","%d/%m/%y"),"Se desconecta la automatizacion SCADA y se deja con su destellador."),("25776",STR_TO_DATE("08/04/15","%d/%m/%y"),"Se repinta la torre de la baliza dejando el tercio inferior de blanco."),("25776",STR_TO_DATE("01/06/16","%d/%m/%y"),"Anfer sustituye la antena GPS por fallo de comunicación y sincronia."),("25776",STR_TO_DATE("12/12/17","%d/%m/%y"),"Se repinta la torre."),("25776",STR_TO_DATE("08/01/18","%d/%m/%y"),"Fallo de red. Diferencial caido por tormenta. "),("25776",STR_TO_DATE("05/11/18","%d/%m/%y"),"Se sustituyen las fotocélulas por avería.");


INSERT INTO balizamiento VALUES ('25777','E-0201.16','Baliza TPS 3.3','','GpD(3)R',9,'[(L 0.5 oc 1.5)x2] L0.5 oc 4.');
INSERT INTO localizacion VALUES ('25777','Puerto de Valencia.',8,'Extremo del contradique ángulo interior.',"39º 26.083´N","00º 18.847´ W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES ("25777",STR_TO_DATE("20/01/10","%d/%m/%y"),"Se instala la nueva torre TPS 3.3 (LMV)"),("25777",STR_TO_DATE("09/03/11","%d/%m/%y"),"Se instala telecontrol y se sincroniza con 25776."),("25777",STR_TO_DATE("31/05/11","%d/%m/%y"),"Avería en la fuente de alimentación ANFER."),("25777",STR_TO_DATE("17/01/12","%d/%m/%y"),"Avería por tormenta de la fuente de alimentación ANFER."),("25777",STR_TO_DATE("18/11/12","%d/%m/%y"),"Avería por tormenta de la fuente de alimentación ANFER."),("25777",STR_TO_DATE("21/11/12","%d/%m/%y"),"ANFER sustituye la fuente y conecta la carga directamente a la batería."),("25777",STR_TO_DATE("14/05/13","%d/%m/%y"),"Avería en la fuente, se sustituye y se manda a reparar."),("25777",STR_TO_DATE("17/05/13","%d/%m/%y"),"Avería en la fuente, se retira se manda a repara y se instala un cargador."),("25777",STR_TO_DATE("20/11/13","%d/%m/%y"),"Se reinicia por fallo de comunicación y se restablece el servicio."),("25777",STR_TO_DATE("08/04/15","%d/%m/%y"),"Se repinta la torre de la baliza dejando el tercio inferior de blanco."),("25777",STR_TO_DATE("24/09/15","%d/%m/%y"),"Se sustituyen ambas LDR."),("25777",STR_TO_DATE("12/12/17","%d/%m/%y"),"Se repinta la torre");


INSERT INTO balizamiento VALUES ('25800','E-0201.2','Baliza TPS 3.3','','DR',3,'L 0.5 oc 2.5');
INSERT INTO localizacion VALUES ('25800','Puerto de Valencia.',9,'Roja xita.',"39º 26.527´N","00º 18.635´ W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES ("25800",STR_TO_DATE("04/11/04","%d/%m/%y"),"Se pinta la torre."),("25800",STR_TO_DATE("22/10/07","%d/%m/%y"),"Se instala nueva torre."),("25800",STR_TO_DATE("24/10/07","%d/%m/%y"),"Anfer instala el telecontrol."),("25800",STR_TO_DATE("13/12/07","%d/%m/%y"),"Avería por caída del magneto-térmico de acometida."),("25800",STR_TO_DATE("27/02/09","%d/%m/%y"),"Pintar torre."),("25800",STR_TO_DATE("02/04/12","%d/%m/%y")," Se cambia la característ. pasa de CtR a DR. y se comunica oficialmente."),("25800",STR_TO_DATE("11/05/12","%d/%m/%y")," Magneto-térmico de acomet. averiado por filtración de agua, se sustituye."),("25800",STR_TO_DATE("27/09/10","%d/%m/%y"),"Se pinta la torre. (El carbón de la zona obliga a una mayor atención)"),("25800",STR_TO_DATE("02/04/12","%d/%m/%y"),"Se cambia la característica que pasa de Ct. a DV 3 segundos."),("25800",STR_TO_DATE("06/11/13","%d/%m/%y"),"Se sustituye cuadro de acometida y se instala pantalla de fluorescentes."),("25800",STR_TO_DATE("07/05/15","%d/%m/%y"),"Se repinta toda la señal, dejando el tercio inferior de blanco."),("25800",STR_TO_DATE("17/11/15","%d/%m/%y"),"Se sustituyen los cierres y el candado."),("25800",STR_TO_DATE("25/02/16","%d/%m/%y"),"Se sustituye la batería por una usada del 2011 (en buenas condiciones)"),("25800",STR_TO_DATE("05/04/16","%d/%m/%y"),"Se sustituyen ambas LDR por avería."),("25800",STR_TO_DATE("05/09/17","%d/%m/%y"),"Se pinta toda la señal."),("25800",STR_TO_DATE("31/10/17","%d/%m/%y"),"Se sustituye por rotura, la óptica de la linterna."),("25800",STR_TO_DATE("11/01/18","%d/%m/%y"),"Se sustituye el Moscad para restablecer el Tele-control.");


INSERT INTO balizamiento VALUES ('25768','','Boya Castillete verde-roja-verde y marca de tope','No',14,5,'L0.5 oc1 L0.5 oc3 L0.5 oc9');
INSERT INTO localizacion VALUES ('25768','Puerto de Valencia.',10,'Canal de entrada Er. frente Xitá.',"39º 26.401´N","00º 18.684´ W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES ("25768",STR_TO_DATE("20/11/09","%d/%m/%y"),"Se fondea nueva boya de bifurcación por disminución de calado."),("25768",STR_TO_DATE("26/04/10","%d/%m/%y"),"Se sustituye la boya (foto)."),("25768",STR_TO_DATE("30/10/15","%d/%m/%y"),"Se sustituye el tren de fondeo completo por desgaste."),("25768",STR_TO_DATE("06/02/18","%d/%m/%y"),"Se saca a tierra por mantenimiento. Se le cambia la batería a la baliza 6v."),("25768",STR_TO_DATE("27/02/18","%d/%m/%y"),"Se fondea de nuevo en su posición, limpia y pintada.");


INSERT INTO balizamiento VALUES ('25820','E-0201.4','Baliza TPS 3.3','','GpD(2)V   ',7,'L 0.5 oc 1.5 L 0.5 oc 4.5');
INSERT INTO localizacion VALUES ('25820','Puerto de Valencia.',11,'Verde Xitá.',"39º 26.516´N","00º 18.760´ W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES ("25820",STR_TO_DATE("25/06/04","%d/%m/%y"),"Se sustituye baliza modelo  Balizamar por BDL 120 ocho coronas."),("25820",STR_TO_DATE("04/11/04","%d/%m/%y"),"Se pinta la torre. "),("25820",STR_TO_DATE("26/01/07","%d/%m/%y"),"Apagada y retirada por obras. Se fondea una boya en su lugar."),("25820",STR_TO_DATE("15/05/09","%d/%m/%y"),"Se instala nueva torre TPS 3.3 (LMV)"),("25820",STR_TO_DATE("09/09/09","%d/%m/%y"),"Se sincroniza con la boya 25820.1"),("25820",STR_TO_DATE("31/03/11","%d/%m/%y"),"Avería, fallo de la linterna y del sincronismo."),("25820",STR_TO_DATE("16/05/11","%d/%m/%y"),"Se instala el Tele-control (ANFER)."),("25820",STR_TO_DATE("13/06/11","%d/%m/%y"),"Sincronizar a través del tele-control con la boya 25820.1"),("25820",STR_TO_DATE("07/11/13","%d/%m/%y"),"Instalación de un punto de luz."),("25820",STR_TO_DATE("05/09/17","%d/%m/%y"),"Se pinta toda la señal con el tercio inferior blanco.");


INSERT INTO balizamiento VALUES ('25820,1','','Boya Castillete verde-roja-verde y marca de tope','Sí','GpD (2)V',7,'L 0.5 oc 1.5 L 0.5 oc 4.5');
INSERT INTO localizacion VALUES ('25820,1','Puerto de Valencia.',12,'Canal de entrada Er. Xitá.',"39º 26.512´N","00º 18.779´ W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES ("25820,1",STR_TO_DATE("26/01/07","%d/%m/%y"),"Se fondea de modo provisional por apagado y retirado de la baliza 25.820"),("25820,1",STR_TO_DATE("15/03/07","%d/%m/%y"),"Se desplaza por dragado en la zona."),("25820,1",STR_TO_DATE("26/08/10","%d/%m/%y"),"Se sustituye la boya por una nueva tele-controlada."),("25820,1",STR_TO_DATE("09/09/09","%d/%m/%y"),"Se sincroniza con la 25820 LMV."),("25820,1",STR_TO_DATE("13/06/11","%d/%m/%y"),"Se sincroniza con la baliza 25820 a través del tele- control, ANFER."),("25820,1",STR_TO_DATE("25/07/11","%d/%m/%y"),"Repara fallo de comunicaciones."),("25820,1",STR_TO_DATE("24/11/11","%d/%m/%y"),"Fallo en el destellador."),("25820,1",STR_TO_DATE("21/03/13","%d/%m/%y"),"Sustitución de una fotocélula."),("25820,1",STR_TO_DATE("15/01/18","%d/%m/%y"),"Los topográfos toman nueva posición.");


INSERT INTO balizamiento VALUES ('25850','E-0203.4','Baliza TPS 3.3','RTU 45',14,5,'L0.5 oc 1 L 0.5 oc 3 L 0.5 oc 9');
INSERT INTO localizacion VALUES ('25850','Puerto de Valencia.',13,'Muelle de Levante.',"39º 26.772´N","00º 18.866´ W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES ("25850",STR_TO_DATE("30/11/08","%d/%m/%y"),"Se instala torre nueva mod.TPS33"),("25850",STR_TO_DATE("26/03/10","%d/%m/%y"),"Se instala el telecontrol"),("25850",STR_TO_DATE("17/01/14","%d/%m/%y"),"Se repinta por DRAGADOS."),("25850",STR_TO_DATE("08/03/17","%d/%m/%y"),"Pavasal cambia la acometida que pasa a tomar corriente del CT nº1"),("25850",STR_TO_DATE("13/09/17","%d/%m/%y"),"Se repinta toda la baliza.");


INSERT INTO balizamiento VALUES ('25840','E-0202','Baliza TPS 3.3','RTU 44','GpD (4)R',11,'[(0.5 oc 1.5)x3] L 0.5 oc 4.5');
INSERT INTO localizacion VALUES ('25840','Puerto de Valencia.',14,'Muelle Sur.',"39º 26.589´N","00º 18.984´ W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES ("25840",STR_TO_DATE("16/06/04","%d/%m/%y"),"Se sustituye linterna Balizamar por BDL 120 de ocho coronas."),("25840",STR_TO_DATE("31/01/07","%d/%m/%y"),"Se apaga y se retira por obras. Se fondea una boya en su lugar."),("25840",STR_TO_DATE("15/03/07","%d/%m/%y"),"Se desplaza la boya provisional por dragado"),("25840",STR_TO_DATE("08/04/09","%d/%m/%y"),"Se instala nueva torre TPS 3.3 (LMV)."),("25840",STR_TO_DATE("27/10/09","%d/%m/%y"),"Se repinta para adecuarse a la nueva resolución, toda roja y se modifican los destellos a GpD (4) R."),("25840",STR_TO_DATE("16/03/10","%d/%m/%y"),"Se instala el tele-control."),("25840",STR_TO_DATE("16/06/11","%d/%m/%y"),"Se instala sincronismo con la boya 25840.1 (no está fondeada todavía)."),("25840",STR_TO_DATE("08/06/12","%d/%m/%y"),"Se sustituyen las LDR."),("25840",STR_TO_DATE("04/12/12","%d/%m/%y"),"Se desmonta la linterna para reparar fallos en coronas de leds."),("25840",STR_TO_DATE("04/11/13","%d/%m/%y"),"Se instala punto de luz."),("25840",STR_TO_DATE("04/06/15","%d/%m/%y"),"Se repinta toda la señal, dejando el tercio inferior de blanco."),("25840",STR_TO_DATE("01/10/18","%d/%m/%y"),"Se repinta toda la torre.");


INSERT INTO balizamiento VALUES ('25841','','Boya Castillete rojo y marca de tope','RTU 54','GpD (4)R',11,'[( L 0.5 oc 1.5)x3] L 0.5 oc 4.5');
INSERT INTO localizacion VALUES ('25841','Puerto de Valencia.',15,'Extremo del muelle sur.',"39º 26.590´N","00º 18.938´ W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES ("25841",STR_TO_DATE("19/02/13","%d/%m/%y"),"Se fondea y entra en servicio."),("25841",STR_TO_DATE("01/12/14","%d/%m/%y"),"Se monitoriza, se detectan errores y se informa de ellos."),("25841",STR_TO_DATE("16/12/14","%d/%m/%y"),"Finalizan trabajos de tele-control."),("25841",STR_TO_DATE("05/01/15","%d/%m/%y"),"Se sustituyen las dos baterías."),("25841",STR_TO_DATE("30/10/15","%d/%m/%y"),"Se reponen ánodos de sacrificio, por desgaste."),("25841",STR_TO_DATE("21/12/15","%d/%m/%y"),"Se sustituye la fotocélula nº2 y se secan humedades en la linterna."),("25841",STR_TO_DATE("16/05/16","%d/%m/%y"),"Se vuelve a abrir para secar la humedad de la linterna."),("25841",STR_TO_DATE("21/09/17","%d/%m/%y"),"Se desmonta la linterna para eliminar la humedad."),("25841",STR_TO_DATE("16/01/18","%d/%m/%y"),"Se desplaza a nueva posición."),("25841",STR_TO_DATE("21/03/18","%d/%m/%y"),"Se sustituye por una provisional por mantenimiento."),("25841",STR_TO_DATE("04/04/18","%d/%m/%y"),"Se posiciona de nuevo en su ubicación, sustituida linterna (BDL 120).");


INSERT INTO balizamiento VALUES ('25842','E-0201.7','Baliza TPS 3.3','','GpDV',3,'L 0.5 oc 2.5');
INSERT INTO localizacion VALUES ('25842','Puerto de Valencia.',16,'Er. Dársena de servicios Náuticos.',"39º 26.475´N","00º 19.062´ W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES ("25842",STR_TO_DATE("30/11/10","%d/%m/%y"),"Se instala nueva torre TPS 3.3 (LMV)"),("25842",STR_TO_DATE("15/12/10","%d/%m/%y"),"Se instala el tele-control."),("25842",STR_TO_DATE("06/06/11","%d/%m/%y"),"Avería por tormenta (fallo de comunicaciones)ANFER."),("25842",STR_TO_DATE("22/02/12","%d/%m/%y"),"Fallo de no comunicación de la avería de Fallo de red 230."),("25842",STR_TO_DATE("06/09/13","%d/%m/%y"),"Sustitución de la fuente de alimentación "Fallo de rectificador""),("25842",STR_TO_DATE("05/11/13","%d/%m/%y"),"Se instala punto de luz."),("25842",STR_TO_DATE("05/06/15","%d/%m/%y"),"Se repinta toda la señal, dejando el tercio inferior de blanco."),("25842",STR_TO_DATE("28/10/15","%d/%m/%y"),"No comunica. Se avisa a Anfer."),("25842",STR_TO_DATE("03/11/15","%d/%m/%y"),"Se repara el transceptor y se verifica su funcionamiento. OK."),("25842",STR_TO_DATE("01/03/17","%d/%m/%y"),"Se sincroniza la nueva baliza con la boya roja 25843"),("25842",STR_TO_DATE("01/10/18","%d/%m/%y"),"Se repinta toda la torre.");


INSERT INTO balizamiento VALUES ('25843','E-0201.75','Boya Castillete','Si','DR',3,'L 0.5 oc 2.5');
INSERT INTO localizacion VALUES ('25843','Puerto de Valencia.',17,'1ª boya a Br. Dársena de Servicios Náuticos.',"39º 26.402´N","00º 19.076´ W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES ("25843",STR_TO_DATE("20/01/2014","%d/%m/%Y"),"Se repinta toda la torre de blanco y rojo.(DRAGADOS)"),("25843",STR_TO_DATE("01/03/2017","%d/%m/%Y"),"Se sustituye la baliza por una boya y se sincroniza con la 25842."),("25843",STR_TO_DATE("11/10/2017","%d/%m/%Y"),"Se sustituye la boya por una nueva, modelo PBM 18");


INSERT INTO balizamiento VALUES ('25842.5','','Boya Cilíndrica verde.','Si.','Ct',1,'L 0,5 + oc 0,5');
INSERT INTO localizacion VALUES ('25842.5','Puerto de Valencia.',18,'Boya a Er. Bocana Dársena de Servicios Náuticos.',"39º 26.454´N","00º 19.056´ W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES ("25842.5",STR_TO_DATE("08/04/2016","%d/%m/%Y"),"La boya se suelta de su fondeo habitual  y hay volver a fondearla."),("25842.5",STR_TO_DATE("01/03/2017","%d/%m/%Y"),"Se fondea una nueva boya luminosa.");


INSERT INTO balizamiento VALUES ('25843.5','','Boya Cilíndrica roja','Si','Ct',1,'L 0,5 + oc 0,5');
INSERT INTO localizacion VALUES ('25843.5','Puerto de Valencia.',19,'2ª boya a Br. Dársena de Servicios Náuticos.',"39º 26.439´N","00º 19.094´ W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES ("25843.5",STR_TO_DATE("01/03/2017","%d/%m/%Y"),"Se sustituye por una boya luminosa.");


INSERT INTO balizamiento VALUES ('25843.8','','Boya Cilíndrica roja','Si','Ct. 1s.',1,'L 0,5 + oc 0,5');
INSERT INTO localizacion VALUES ('25843.8','Puerto de Valencia.',19-a,'3ª boya Br. Dársena de Servicios Náuticos',"39º 26,484´ N","00º 19,093´ W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES ("25843.8",STR_TO_DATE("01/03/2017","%d/%m/%Y"),"Se fondea por primera vez.");


INSERT INTO balizamiento VALUES ('25830','E-0201.5','Baliza TPS 4.8','','GpD(2)V',9,'[(L 0.5 oc 1.5)x2]+ L 0.5 oc 4.5');
INSERT INTO localizacion VALUES ('25830','Puerto de Valencia.',20,'Muelle Transversal Costa.',"39º 26.245´N","00º 19.181´ W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES ("25830",STR_TO_DATE("04/11/04","%d/%m/%y"),"Se pinta la torre."),("25830",STR_TO_DATE("01/10/10","%d/%m/%y"),"Se instala nueva torre TPS 4.3 y se monta el telecontrol."),("25830",STR_TO_DATE("26/08/10","%d/%m/%y"),"Se retira la boya de obras 25830.1 fondeada durante la ejecución de las obras."),("25830",STR_TO_DATE("25/08/11","%d/%m/%y"),"Se sustituyen las dos LDR."),("25830",STR_TO_DATE("22/11/13","%d/%m/%y"),"Anfer repara radio (Etapa de potencia averiada)."),("25830",STR_TO_DATE("01/04/15","%d/%m/%y"),"se sustituye la LDR nº 1"),("25830",STR_TO_DATE("08/11/16","%d/%m/%y"),"Se pinta la torre verde con el tercio inferior de blanco."),("25830",STR_TO_DATE("11/05/18","%d/%m/%y"),"Se sustituye una fotocélula por avería.");


INSERT INTO balizamiento VALUES ('25831','','Baliza Columna cilíndrica verde con la base blanca.','','GpD (3)V',9,'L 0,5 + oc 1,5 + L 0,5 + oc 1,5 + L 0,5 + oc 4,5');
INSERT INTO localizacion VALUES ('25831','Muelle Transversal Costa en Duque de Alba',21,'Puerto de Valencia',"39º 26,252´N","000º 19,145´ W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES FALSO;


INSERT INTO balizamiento VALUES ('25844','','Boya oceanográfica Castillete amarilla y marca de tope','RTU 37','GpD (4)A',11,'[(L 0.5 oc 1.5) x3] L 0.5 oc 4.5');
INSERT INTO localizacion VALUES ('25844','Puerto de Valencia.',x,'Extremo muelle Sur.',"39º 26.611´N","00º 18.999´ W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES ("25844",STR_TO_DATE("05/06/09","%d/%m/%y"),"Se fondea boya oceanográfica."),("25844",STR_TO_DATE("10/06/09","%d/%m/%y"),"Se desplaza  para que no moleste a la navegación."),("25844",STR_TO_DATE("17/12/09","%d/%m/%y"),"Se procede a retirar la boya por labores de mantenimiento. "),("25844",STR_TO_DATE("26/11/10","%d/%m/%y"),"Se procede a retirar boya por mantenimiento."),("25844",STR_TO_DATE("09/05/11","%d/%m/%y"),"Se sustituye boya por provisional por labores de mantenimiento (fallos en los sensores)."),("25844",STR_TO_DATE("04/11/11","%d/%m/%y"),"Baja de la marca por linterna apagada."),("25844",STR_TO_DATE("11/11/11","%d/%m/%y"),"Se sustituye la linterna por una auto-alimentada MCL140, por fallo baterías."),("25844",STR_TO_DATE("28/01/13","%d/%m/%y"),"Sustitución de las dos baterías (Marca Ritar 250 Ah.)"),("25844",STR_TO_DATE("14/06/13","%d/%m/%y"),"Se saca del agua por decisión tecnica y se comunica su retirada."),("25844",STR_TO_DATE("30/10/13","%d/%m/%y"),"SUPRIMIDA DEFINITIVAMENTE");


INSERT INTO balizamiento VALUES ('25960','E-0205','Baliza TPS 3.3','RTU 43',14.5,'L0.5 oc 1 L 0.5 oc 3 L 0.5 oc 9');
INSERT INTO localizacion VALUES ('25960','Puerto de Valencia.',24,'Muelle Poniente.',"39º 27.241´N","00º 19.372´ W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES ("25960",STR_TO_DATE("14/03/07","%d/%m/%y"),"Se instala un panel solar por avería en la acometida eléctrica220v."),("25960",STR_TO_DATE("26/10/09","%d/%m/%y"),"Se repinta incluiendo una franja verde y convertirla en marca lateral de bifurc.ación. "),("25960",STR_TO_DATE("10/12/09","%d/%m/%y"),"Se instala el telecontrol."),("25960",STR_TO_DATE("05/11/13","%d/%m/%y"),"Se instala punto de luz."),("25960",STR_TO_DATE("17/01/14","%d/%m/%y"),"Se repinta por DRAGADOS."),("25960",STR_TO_DATE("14/01/17","%d/%m/%y"),"Se repinta la torre.");


INSERT INTO balizamiento VALUES ('25920','E-0204.2','Baliza TPS 3.3','RTU 13','GpD (4) V',11,'[(L 0.5 oc 1.5) x3] L 0.5 oc 4.5');
INSERT INTO localizacion VALUES ('25920','Puerto de Valencia.',22,'E. Turia Er.',"39º 26.901´N","00º 19.284´ W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES ("25920",STR_TO_DATE("17/06/07","%d/%m/%y"),"Se instala nueva baliza."),("25920",STR_TO_DATE("29/11/08","%d/%m/%y"),"Sustituyo la batería por una nueva de gel 100 A/h."),("25920",STR_TO_DATE("03/12/08","%d/%m/%y"),"Reparar linterna, numerosos leds fundidos (dos coronas)."),("25920",STR_TO_DATE("24/06/10","%d/%m/%y"),"Se instala telecontrol."),("25920",STR_TO_DATE("30/06/10","%d/%m/%y"),"Se sustituyen las foto-células"),("25920",STR_TO_DATE("29/12/11","%d/%m/%y"),"Sustituir linterna ."),("25920",STR_TO_DATE("12/07/12","%d/%m/%y"),"Sustituir batería."),("25920",STR_TO_DATE("04/11/13","%d/%m/%y"),"Se instala pantalla de fluorescentes."),("25920",STR_TO_DATE("24/06/15","%d/%m/%y"),"Se repinta la baliza y se deja el tercio inferior blanco"),("25920",STR_TO_DATE("23/10/18","%d/%m/%y"),"Se repinta la baliza.");


INSERT INTO balizamiento VALUES ('25940','E-0204','Baliza TPS 3.3','','GpDR',3,'L 0.5 oc 2.5');
INSERT INTO localizacion VALUES ('25940','Puerto de Valencia.',23,'Br E.Turia.',"39º 26.990´N","00º 19.237´ W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES ("25940",STR_TO_DATE("17/10/07","%d/%m/%y"),"Se instala torre nueva."),("25940",STR_TO_DATE("29/10/07","%d/%m/%y"),"Anfer instala telecontrol."),("25940",STR_TO_DATE("29/11/08","%d/%m/%y"),"Sustituyo la batería por una nueva de gel 100 A/h."),("25940",STR_TO_DATE("01/03/10","%d/%m/%y"),"Se instala el tele-control."),("25940",STR_TO_DATE("19/11/10","%d/%m/%y"),"Se repinta la torre."),("25940",STR_TO_DATE("19/07/12","%d/%m/%y"),"Datos de la tensión de baterías erróneos. Anfer repara."),("25940",STR_TO_DATE("04/11/13","%d/%m/%y"),"Se instala pantalla de fluorescentes."),("25940",STR_TO_DATE("01/10/14","%d/%m/%y"),"Se sustituye la batería por una en buen estado (no nueva)."),("25940",STR_TO_DATE("24//06/1","%d/%m/%y")," Se repinta la baliza y se deja el tercio inferior blanco."),("25940",STR_TO_DATE("16/05/16","%d/%m/%y"),"Una estacha revienta la torre de la baliza. Se encarga una defensa."),("25940",STR_TO_DATE("09/06/16","%d/%m/%y"),"El taller instala una defensa para evitar daños por las estachas."),("25940",STR_TO_DATE("27/09/16","%d/%m/%y"),"Sustitución de la LDR nº 2 por avería."),("25940",STR_TO_DATE("19/12/17","%d/%m/%y"),"Sustitución de las dos LDR."),("25940",STR_TO_DATE("23/10/18","%d/%m/%y"),"Se repinta la baliza.");


INSERT INTO balizamiento VALUES ('25730','','Boya Castillete negra amarilla negra y marca de tope','No lo necesita','GRp(3)B',5,'[(L 0.25 oc 0.25)x2] + L 0.25 oc 3.75');
INSERT INTO localizacion VALUES ('25730','Puerto de Valencia.',25,'Exterior, en alineación contradique RCNV.',"39º 25.219´N","00º 18.218´ W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES ("25730",STR_TO_DATE("16/04/04","%d/%m/%y"),"Se instala tele-control y sustituye la linterna de Balizamar por una BDL 120"),("25730",STR_TO_DATE("12/12/06","%d/%m/%y"),"Se sustituye por reparación."),("25730",STR_TO_DATE("14/05/07","%d/%m/%y"),"Se fondea otra vez la boya original reparada."),("25730",STR_TO_DATE("04/01/08","%d/%m/%y"),"Sustituir linterna rota."),("25730",STR_TO_DATE("15/05/08","%d/%m/%y"),"Reparar barandilla rota por siniestro."),("25730",STR_TO_DATE("17/12/08","%d/%m/%y"),"Dos paneles rotos por temporal."),("25730",STR_TO_DATE("26/01/10","%d/%m/%y"),"Paneles rotos por temporal."),("25730",STR_TO_DATE("08/02/10","%d/%m/%y"),"Se cambia la característica."),("25730",STR_TO_DATE("28/10/10","%d/%m/%y"),"Se sustituye la boya"),("25730",STR_TO_DATE("03/01/11","%d/%m/%y"),"Se repara alarma de GPS (fallo de posicionamiento) ANFER."),("25730",STR_TO_DATE("22/11/10","%d/%m/%y"),"Alarma por fallo de comunicación del GPS (Se reinicializa). Fallos de comunicaciones por exceso de transmisiones. ANFER"),("25730",STR_TO_DATE("03/04/20","%d/%m/%y"),"2 Se sustituye para reparar paneles solares y mantenimiento."),("25730",STR_TO_DATE("31/05/20","%d/%m/%y"),"2 Se fondea de nuevo pintada con paneles nuevos y tres baterías nuevas."),("25730",STR_TO_DATE("04/05/20","%d/%m/%y"),"2 Se sustituye un panel destruido por la tormenta del Viernes día 28/04/12."),("25730",STR_TO_DATE("06/06/20","%d/%m/%y"),"6 Se sustituye la puerta del armario exterior y la fotocélula nº2."),("25730",STR_TO_DATE("26/07/20","%d/%m/%y"),"6 Avería por batería baja. Se revisa la instalación y se deja operativa."),("25730",STR_TO_DATE("31/01/20","%d/%m/%y"),"7 Se saca a tierra por mantenimiento (eléctrico ,mecánico y pintura)"),("25730",STR_TO_DATE("05/07/20","%d/%m/%y"),"7 Una vez finalizado su mantenimiento se fondea de nuevo en su ubicación"),("25730",STR_TO_DATE("10/07/20","%d/%m/%y"),"7 Se suelta de su anclaje el PLC dando fallo, se sujeta con bridas. ");


INSERT INTO balizamiento VALUES ('26020','E-0206.7','Baliza Tronco piramidal negro-amarillo con marca de tope.','No','GpRp (6) B',10,'[(L 0.25 oc 0.25) x6] L 2 oc 5');
INSERT INTO localizacion VALUES ('26020','Puerto de Valencia.',26,'RCNV Contra dique ángulo Sur',"39º 25.242´N","00º 19.052´ W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES ("26020",STR_TO_DATE("19/10/09","%d/%m/%y"),"Se instala nueva baliza cardinal sur. "),("26020",STR_TO_DATE("12/11/10","%d/%m/%y"),"Se sustituyen los discos de leds averiados."),("26020",STR_TO_DATE("17/12/10","%d/%m/%y"),"Se sustituye la linterna por una de bajo consumo (led de alta visibilidad)"),("26020",STR_TO_DATE("11/06/13","%d/%m/%y"),"Se modifica la marca de tope y se baja el panel solar."),("26020",STR_TO_DATE("11/06/15","%d/%m/%y"),"Se repinta toda la torre."),("26020",STR_TO_DATE("12/02/18","%d/%m/%y"),"Se rompe el soporte de la marca de tope (aviso al taller mecánico)."),("26020",STR_TO_DATE("16/02/18","%d/%m/%y"),"Se instala de nuevo la marca de tope reparada."),("26020",STR_TO_DATE("29/08/18","%d/%m/%y"),"Se apaga la luz y se repara sustituyendo la batería y el regulador."),("26020",STR_TO_DATE("18/10/18","%d/%m/%y"),"Se repinta la torre.");


INSERT INTO balizamiento VALUES ('26021','E-0208.6','Baliza TPS 3.3','','GpD(2)V',7,'L 0.5 oc 1.5 L 0.5 oc 4.5');
INSERT INTO localizacion VALUES ('26021','Puerto de Valencia.',27,'Er. Bocana R.C.N.V.',"39º 25.356´N","00º 19.360´ W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES ("26021",STR_TO_DATE("04/09/06","%d/%m/%y"),"Se retira la torre cuadrangular por obras de ampliación."),("26021",STR_TO_DATE("08/11/06","%d/%m/%y"),"Se instala baliza de manera provisional."),("26021",STR_TO_DATE("27/06/09","%d/%m/%y"),"Se pinta la torre."),("26021",STR_TO_DATE("30/10/09","%d/%m/%y"),"Se instala nueva torre TPS 3.3."),("26021",STR_TO_DATE("11/06/15","%d/%m/%y"),"Se repinta la torre verde con la base blanca");


INSERT INTO balizamiento VALUES ('26025','E-0208.65','Baliza TPS 3.3','','GpD(2)R',7,'L 0.5 oc 1.5 L 0.5 oc 4.5');
INSERT INTO localizacion VALUES ('26025','Puerto de Valencia.',28,'Br.Bocana R.C.N.V.','39º 25.427´N','00º 19.411´ W');
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES ("26025",STR_TO_DATE("09/01/09","%d/%m/%y"),"Se instala nueva torre TPS 3.3 y se retira la boya que se fondeó por obras."),("26025",STR_TO_DATE("04/03/09","%d/%m/%y"),"Se instala escalera de acero inox. Para mejorar acceso."),("26025",STR_TO_DATE("11/06/15","%d/%m/%y"),"Se repinta la torre roja con la base blanca"),("26025",STR_TO_DATE("18/10/18","%d/%m/%y"),"Se repinta la torre.");


INSERT INTO balizamiento VALUES ('26041','E-0208.8','Baliza Tronco piramidal metálica','','GpD(3)R',9,'[(L 0.5 oc 1.5)x2]+ L 0.5 oc 4.5');
INSERT INTO localizacion VALUES ('26041','Puerto de Valencia.',29,'R.C.N.V. Bocana interior roja',"39º 25,595´ N","0º 19,776´ W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES ("26041",STR_TO_DATE("27/06/09","%d/%m/%y"),"Pintado de la torre"),("26041",STR_TO_DATE("02/02/12","%d/%m/%y"),"Cambio de óptica por degradación. O.T. 55/242/2012"),("26041",STR_TO_DATE("13/04/16","%d/%m/%y"),"Se pinta manteniendo el tercio inferior de blanco"),("26041",STR_TO_DATE("18/10/18","%d/%m/%y"),"Se repinta la torre.");


INSERT INTO balizamiento VALUES ('26035','E-0208.75','Baliza Tronco piramidal metálica','','GpD(3)V',9,'[(L 0.5 oc 1.5)x2]+ L 0.5 oc 4.5');
INSERT INTO localizacion VALUES ('26035','Puerto de Valencia.',30,'R.C.N.V. Verde interior',"39º 25,643´ N","0º 19,773´ W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES ("26035",STR_TO_DATE("18/10/2012","%d/%m/%Y"),"Sustituir destellador y reprogramar."),("26035",STR_TO_DATE("13/04/2016","%d/%m/%Y"),"Se pinta manteniendo el tercio inferior de blanco"),("26035",STR_TO_DATE("18/10/2018","%d/%m/%Y"),"Se repinta la torre.");


INSERT INTO balizamiento VALUES ('26045','E-0208.84','Baliza Tronco piramidal metálica','','CtV',1,'L 0.3 oc 0.7');
INSERT INTO localizacion VALUES ('26045','Puerto de Valencia.',31,'Verde bocana D.E.M.',"39º 25.530´N","00º 19.856´ W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES ("26045",STR_TO_DATE("25/06/08","%d/%m/%y"),"Sustitución de la batería de gel de 100 A/h."),("26045",STR_TO_DATE("07/01/10","%d/%m/%y"),"Sustitución de la batería."),("26045",STR_TO_DATE("13/12/13","%d/%m/%y"),"Sustitución del panel solar por avería."),("26045",STR_TO_DATE("20/12/13","%d/%m/%y"),"Sustitución de las baterías (Usadas)."),("26045",STR_TO_DATE("07/01/14","%d/%m/%y"),"Se comienza su repintado y con el tercio inferior de blanco."),("26045",STR_TO_DATE("21/05/14","%d/%m/%y"),"Se sustituye la bateria y se instala una RITAR 140 Ah");


INSERT INTO balizamiento VALUES ('26046','E-0208.86','Baliza Tronco piramidal metálica','','CtR',1,'L 0.3 oc 0.7');
INSERT INTO localizacion VALUES ('26046','Puerto de Valencia.',32,'Roja bocana D.E.M.',"39º 25.545´N","00º 19.884´ W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES ("26046",STR_TO_DATE("25/01/10","%d/%m/%y"),"Sustitución de la batería."),("26046",STR_TO_DATE("13/09/12","%d/%m/%y"),"Sustitución de la fotocélula por rotura."),("26046",STR_TO_DATE(" 07/01/1","%d/%m/%y")," Se comienza su repintado con el tercio inferior de blanco."),("26046",STR_TO_DATE("07/04/14","%d/%m/%y"),"Se sustituye el panel solar, la batería (RITAR 140 Ah) y el regulador."),("26046",STR_TO_DATE("28/11/18","%d/%m/%y"),"Se sustitulle la fotocélula por avería.");


INSERT INTO balizamiento VALUES ('26047','','Baliza Torre cilíndrica verde','RTU 35','GpD(2)V',7,'L0,5+oc1,5+L0,5+oc4,');
INSERT INTO localizacion VALUES ('26047','Puerto de Valencia.',33,'Er.Extremo dique de abrigo de la ampliación N',"39º 26.651´N","00º 17.500´ W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES ("26047",STR_TO_DATE("21/01/2014","%d/%m/%Y"),"Dragados repinta y dejan el tercio inferior de Blanco."),("26047",STR_TO_DATE("17/06/2014","%d/%m/%Y"),"El S. Electrico instala alumbrado interior a 12 v."),("26047",STR_TO_DATE("05/11/2014","%d/%m/%Y"),"Anfer comienza trabajos de instalación del tele-control."),("26047",STR_TO_DATE("12/12/2014","%d/%m/%Y"),"Se ponen en paralelo  las dos baterias. "),("26047",STR_TO_DATE("15/12/2014","%d/%m/%Y"),"Se por finalizados los trabajos de telecontrol."),("26047",STR_TO_DATE("08/09/2015","%d/%m/%Y"),"Se sustituye la fotocélula nº 2"),("26047",STR_TO_DATE("18/12/2017","%d/%m/%Y"),"Se pinta la torre manteniendo el tercio inferior blanco.");


INSERT INTO balizamiento VALUES ('26048','','Baliza Torre cilíndrica con base cónica roja','','GpD(2)R',7,'L0,5 oc1,5 L0,5 oc4,');
INSERT INTO localizacion VALUES ('26048','Puerto de Valencia.',34,'1ª Baliza de babor del nuevo contradique de la amp. N',"39º 26.679´N","00º 17.930´ W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES ("26048",STR_TO_DATE("09/04/2014","%d/%m/%Y"),"Se repara la instalación electrica por fallos de conexión."),("26048",STR_TO_DATE("23/06/2014","%d/%m/%Y"),"El S. Electrico instala alumbrado interior a 12 v."),("26048",STR_TO_DATE("10/11/2014","%d/%m/%Y"),"Anfer comienza a instalar el telecontrol."),("26048",STR_TO_DATE("20/11/2014","%d/%m/%Y"),"Comienza atrabajar con el tele-control."),("26048",STR_TO_DATE("16/12/2014","%d/%m/%Y"),"Se dan por finalizados los trabajos de telecontrol."),("26048",STR_TO_DATE("27/10/2016","%d/%m/%Y"),"Se pinta con el tercio inferior blanco.");


INSERT INTO balizamiento VALUES ('26048.1','','Baliza Torre cilíndrica con base cónica roja','','GpD(3)R',9,'[(L0,5 oc1,5)x2]+L0,5 oc4,5');
INSERT INTO localizacion VALUES ('26048.1','Puerto de Valencia.',35,'2ª baliza de Br, Extremo contradique de la ampliación N',"39º 27.070´N","00º 17.719´ W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES ("26048.1",STR_TO_DATE("18/09/2013","%d/%m/%Y"),"Se sustituye el Des-33 y la fotocélula por avería por tormenta."),("26048.1",STR_TO_DATE("12/11/2013","%d/%m/%Y"),"Se sustituye el Des-33 y se pone un Des-22 por tormenta."),("26048.1",STR_TO_DATE("25/06/2014","%d/%m/%Y"),"El S.E. Instala alumbrado interior a 12 V."),("26048.1",STR_TO_DATE("11/11/2014","%d/%m/%Y"),"Anfer comienza la instalación del telecontrol."),("26048.1",STR_TO_DATE("18/11/2014","%d/%m/%Y"),"Comienza a trabajar con el tele control."),("26048.1",STR_TO_DATE("16/12/2014","%d/%m/%Y"),"e dan por finalizados los trabajos del telecontrol."),("26048.1",STR_TO_DATE("29/06/2015","%d/%m/%Y"),"La baliza no comunica, posible fallo de la radio, se avisa a Integración de sistemas para que avisen a ANFER."),("26048.1",STR_TO_DATE("15/07/2015","%d/%m/%Y"),"Se repara la radio GP320 y queda operativa."),("26048.1",STR_TO_DATE("27/10/2016","%d/%m/%Y"),"Se pinta con el tercio inferior blanco."),("26048.1",STR_TO_DATE("08/01/2018","%d/%m/%Y"),"Fallo de comunicaciones por tormenta. Se resetea PLC.");


INSERT INTO balizamiento VALUES ('26047.1','','Baliza Cilíndrica con base cónica, negra amarilla negra con marca tope','Si.','GpRp(3)B',5,'[(L0,25 oc0,25)x2]+L0,25 oc3,75');
INSERT INTO localizacion VALUES ('26047.1','Puerto de Valencia.',36,'Cambio de alineación del dique de abrigo de ampliación N',"39º 27.300´N","00º 17.147´ W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES ("26047.1",STR_TO_DATE("18/06/2014","%d/%m/%Y"),"El S. Electrico instala alumbrado interior a 12 v."),("26047.1",STR_TO_DATE("24/06/2015","%d/%m/%Y"),"Se apaga definitivamente por la entrada en servicio del nuevo faro. ");


INSERT INTO balizamiento VALUES ('26047.2','','Baliza Poliester reforzado con fibra de vidrio','RTU 33','RpB',0,5,'L 0,25 + oc 0,25');
INSERT INTO localizacion VALUES ('26047.2','Puerto de Valencia.',37,'Quiebro del nuevo dique de abrigo',"39º 27.512´N","00º 17,748' W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES ("26047.2",STR_TO_DATE("01/09/2013","%d/%m/%Y"),"sustituimos la linterna BDL 120 por avería de multiples leds."),("26047.2",STR_TO_DATE("19/06/2014","%d/%m/%Y"),"El S. Electrico instala alumbrado interior a 12 v."),("26047.2",STR_TO_DATE("04/11/2014","%d/%m/%Y"),"ANFER instala el tele-control."),("26047.2",STR_TO_DATE("18/11/2014","%d/%m/%Y"),"Comienza a trabajar con el telecontrol."),("26047.2",STR_TO_DATE("16/11/2014","%d/%m/%Y"),"Se dan por finalizados los trabajos del tele-control."),("26047.2",STR_TO_DATE("02/03/2017","%d/%m/%Y"),"Se sustituye una foto-célula por avería."),("26047.2",STR_TO_DATE("16/10/2018","%d/%m/%Y"),"Se limpia y se revisan trampas para roedores."),("26047.2",STR_TO_DATE("06/11/2018","%d/%m/%Y"),"Se repinta toda la señal.");


INSERT INTO balizamiento VALUES ('26049','','Boya Fibra de vidrio','No','CtR',0,5,'L0,25 oc 0,25');
INSERT INTO localizacion VALUES ('26049','Marina Real Juan Carlos I',38,'Boya a babor Bocana Norte',"39º 27.850´N","00º 18.509' W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES FALSO;


INSERT INTO balizamiento VALUES ('26050','E-0199.9','Baliza Acero','No','CtR',0,5,'L0,25 oc 0,25');
INSERT INTO localizacion VALUES ('26050','Marina Real Juan Carlos I',39,'Extremo Dique de abrigo Bocana Norte',"39º 27.767´N","00º 18.509' W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES ("26050",STR_TO_DATE("07/11/2014","%d/%m/%Y"),"Se da de baja por falo de suministro (Batería en mal estado)."),("26050",STR_TO_DATE("12/11/2014","%d/%m/%Y"),"Se da de alta.");


INSERT INTO balizamiento VALUES ('26052','E-0199.91','Baliza Acero','No','CtV',0,5,'L0,25 oc 0,25');
INSERT INTO localizacion VALUES ('26052','Marina Real Juan Carlos I',40,'Extremo Contradique Bocana Norte',"39º 27.665´N","00º 18.632' W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES FALSO;


INSERT INTO balizamiento VALUES ('26052.5','',' Cilíndrica','Si','D A',5,'Fija');
INSERT INTO localizacion VALUES ('26052.5','Marina Real Juan Carlos I',B1,'Primera boya Marca Especial Dársena Exterior',"39º 27.563´N","000º 18,610´ W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES FALSO;


INSERT INTO balizamiento VALUES ('26052.7','',' Cilíndrica','Si','D A',5,'Fija');
INSERT INTO localizacion VALUES ('26052.7','Marina Real Juan Carlos I',B2,'Segunda boya Marca Especial Dársena Exterior',"39º 27,604´N","000º 18.712´W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES FALSO;


INSERT INTO balizamiento VALUES ('26055','E-0199.92','Baliza Poste rojo con paneles cuadrangulares adosados','','DR',5,'L0.5 oc4.5');
INSERT INTO localizacion VALUES ('26055','Marina Real Juan Carlos I',41,'Espigón de cierre Extremo oeste Darsena Sur',"39º 27.599´N","00º 18.753' W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES FALSO;


INSERT INTO balizamiento VALUES ('26056','E-0199.93','Baliza Poste verde con paneles triangulares adosados','','DV',5,'L0.5 oc4.5');
INSERT INTO localizacion VALUES ('26056','Marina Real Juan Carlos I',42,'Angulo Oeste- Darsena Norte - Explanada',"39º 27.668´N","00º 18.755' W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES FALSO;


INSERT INTO balizamiento VALUES ('26055.5','E-0199.925','Baliza Poste rojo, verde, rojo con paneles triangulares adosados','No',4, 5,'L0.5 oc1 L0.5 oc3 L0.5 oc9');
INSERT INTO localizacion VALUES ('26055.5','Marina Real Juan Carlos I',43,'Dique - Extremo - Darsena Sur',"39º 27.615´N","00º 18.833' W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES FALSO;


INSERT INTO balizamiento VALUES ('26058','E-0199.94','Baliza Poste verde, rojo, verde con paneles triangulares adosados','No',4, 5,'L0.5 oc1 L0.5 oc3 L0.5 oc9');
INSERT INTO localizacion VALUES ('26058','Marina Real Juan Carlos I',44,'Espigón - Extremo - Darsena Auxiliar',"39º 27.677´N","00º 19.002' W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES FALSO;


INSERT INTO balizamiento VALUES ('26055.6','E-0199.926','Baliza Poste cilindrico rojo con paneles cuadrangulares adosados.','','GpD(2)R',7,'L0.5 oc1.5 L0.5 o4.');
INSERT INTO localizacion VALUES ('26055.6','Marina Real Juan Carlos I',45,'1ª Baliza a babor Canal de Acceso',"39º 27.634´N","00º 19.016' W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES FALSO;


INSERT INTO balizamiento VALUES ('26058.2','E-0199.96','Baliza Poste cilindrico verde.','','GpD(2)V',7,'L0.5 oc1.5 L0.5 o4.5');
INSERT INTO localizacion VALUES ('26058.2','Marina Real Juan Carlos I',46,'1ª Baliza a estribor Canal de Acceso',"39º 27.685´N","00º 19.328' W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES FALSO;


INSERT INTO balizamiento VALUES ('26058.4','E-0199.97','Baliza Poste cilíndrico rojo.','','GpD(3)R',9,'[(L0.5 oc1.5)x2]+ L0.5 o4.5');
INSERT INTO localizacion VALUES ('26058.4','Marina Real Juan Carlos I',47,'2ª Baliza a babor Darsena Auxiliar',"39º 27.642´N","00º 19.315' W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES FALSO;


INSERT INTO balizamiento VALUES ('26058.6','E-0199.98','Baliza Poste cilíndrico verde.','','GpD(3)V',9,'[(L0.5 oc1.5)x2]+ L0.5 o4.5');
INSERT INTO localizacion VALUES ('26058.6','Marina Real Juan Carlos I',48,'2ª Baliza a estribor Canal de acceso',"39º 27.617´N","00º 19.505' W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES FALSO;


INSERT INTO balizamiento VALUES ('26058.8','E-0199.99','Baliza Poste cilíndrico rojo.','No','GpD(4)R',11,'[(L0.5 oc1.5)x3]+ L0.5 o4.5');
INSERT INTO localizacion VALUES ('26058.8','Marina Real Juan Carlos I',49,'3ª Baliza a babor Darsena auxiliar',"39º 27.562´N","00º 19.466' W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES FALSO;


INSERT INTO balizamiento VALUES ('26060','','Boya Castillete amarillo Marca de tope un aspa amarilla','Sí','GpD(4)A',1,'borrada por error');
INSERT INTO localizacion VALUES ('26060','Marina Real Juan Carlos I',50,'Darsena interior, en el extremo de la rampa de varadero',"39º 27.669´N","00º 19.560' W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES ("26060",STR_TO_DATE("21/09/17","%d/%m/%y"),"Se da de baja, fallo de la linterna, ritmo inadecuado.");


INSERT INTO balizamiento VALUES ('26058.1','E-0199.945','Baliza Poste cilindrico amarillo con paneles triangulares adosados','','DA',5,'L0.5 o4.5');
INSERT INTO localizacion VALUES ('26058.1','Marina Real Juan Carlos I',51,'Angulo oeste - Darsena auxiliar',"39º 27.683´N","00º 19.112' W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES FALSO;


INSERT INTO balizamiento VALUES ('26048.2','','Boya Elastomero (Espuma polietileno cubierta de poliuretano)','RTU 31','RpB',0.5,'L0.25+  oc 0.25');
INSERT INTO localizacion VALUES ('26048.2','',100,'Darsena Norte',"39º 27.155´N","00º 18.042' W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES ("26048.2",STR_TO_DATE("18/11/2014","%d/%m/%Y"),"Anfer sincroniza la boya con la 26048.3"),("26048.2",STR_TO_DATE("31/03/2016","%d/%m/%Y"),"Se saca del agua para reparar la estructura y mantenimiento general."),("26048.2",STR_TO_DATE("01/06/2016","%d/%m/%Y"),"Se vuelve a fondear en su ubicación, se le ha instalado un cable en la barandilla, para evitar que se posen pájaros."),("26048.2",STR_TO_DATE("21/09/2017","%d/%m/%Y"),"Se sustituye una LDR por mal estado del encapsulado.");


INSERT INTO balizamiento VALUES ('26048.3','','Boya Elastomero (Espuma polietileno cubierta de poliuretano)','RTU 32','RpB',0.5,'L02.5 + oc 0.25');
INSERT INTO localizacion VALUES ('26048.3','',101,'Darsena Norte',"39º 27.104´N","00º 17.882' W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES ("26048.3",STR_TO_DATE("18/11/2014","%d/%m/%Y"),"Anfer sincroniza la boya con la 26048,2"),("26048.3",STR_TO_DATE("19/07/2016","%d/%m/%Y"),"Se saca la boya a tierra por mantenimiento general y pintura. "),("26048.3",STR_TO_DATE("11/10/2016","%d/%m/%Y"),"Anfer sustituye el transceptor y una LDR tras la revisión."),("26048.3",STR_TO_DATE("19/10/2016","%d/%m/%Y"),"Se sustituyen las dos baterías por unas nuevas."),("26048.3",STR_TO_DATE("24/10/2016","%d/%m/%Y"),"Se fondea de nuevo en su posición."),("26048.3",STR_TO_DATE("12/12/2016","%d/%m/%Y"),"Se sustituye una LDR."),("26048.3",STR_TO_DATE("06/06/2017","%d/%m/%Y"),"La boya se ha apagado. Se repara el regulador y queda en servicio."),("26048.3",STR_TO_DATE("16/06/2017","%d/%m/%Y"),"Hemos tenido que sustituir el regulador por otro. No permitia la carga de la Bat.");


INSERT INTO balizamiento VALUES ('26058.15','','SEMaFORO Panel metalico con el fondo negro.','','Luz fija (tres luces rojas superpuestas)',1,'Fija');
INSERT INTO localizacion VALUES ('26058.15','Semaforo a estribor - Puente móvil',102,'Marina Real Juan Carlos I',"39º 27,683´ N","000º 19.112´ W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES FALSO;


INSERT INTO balizamiento VALUES ('26058.16','','SEMÁFORO Panel metálico con el fondo negro.','','Luz fija (tres luces rojas superpuestas)',1,'Fija');
INSERT INTO localizacion VALUES ('26058.16','Semáforo a babor - Puente móvil',103,'Marina Real Juan Carlos I',"39º 27,638´ N","000º 19.112´ W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES FALSO;


INSERT INTO balizamiento VALUES ('26058.17','','SEMÁFORO Panel metálico con el fondo negro.','','Luz fija (tres luces rojas superpuestas)',1,'Fija');
INSERT INTO localizacion VALUES ('26058.17','Semáforo sobre el tablero del puente móvil',104,'Marina Real Juan Carlos I',"39º 27,666´ N","000º 19.133´ W");
INSERT INTO mantenimiento (nif,fecha,mantenimiento) VALUES FALSO;







#BALIZAMIENTO SAGUNTO
INSERT INTO balizamiento VALUES ('26285',"E-0210.75","baliza",5,'DV',5,'L0,5 oc 4,5');
INSERT INTO balizamiento VALUES ('26290',"E-0210.9","baliza",2,'CtV',1,'L0,25 oc 0,75');
INSERT INTO balizamiento VALUES ('26311',"E-0210.8","baliza",3,'GpCt(3)B',10,'[(L0,5 oc 0,75) x2] L0,25 oc 7,75');
INSERT INTO balizamiento VALUES ('26312',"E-0211","baliza",3,'DR',5,'L0,5 oc 4,5');
INSERT INTO balizamiento VALUES ('26313',"E-0210.75","boya",3,'GpD(4)A',11,'[(L0,5 oc 1,5) x3] L0,5 oc 4,5');
INSERT INTO balizamiento VALUES ('26314',"E-0212.1","baliza",3,'GpD(2)R',7,'L0,5 oc 1,5 L0,5 oc 4,5');
INSERT INTO balizamiento VALUES ('26320',"E-","boya",3,'GpD(4)V',11,'[(L0,5 oc 1,5) x3] L0,5 oc 4,5');
INSERT INTO balizamiento VALUES ('26325',"E-0212.2","baliza",3,'GpD(2+1)R',14.5,'L0,5 oc 1 L0,5 oc 3 L0,5 oc9');
INSERT INTO balizamiento VALUES ('26360',"E-0210.75","baliza",3,'DV',5,'L0,5 oc 4,5');
INSERT INTO balizamiento VALUES ('26380',"E-0214","baliza",3,'DR',5,'L0,5 oc 4,5');
INSERT INTO balizamiento VALUES ('26390',"E-0214.6","baliza",1,'GpD(2)V',7,'L0,5 oc 1,5 L0.5 oc 4,5');
INSERT INTO balizamiento VALUES ('26392',"E-0214.7","baliza",1,'GpD(2)R',7,'L0,5 oc 1,5 L0.5 oc 4,5');
INSERT INTO balizamiento VALUES ('26450',"E-0212.6","baliza",5,'GpCt(3)B',10,'[(L0,3 oc 0,8) x2] L0,3 oc7,5');
INSERT INTO balizamiento VALUES ('26270',"E-0210.75","baliza",3,'GpD(4)A',11,'[(L0,5 oc 1,5) x3] L0,5 oc4,5');
INSERT INTO balizamiento VALUES ('26326',"E-0210.75","baliza",1,'CtV',1,'L0,5 oc 0,5');

#LOCALIZACION SAGUNTO
INSERT INTO localizacion VALUES('26285',"Puerto de Sagunto",1,"Extremo dique de abrigo","39º 37.830' N","00º 12.321' W");
INSERT INTO localizacion VALUES('26290',"Puerto de Sagunto",2,"Martillo dique de abrigo","39º 38.035' N","00º 12.372' W");
INSERT INTO localizacion VALUES('26311',"Puerto de Sagunto",3,"Contradique. Angulo S","39º 37.754' N","00º 12.935' W");
INSERT INTO localizacion VALUES('26312',"Puerto de Sagunto",4,"Contradique. Angulo E","39º 38.001' N","00º 12.715' W");
INSERT INTO localizacion VALUES('26313',"Puerto de Sagunto",5,"Talud contradique","39º 38.060' N","00º 12.630' W");
INSERT INTO localizacion VALUES('26314',"Puerto de Sagunto",6,"Contradique (Extremo)","39º 38.264' N","00º 12.684' W");
INSERT INTO localizacion VALUES('26320',"Puerto de Sagunto",7,"Primera boya del canal principal","39º 38.590' N","00º 12.570' W");
INSERT INTO localizacion VALUES('26325',"Puerto de Sagunto",8,"Muelle sur. Extremo ampliacion","39º 38.569' N","00º 12.746' W");
INSERT INTO localizacion VALUES('26360',"Puerto de Sagunto",9,"Segunda boya del canal principal","39º 38.662' N","00º 12.690' W");
INSERT INTO localizacion VALUES('26380',"Puerto de Sagunto",10,"Muelle Surf (angulo)","39º 38.858' N","00º 12.820' W");
INSERT INTO localizacion VALUES('26390',"Puerto de Sagunto",11,"Darsena pesquera (Dique)","39º 39.134' N","00º 12.654' W");
INSERT INTO localizacion VALUES('26392',"Puerto de Sagunto",12,"Darsena pesquera (Contradique)","39º 39.152' N","00º 12.622' W");
INSERT INTO localizacion VALUES('26450',"Puerto de Sagunto",13,"Pantalan Sierra Menera","39º 38.803' N","00º 11.664' W");
INSERT INTO localizacion VALUES('26270',"Puerto de Sagunto - Union Fenosa",14,"Emisario submarino","39º 37.831' N","00º 13.528' W");
INSERT INTO localizacion VALUES('26326',"Puerto de Sagunto",15,"Muelle Norte 2","39º 38.562' N","00º 12.805' W");


#BALIZA 1 EN SAGUNTO
INSERT INTO mantenimiento VALUES ('26285',"2011/10/21","Sustitucion de la fotocelula y la tarjeta destelladora del litepipe derecho");
INSERT INTO mantenimiento VALUES ('26285',"2012/08/10","Sustitucion de la fotocelula y la tarjeta destelladora del litepipe derecho");
INSERT INTO mantenimiento VALUES ('26285',"2012/01/23","Linterna inferior, falla un cuarto de la piña de leds, en alineación Dique");
INSERT INTO mantenimiento VALUES ('26285',"2013/04/09","Sustitución 2 LDRs, telecontrol linternas.");
INSERT INTO mantenimiento VALUES ('26285',"2013/10/15","Sustituir baterias de los litepipes, 180Ah (2 de 12V) por 200Ah (6V+6V).");
INSERT INTO mantenimiento VALUES ('26285',"2014/03/06","Dejar fuera de servicio, Linterna Inferior");
INSERT INTO mantenimiento VALUES ('26285',"2014/03/21","Retirar Linterna Inferior.");
INSERT INTO mantenimiento VALUES ('26285',"2014/10/15","AIS, el identificador pasa a comenzar por 99, antes 00");
INSERT INTO mantenimiento VALUES ('26285',"2014/11/25","Lite-Pipes sincronizados con la Linterna.Toda la baliza se alimenta con 330Ah(6V+6V).Bateria de 200Ah (6V+6V) se queda de reserva");
INSERT INTO mantenimiento VALUES ('26285',"2015/09/09","Sustitucion LDR01");
INSERT INTO mantenimiento VALUES ('26285',"2016/12/27","Se repinta toda la torre.");
#BALIZA 2 EN SAGUNTO
INSERT INTO mantenimiento VALUES ('26290',"2005/04/12","Sustitucion destellador");
INSERT INTO mantenimiento VALUES ('26290',"2005/11/03","Sustitucion bateria");
INSERT INTO mantenimiento VALUES ('26290',"2007/08/30","Sustitucion optica");
INSERT INTO mantenimiento VALUES ('26290',"2009/11/27","Sustitucion bateria");
INSERT INTO mantenimiento VALUES ('26290',"2011/10/21","Sustitucion fotocelula");
INSERT INTO mantenimiento VALUES ('26290',"2012/08/08","Sustitucion optica");
INSERT INTO mantenimiento VALUES ('26290',"2013/04/10","Mejora de electrificación");
INSERT INTO mantenimiento VALUES ('26290',"2014/10/12","Sustitucion de LDR01");
INSERT INTO mantenimiento VALUES ('26290',"2015/09/04","Modificación según resolución");
INSERT INTO mantenimiento VALUES ('26290',"2015/09/18","Pintada");
INSERT INTO mantenimiento VALUES ('26290',"2016/04/26","Sustitucion bateria");
#BALIZA 3 EN SAGUNTO
INSERT INTO mantenimiento VALUES ('26311',"2009/11/17","Sustitucion optica");
INSERT INTO mantenimiento VALUES ('26311',"2011/08/23","Sustitucion cargador");
INSERT INTO mantenimiento VALUES ('26311',"2013/04/11","Mejora de electrificación");
INSERT INTO mantenimiento VALUES ('26311',"2015/09/04","Modificación según resolución");
INSERT INTO mantenimiento VALUES ('26311',"2015/09/14","Pintada");
INSERT INTO mantenimiento VALUES ('26311',"2015/10/22","Sustitucion LDR01");
INSERT INTO mantenimiento VALUES ('26311',"2016/05/04","Sustitucion bateria, por otra usada pero en mejor estado");
#BALIZA 4 EN SAGUNTO
INSERT INTO mantenimiento VALUES ('26312',"2006/09/25","Sustitucion destellador");
INSERT INTO mantenimiento VALUES ('26312',"2009/11/17","Sustitucion optica");
INSERT INTO mantenimiento VALUES ('26312',"2013/01/29","Sustitucion optica");
INSERT INTO mantenimiento VALUES ('26312',"2013/04/11","Mejora de electrificación");
INSERT INTO mantenimiento VALUES ('26312',"2014/01/28","Pintura nueva, con franja inferior 1/3 blanca.");
INSERT INTO mantenimiento VALUES ('26312',"2016/05/04","Sustitucion bateria de 90Ah, por otra usada de 100Ah pero en mejor estado");
INSERT INTO mantenimiento VALUES ('26312',"2017/05/24","Sustitucion LDR01");
#BALIZA 5 EN SAGUNTO
INSERT INTO mantenimiento VALUES ('26313',"2010/01/11","Sustitucion baterias");
INSERT INTO mantenimiento VALUES ('26313',"2010/11/03","Sustitucion optica");
INSERT INTO mantenimiento VALUES ('26313',"2012/12/11","Sustitucion baterias");
INSERT INTO mantenimiento VALUES ('26313',"2012/12/17","Sustitucion LDR baliza BDL");
INSERT INTO mantenimiento VALUES ('26313',"2013/01/09","Sustitucion LDR relecontrol");
INSERT INTO mantenimiento VALUES ('26313',"2014/01/30","Sustitucion regulador de carga, STECA SOLARIX PRS 2020");
INSERT INTO mantenimiento VALUES ('26313',"2014/02/05","Sustitucion lampara (BDL-120, al 25%, y DES-33)");
INSERT INTO mantenimiento VALUES ('26313',"2014/09/24","Falla LDR01 (por malas condiciones)");
INSERT INTO mantenimiento VALUES ('26313',"2014/11/26","Sustitucion LDR01");
INSERT INTO mantenimiento VALUES ('26313',"2015/06/18","Sustitucion boya por mobilis amarilla");
INSERT INTO mantenimiento VALUES ('26313',"2015/06/23","Sustitucion 8 PFV de 10w por 2 PFV de 95w");
INSERT INTO mantenimiento VALUES ('26313',"2015/08/06","Sustitucion Mobilis amarilla por Boya");
INSERT INTO mantenimiento VALUES ('26313',"2016/08/09","Sustitucion tren de fondeo, 28m, cadena galvanizada de 30mm");
INSERT INTO mantenimiento VALUES ('26313',"2017/12/14","Paneles FV muy sucios por gaviotas");
INSERT INTO mantenimiento VALUES ('26313',"2018/03/08","Sustitucion boya por Mobilis amarilla para mantenimiento");
INSERT INTO mantenimiento VALUES ('26313',"2018/04/12","Se repone antena GPS, fotocelula y óptica. Se pinta y se fondea de nuevo");
#BALIZA 6 EN SAGUNTO
INSERT INTO mantenimiento VALUES ('26314',"2006/02/07","Sustitucion baterias");
INSERT INTO mantenimiento VALUES ('26314',"2009/11/17","Sustitucion optica");
INSERT INTO mantenimiento VALUES ('26314',"2012/10/01","Sustitucion linterna provisional por caida de poste");
INSERT INTO mantenimiento VALUES ('26314',"2012/10/01","Sustitucion de la parte superior de la Baliza, por caida poste (LMV)");
INSERT INTO mantenimiento VALUES ('26314',"2013/01/11","Mejora de electrificación. Acometida no independiente");
INSERT INTO mantenimiento VALUES ('26314',"2013/05/09","Fuente Alimentacion sin control de temperatura y un solo modulo de 200w");
INSERT INTO mantenimiento VALUES ('26314',"2014/01/14","Sustitucion bateria");
INSERT INTO mantenimiento VALUES ('26314',"2014/01/21","Magneto termino de 10A saltado. Anular ventilador fuente alimentacion");
INSERT INTO mantenimiento VALUES ('26314',"2014/01/31","Reponer ventilador fuente de alimentacion");
INSERT INTO mantenimiento VALUES ('26314',"2014/03/12","Nivelar parte inferior de la baliza");
INSERT INTO mantenimiento VALUES ('26314',"2014/11/26","Sustitucion LDR01");
INSERT INTO mantenimiento VALUES ('26314',"2016/12/27","Pintura nueva, con franja inferior 1/3 blanca.");
INSERT INTO mantenimiento VALUES ('26314',"2018/08/03","Sustitucion LDR02 por deterioro");
#BALIZA 7 EN SAGUNTO
INSERT INTO mantenimiento VALUES ('26320',"2005/11/05","Sustitucion panel roto");
INSERT INTO mantenimiento VALUES ('26320',"2009/09/10","Sustitucion panel roto");
INSERT INTO mantenimiento VALUES ('26320',"2009/10/15","Sustitucion baterias");
INSERT INTO mantenimiento VALUES ('26320',"2013/05/10","Entrada de agua en la caja Himel exterior. Detector de intrusion corroido y tapa de baterias en mal estado");
INSERT INTO mantenimiento VALUES ('26320',"2013/12/16","Se resetea por fallo de GPS y se anula detector de intrusion");
INSERT INTO mantenimiento VALUES ('26320',"2014/01/30","Se sustituye por la mobilis. En tierra se sustituyen baterias, optica y regulador de FV");
INSERT INTO mantenimiento VALUES ('26320',"2014/03/13","Vuelve al agua");
INSERT INTO mantenimiento VALUES ('26320',"2014/09/24","Falla LDR02, pendiente de sustitucion (por malas condiciones)");
INSERT INTO mantenimiento VALUES ('26320',"2014/11/26","Sustitucion LDR02");
INSERT INTO mantenimiento VALUES ('26320',"2015/09/04","Modificación según resolución");
INSERT INTO mantenimiento VALUES ('26320',"2017/09/14","Optica en mal estado, pendiente de cambio");
#BALIZA 8 EN SAGUNTO
INSERT INTO mantenimiento VALUES ('26325',"2010/01/08","Sustitucion baterias");
INSERT INTO mantenimiento VALUES ('26325',"2010/02/16","Sustitucion baterias");
INSERT INTO mantenimiento VALUES ('26325',"2012/04/02","Sustitucion cierres de baliza");
INSERT INTO mantenimiento VALUES ('26325',"2015/02/04","Sustitucion LDR02");
INSERT INTO mantenimiento VALUES ('26325',"2015/09/16","Pintada");
INSERT INTO mantenimiento VALUES ('26325',"2016/05/04","Sustitucion bateria, por otra usada pero en mejor estado");
INSERT INTO mantenimiento VALUES ('26325',"2017/04/11","Sustitucion LDR01");
INSERT INTO mantenimiento VALUES ('26325',"2017/07/13","Se repara acometida electrica por un fallo de conexion");
#BALIZA 9 EN SAGUNTO
INSERT INTO mantenimiento VALUES ('26360',"2012/04/17","Sustitucion optica");
INSERT INTO mantenimiento VALUES ('26360',"2013/01/09","Sustitucion baterias");
INSERT INTO mantenimiento VALUES ('26360',"2013/02/05","Anular telecontrol. Alimentacion exterior linterna (Baja 04/02 y Alta 05/02)");
INSERT INTO mantenimiento VALUES ('26360',"2013/03/06","Sustitucion por la mobilis para su revisión en tierra");
INSERT INTO mantenimiento VALUES ('26360',"2013/03/21","Sustitucion regulador BP 20A por STECA 20A");
INSERT INTO mantenimiento VALUES ('26360',"2013/03/22","Segun test solicitado, no funciona como autonoma");
INSERT INTO mantenimiento VALUES ('26360',"2013/05/10","Puesta otra vez en el agua");
INSERT INTO mantenimiento VALUES ('26360',"2014/06/19","Colisionada por un pesuqero");
INSERT INTO mantenimiento VALUES ('26360',"2014/06/20","Sustitucion por Mobilis. Se repara estructuralmente, se pinta y se sustituye un PFV atersa A-38w");
INSERT INTO mantenimiento VALUES ('26360',"2014/07/15","Vuelve al agua.");
INSERT INTO mantenimiento VALUES ('26360',"2015/09/04","Modificación según resolución");
INSERT INTO mantenimiento VALUES ('26360',"2016/08/08","Sustitucion tren fondeo");
INSERT INTO mantenimiento VALUES ('26360',"2016/12/01","Por la noche permanece apagada. Se revisa y se deja en servicio");
INSERT INTO mantenimiento VALUES ('26360',"2016/12/05","Se ha vuelto a apagar por bateria baja. Se da de baja");
INSERT INTO mantenimiento VALUES ('26360',"2016/12/07","Se recupera la bateria y se da de alta.");
INSERT INTO mantenimiento VALUES ('26360',"2016/12/20","Se apaga de matrugada y se recupera a las 18h (baja y alta mismo dia)");
INSERT INTO mantenimiento VALUES ('26360',"2017/09/14","Panel FV averiado. Pendiente de sustitución");
INSERT INTO mantenimiento VALUES ('26360',"2018/08/18","Se da de baja porque permanece apagada");
INSERT INTO mantenimiento VALUES ('26360',"2018/08/20","Sustitucion baterias y regulador. Se da de alta");
INSERT INTO mantenimiento VALUES ('26360',"2018/09/08","Se da de baja porque sigue apagandose. Preparamos sustituta.");
INSERT INTO mantenimiento VALUES ('26360',"2018/09/13","Se sustituye por boya Mobilis para su reparacion y revision. Alta.");

#OBSERVACIONES SAGUNTO
INSERT INTO observaciones VALUES ('26285',"LDRs A 180º.");
INSERT INTO observaciones VALUES ('26290',"LDRs A 180º.");
INSERT INTO observaciones VALUES ('26311',"LDRs A 180º.");
INSERT INTO observaciones VALUES ('26312',"LDRs A 180º.");
INSERT INTO observaciones VALUES ('26313',"LDRs A 180º.");
INSERT INTO observaciones VALUES ('26314',"LDRs A 180º.");
INSERT INTO observaciones VALUES ('26320',"LDRs A 180º.");
INSERT INTO observaciones VALUES ('26325',"LDRs A 0º.");
INSERT INTO observaciones VALUES ('26360',"LDRs A 180º.");
INSERT INTO observaciones VALUES ('26380',"LDRs A 180º.");
INSERT INTO observaciones VALUES ('26390',"LDRs A 0º.");
INSERT INTO observaciones VALUES ('26392',"LDRs A 0º.");
INSERT INTO observaciones VALUES ('26450',"LDRs A 180º.");
INSERT INTO observaciones VALUES ('26270',"");
INSERT INTO observaciones VALUES ('26326',"LDRs A 0º.");



