#SHOW FULL TABLES FROM san;
#drop table localizacion;
#drop table mantenimiento;
#drop table observaciones;
#drop table balizamiento;


CREATE TABLE balizamiento (
  nif numeric(5,0) NOT NULL,
  num_internacional varchar(12),
  tipo ENUM('boya','baliza','faro'),
  alcance INTEGER,
  apariencia varchar(50),
  periodo numeric(5,2) ,
  caracteristica varchar(50) NOT NULL,
  PRIMARY KEY (nif)
) engine=innodb DEFAULT CHARSET=latin1 COMMENT='tabla de balizas';


CREATE TABLE localizacion(
    nif numeric(5,0) NOT NULL,
    puerto VARCHAR(30),
    num_local numeric(5,0),
    localizacion VARCHAR(50),
    latitud VARCHAR(15),
    longitud VARCHAR(15),
    PRIMARY KEY (nif),
    CONSTRAINT localizacion_FK FOREIGN KEY (nif) REFERENCES balizamiento (nif)
) engine=innodb DEFAULT CHARSET=latin1 COMMENT='tabla de localizacion del balizamiento';

# "sagunto",1, 

CREATE TABLE mantenimiento(
    nif numeric(5,0) NOT NULL,
    fecha date,
    mantenimiento varchar(250),
    PRIMARY KEY (nif,fecha,mantenimiento),
    CONSTRAINT mantenimiento_FK FOREIGN KEY (nif) REFERENCES balizamiento (nif)
)engine=innodb DEFAULT CHARSET=latin1 COMMENT='tabla de mantenimiento del balizamiento';


CREATE TABLE observaciones(
    nif numeric(5,0) NOT NULL,
    observaciones varchar(250) NOT NULL,
    PRIMARY KEY (nif,observaciones),
    CONSTRAINT observaciones_FK FOREIGN KEY (nif) REFERENCES balizamiento (nif)
)engine=innodb DEFAULT CHARSET=latin1 COMMENT='tabla de observaciones del balizamiento';



INSERT INTO balizamiento VALUES (26285,"E-0210.75","baliza",5,'DV',5,'L0,5 oc 4,5');
INSERT INTO balizamiento VALUES (26290,"E-0210.9","baliza",2,'CtV',1,'L0,25 oc 0,75');
INSERT INTO balizamiento VALUES (26311,"E-0210.8","baliza",3,'GpCt(3)B',10,'[(L0,5 oc 0,75) x2] L0,25 oc 7,75');
INSERT INTO balizamiento VALUES (26312,"E-0211","baliza",3,'DR',5,'L0,5 oc 4,5');
INSERT INTO balizamiento VALUES (26313,"E-0210.75","boya",3,'GpD(4)A',11,'[(L0,5 oc 1,5) x3] L0,5 oc 4,5');
INSERT INTO balizamiento VALUES (26314,"E-0212.1","baliza",3,'GpD(2)R',7,'L0,5 oc 1,5 L0,5 oc 4,5');
INSERT INTO balizamiento VALUES (26320,"E-","boya",3,'GpD(4)V',11,'[(L0,5 oc 1,5) x3] L0,5 oc 4,5');
INSERT INTO balizamiento VALUES (26325,"E-0212.2","baliza",3,'GpD(2+1)R',14.5,'L0,5 oc 1 L0,5 oc 3 L0,5 oc9');
INSERT INTO balizamiento VALUES (26360,"E-0210.75","baliza",3,'DV',5,'L0,5 oc 4,5');
INSERT INTO balizamiento VALUES (26380,"E-0214","baliza",3,'DR',5,'L0,5 oc 4,5');
INSERT INTO balizamiento VALUES (26390,"E-0214.6","baliza",1,'GpD(2)V',7,'L0,5 oc 1,5 L0.5 oc 4,5');
INSERT INTO balizamiento VALUES (26392,"E-0214.7","baliza",1,'GpD(2)R',7,'L0,5 oc 1,5 L0.5 oc 4,5');
INSERT INTO balizamiento VALUES (26450,"E-0212.6","baliza",5,'GpCt(3)B',10,'[(L0,3 oc 0,8) x2] L0,3 oc7,5');
INSERT INTO balizamiento VALUES (26270,"E-0210.75","baliza",3,'GpD(4)A',11,'[(L0,5 oc 1,5) x3] L0,5 oc4,5');
INSERT INTO balizamiento VALUES (26326,"E-0210.75","baliza",1,'CtV',1,'L0,5 oc 0,5');

#BALIZA 1 EN SAGUNTO
INSERT INTO mantenimiento VALUES (26285,"2011/10/21","Sustitucion de la fotocelula y la tarjeta destelladora del litepipe derecho");
INSERT INTO mantenimiento VALUES (26285,"2012/08/10","Sustitucion de la fotocelula y la tarjeta destelladora del litepipe derecho");
INSERT INTO mantenimiento VALUES (26285,"2012/01/23","Linterna inferior, falla un cuarto de la piña de leds, en alineación Dique");
INSERT INTO mantenimiento VALUES (26285,"2013/04/09","Sustitución 2 LDRs, telecontrol linternas.");
INSERT INTO mantenimiento VALUES (26285,"2013/10/15","Sustituir baterias de los litepipes, 180Ah (2 de 12V) por 200Ah (6V+6V).");
INSERT INTO mantenimiento VALUES (26285,"2014/03/06","Dejar fuera de servicio, Linterna Inferior");
INSERT INTO mantenimiento VALUES (26285,"2014/03/21","Retirar Linterna Inferior.");
INSERT INTO mantenimiento VALUES (26285,"2014/10/15","AIS, el identificador pasa a comenzar por 99, antes 00");
INSERT INTO mantenimiento VALUES (26285,"2014/11/25,"Lite-Pipes sincronizados con la Linterna.Toda la baliza se alimenta con 330Ah(6V+6V).Bateria de 200Ah (6V+6V) se queda de reserva");
INSERT INTO mantenimiento VALUES (26285,"2015/09/09","Sustitucion LDR01");
INSERT INTO mantenimiento VALUES (26285,"2016/12/27","Se repinta toda la torre.");
#BALIZA 2 EN SAGUNTO
INSERT INTO mantenimiento VALUES (26290,"2005/04/12","Sustitucion destellador");
INSERT INTO mantenimiento VALUES (26290,"2005/11/03","Sustitucion bateria");
INSERT INTO mantenimiento VALUES (26290,"2007/08/30","Sustitucion optica");
INSERT INTO mantenimiento VALUES (26290,"2009/11/27","Sustitucion bateria");
INSERT INTO mantenimiento VALUES (26290,"2011/10/21","Sustitucion fotocelula");
INSERT INTO mantenimiento VALUES (26290,"2012/08/08","Sustitucion optica");
INSERT INTO mantenimiento VALUES (26290,"2013/04/10","Mejora de electrificación");
INSERT INTO mantenimiento VALUES (26290,"2014/10/123,"Sustitucion de LDR01");
INSERT INTO mantenimiento VALUES (26290,"2015/09/04","Modificación según resolución");
INSERT INTO mantenimiento VALUES (26290,"2015/09/18","Pintada");
INSERT INTO mantenimiento VALUES (26290,"2016/04/26","Sustitucion bateria");
#BALIZA 3 EN SAGUNTO
INSERT INTO mantenimiento VALUES (26311,"2009/11/17","Sustitucion optica");
INSERT INTO mantenimiento VALUES (26311,"2011/08/23","Sustitucion cargador");
INSERT INTO mantenimiento VALUES (26311,"2013/04/11","Mejora de electrificación");
INSERT INTO mantenimiento VALUES (26311,"2015/09/04","Modificación según resolución");
INSERT INTO mantenimiento VALUES (26311,"2015/09/14","Pintada");
INSERT INTO mantenimiento VALUES (26311,"2015/10/22","Sustitucion LDR01");
INSERT INTO mantenimiento VALUES (26311,"2016/05/04","Sustitucion bateria, por otra usada pero en mejor estado");
#BALIZA 4 EN SAGUNTO
INSERT INTO mantenimiento VALUES (26312,"2006/09/25","Sustitucion destellador");
INSERT INTO mantenimiento VALUES (26312,"2009/11/17","Sustitucion optica");
INSERT INTO mantenimiento VALUES (26312,"2013/01/29","Sustitucion optica");
INSERT INTO mantenimiento VALUES (26312,"2013/04/11","Mejora de electrificación");
INSERT INTO mantenimiento VALUES (26312,"2014/01/28","Pintura nueva, con franja inferior 1/3 blanca.");
INSERT INTO mantenimiento VALUES (26312,"2016/05/04","Sustitucion bateria de 90Ah, por otra usada de 100Ah pero en mejor estado");
INSERT INTO mantenimiento VALUES (26312,"2017/05/24","Sustitucion LDR01");
#BALIZA 5 EN SAGUNTO
INSERT INTO mantenimiento VALUES (26313,"2010/01/11","Sustitucion baterias");
INSERT INTO mantenimiento VALUES (26313,"2010/11/03","Sustitucion optica");
INSERT INTO mantenimiento VALUES (26313,"2012/12/11","Sustitucion baterias");
INSERT INTO mantenimiento VALUES (26313,"2012/12/17","Sustitucion LDR baliza BDL");
INSERT INTO mantenimiento VALUES (26313,"2013/01/09","Sustitucion LDR relecontrol");
INSERT INTO mantenimiento VALUES (26313,"2014/01/30","Sustitucion regulador de carga, STECA SOLARIX PRS 2020");
INSERT INTO mantenimiento VALUES (26313,"2014/02/05","Sustitucion lampara (BDL-120, al 25%, y DES-33)");
INSERT INTO mantenimiento VALUES (26313,"2014/09/24","Falla LDR01 (por malas condiciones)");
INSERT INTO mantenimiento VALUES (26313,"2014/11/26","Sustitucion LDR01");
INSERT INTO mantenimiento VALUES (26313,"2015/06/18","Sustitucion boya por mobilis amarilla");
INSERT INTO mantenimiento VALUES (26313,"2015/06/23","Sustitucion 8 PFV de 10W por 2 PFV de 95W");
INSERT INTO mantenimiento VALUES (26313,"2015/08/06","Sustitucion Mobilis amarilla por Boya");
INSERT INTO mantenimiento VALUES (26313,"2016/08/09","Sustitucion tren de fondeo, 28m, cadena galvanizada de 30mm");
INSERT INTO mantenimiento VALUES (26313,"2017/12/14","Paneles FV muy sucios por gaviotas");
INSERT INTO mantenimiento VALUES (26313,"2018/03/08","Sustitucion boya por Mobilis amarilla para mantenimiento");
INSERT INTO mantenimiento VALUES (26313,"2018/04/12","Se repone antena GPS, fotocelula y óptica. Se pinta y se fondea de nuevo");
#BALIZA 6 EN SAGUNTO
INSERT INTO mantenimiento VALUES (26314,"2014/11/26","Sustitucion LDR01");
INSERT INTO mantenimiento VALUES (26314,"2014/11/26","Sustitucion LDR01");
INSERT INTO mantenimiento VALUES (26314,"2014/11/26","Sustitucion LDR01");
INSERT INTO mantenimiento VALUES (26314,"2014/11/26","Sustitucion LDR01");
INSERT INTO mantenimiento VALUES (26314,"2014/11/26","Sustitucion LDR01");
INSERT INTO mantenimiento VALUES (26314,"2014/11/26","Sustitucion LDR01");
INSERT INTO mantenimiento VALUES (26314,"2014/11/26","Sustitucion LDR01");
INSERT INTO mantenimiento VALUES (26314,"2014/11/26","Sustitucion LDR01");
INSERT INTO mantenimiento VALUES (26314,"2014/11/26","Sustitucion LDR01");
INSERT INTO mantenimiento VALUES (26314,"2014/11/26","Sustitucion LDR01");
INSERT INTO mantenimiento VALUES (26314,"2014/11/26","Sustitucion LDR01");
INSERT INTO mantenimiento VALUES (26314,"2014/11/26","Sustitucion LDR01");
INSERT INTO mantenimiento VALUES (26314,"2014/11/26","Sustitucion LDR01");







INSERT INTO observaciones VALUES (26285,"LDRs A 180º.");
INSERT INTO observaciones VALUES (26290,"LDRs A 180º.");
INSERT INTO observaciones VALUES (26311,"LDRs A 180º.");
INSERT INTO observaciones VALUES (26312,"LDRs A 180º.");
INSERT INTO observaciones VALUES (26313,"LDRs A 180º.");
INSERT INTO observaciones VALUES (26314,"LDRs A 180º.");
INSERT INTO observaciones VALUES (26320,"LDRs A 180º.");
INSERT INTO observaciones VALUES (26325,"LDRs A 0º.");
INSERT INTO observaciones VALUES (26360,"LDRs A 180º.");
INSERT INTO observaciones VALUES (26380,"LDRs A 180º.");
INSERT INTO observaciones VALUES (26390,"LDRs A 0º.");
INSERT INTO observaciones VALUES (26392,"LDRs A 0º.");
INSERT INTO observaciones VALUES (26450,"LDRs A 180º.");
INSERT INTO observaciones VALUES (26270,"");
INSERT INTO observaciones VALUES (26326,"LDRs A 0º.");


INSERT INTO localizacion VALUES(26285,"Puerto de Sagunto",1,"Extremo dique de abrigo","39º 37.830' N","00º 12.321' W");
INSERT INTO localizacion VALUES(26290,"Puerto de Sagunto",2,"Martillo dique de abrigo","39º 38.035' N","00º 12.372' W");
INSERT INTO localizacion VALUES(26311,"Puerto de Sagunto",3,"Contradique. Angulo S","39º 37.754' N","00º 12.935' W");
INSERT INTO localizacion VALUES(26312,"Puerto de Sagunto",4,"Contradique. Angulo E","39º 38.001' N","00º 12.715' W");
INSERT INTO localizacion VALUES(26313,"Puerto de Sagunto",5,"Talud contradique","39º 38.060' N","00º 12.630' W");
INSERT INTO localizacion VALUES(26314,"Puerto de Sagunto",6,"Contradique (Extremo)","39º 38.264' N","00º 12.684' W");
INSERT INTO localizacion VALUES(26320,"Puerto de Sagunto",7,"Primera boya del canal principal","39º 38.590' N","00º 12.570' W");
INSERT INTO localizacion VALUES(26325,"Puerto de Sagunto",8,"Muelle sur. Extremo ampliacion","39º 38.569' N","00º 12.746' W");
INSERT INTO localizacion VALUES(26360,"Puerto de Sagunto",9,"Segunda boya del canal principal","39º 38.662' N","00º 12.690' W");
INSERT INTO localizacion VALUES(26380,"Puerto de Sagunto",10,"Muelle Surf (angulo)","39º 38.858' N","00º 12.820' W");
INSERT INTO localizacion VALUES(26390,"Puerto de Sagunto",11,"Darsena pesquera (Dique)","39º 39.134' N","00º 12.654' W");
INSERT INTO localizacion VALUES(26392,"Puerto de Sagunto",12,"Darsena pesquera (Contradique)","39º 39.152' N","00º 12.622' W");
INSERT INTO localizacion VALUES(26450,"Puerto de Sagunto",13,"Pantalan Sierra Menera","39º 38.803' N","00º 11.664' W");
INSERT INTO localizacion VALUES(26270,"Puerto de Sagunto - Union Fenosa",14,"Emisario submarino","39º 37.831' N","00º 13.528' W");
INSERT INTO localizacion VALUES(26326,"Puerto de Sagunto",15,"Muelle Norte 2","39º 38.562' N","00º 12.805' W");




