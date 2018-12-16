#SHOW FULL TABLES FROM san;
#drop table localizacion;
#drop table mantenimiento;
#drop table observaciones;
#drop table balizamiento;


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
    localizacion VARCHAR(50),
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





#BALIZAMIENTO SAGUNTO
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

#BALIZAMIENTO VALENCIA   NIF NUM_INTERNACIONAL, TIPO, TELECONTROL, APARIENCIA, PERIODO, CARACTERISTICAS
INSERT INTO balizamiento VALUES (25720,"E-0200.4","Baliza lateral Estribor","RTU 06",'DV',5,'L1 oc 4');
INSERT INTO balizamiento VALUES (25740,"E-","Boya castillete roja y marca de tope babor","RTU 01",'DV',5,'L0.5 oc 4.5');
INSERT INTO balizamiento VALUES (25721,"E-0200.5","Baliza poliester reforzado fibra vidrio. Lateral Estribor","RTU 017",'DV',5,'L1 oc 4');
INSERT INTO balizamiento VALUES (25774,"E-201.11","Baliza cilindrica roja, base blanca","RTU 10",'GpD (2) R',7,'L0.5 oc 1.5 L0.5 oc 4.5');
INSERT INTO balizamiento VALUES (25761,"E-","Boya castillete amarilla y marca de tope","RTU 04",'GpD (4) A',11,'[(L0.5 oc 1.5)x3] L0.5 oc 4.5');
INSERT INTO balizamiento VALUES (25765,"E-","Boya castillete amarilla y marca de tope","RTU 02",'GpD (4) A',11,'[(L0.5 oc 1.5)x3] L0.5 oc 4.5');
INSERT INTO balizamiento VALUES (25776,"E-201.25","Baliza poliester reforzado con fibra vidrio","RTU 50",'GpD(3) R',9,'[(L0.5 oc 1.5)x2]L0.5 oc 4.5');
INSERT INTO balizamiento VALUES (25777,"E-201.16","Baliza poliester reforzado con fibra vidrio","RTU 51",'GpD(3) R',9,'[(L0.5 oc 1.5)x2]L0.5 oc 4.5');
INSERT INTO balizamiento VALUES (25800,"E-201.2","Baliza poliester reforzado con fibra vidrio","RTU 16",'DR',3,'L0.5 oc 2.5');
INSERT INTO balizamiento VALUES (25768,"E-","Boya catillete verde-roja-verde y marca de tope","NO",'GpD(2+1) V',9,'L0.5 oc 1 L0.5 oc 3 L0.5 oc 9');
INSERT INTO balizamiento VALUES (25820,"E-0201.4","Baliza poliester reforzado fibra vidrio. Lateral Estribor","RTU 52",'GpD(2) V',7,'L0.5 oc 1.05 L0.5 oc 4.5');
INSERT INTO balizamiento VALUES (25820.1,"E-","Boya catillete verde y marca de tope","RTU 53",'GpD(2) V',7,'LL0.5 oc 1.05 L0.5 oc 4.5');
INSERT INTO balizamiento VALUES (25850,"E-","Boya catillete verde-roja-verde y marca de tope","NO",'GpD(2+1) V',9,'L0.5 oc 1 L0.5 oc 3 L0.5 oc 9');
INSERT INTO balizamiento VALUES (25768,"E-","Boya catillete verde-roja-verde y marca de tope","NO",'GpD(2+1) V',9,'L0.5 oc 1 L0.5 oc 3 L0.5 oc 9');
INSERT INTO balizamiento VALUES (25768,"E-","Boya catillete verde-roja-verde y marca de tope","NO",'GpD(2+1) V',9,'L0.5 oc 1 L0.5 oc 3 L0.5 oc 9');                                 
INSERT INTO balizamiento VALUES (25768,"E-","Boya catillete verde-roja-verde y marca de tope","NO",'GpD(2+1) V',9,'L0.5 oc 1 L0.5 oc 3 L0.5 oc 9');
INSERT INTO balizamiento VALUES (25768,"E-","Boya catillete verde-roja-verde y marca de tope","NO",'GpD(2+1) V',9,'L0.5 oc 1 L0.5 oc 3 L0.5 oc 9');
INSERT INTO balizamiento VALUES (25768,"E-","Boya catillete verde-roja-verde y marca de tope","NO",'GpD(2+1) V',9,'L0.5 oc 1 L0.5 oc 3 L0.5 oc 9');                                 
INSERT INTO balizamiento VALUES (25768,"E-","Boya catillete verde-roja-verde y marca de tope","NO",'GpD(2+1) V',9,'L0.5 oc 1 L0.5 oc 3 L0.5 oc 9');
INSERT INTO balizamiento VALUES (25768,"E-","Boya catillete verde-roja-verde y marca de tope","NO",'GpD(2+1) V',9,'L0.5 oc 1 L0.5 oc 3 L0.5 oc 9');
INSERT INTO balizamiento VALUES (25768,"E-","Boya catillete verde-roja-verde y marca de tope","NO",'GpD(2+1) V',9,'L0.5 oc 1 L0.5 oc 3 L0.5 oc 9');                                 
INSERT INTO balizamiento VALUES (25768,"E-","Boya catillete verde-roja-verde y marca de tope","NO",'GpD(2+1) V',9,'L0.5 oc 1 L0.5 oc 3 L0.5 oc 9');
INSERT INTO balizamiento VALUES (25768,"E-","Boya catillete verde-roja-verde y marca de tope","NO",'GpD(2+1) V',9,'L0.5 oc 1 L0.5 oc 3 L0.5 oc 9');
INSERT INTO balizamiento VALUES (25768,"E-","Boya catillete verde-roja-verde y marca de tope","NO",'GpD(2+1) V',9,'L0.5 oc 1 L0.5 oc 3 L0.5 oc 9');
INSERT INTO balizamiento VALUES (25768,"E-","Boya catillete verde-roja-verde y marca de tope","NO",'GpD(2+1) V',9,'L0.5 oc 1 L0.5 oc 3 L0.5 oc 9');
INSERT INTO balizamiento VALUES (25768,"E-","Boya catillete verde-roja-verde y marca de tope","NO",'GpD(2+1) V',9,'L0.5 oc 1 L0.5 oc 3 L0.5 oc 9');
INSERT INTO balizamiento VALUES (25768,"E-","Boya catillete verde-roja-verde y marca de tope","NO",'GpD(2+1) V',9,'L0.5 oc 1 L0.5 oc 3 L0.5 oc 9');
INSERT INTO balizamiento VALUES (25768,"E-","Boya catillete verde-roja-verde y marca de tope","NO",'GpD(2+1) V',9,'L0.5 oc 1 L0.5 oc 3 L0.5 oc 9');
INSERT INTO balizamiento VALUES (25768,"E-","Boya catillete verde-roja-verde y marca de tope","NO",'GpD(2+1) V',9,'L0.5 oc 1 L0.5 oc 3 L0.5 oc 9');
INSERT INTO balizamiento VALUES (25768,"E-","Boya catillete verde-roja-verde y marca de tope","NO",'GpD(2+1) V',9,'L0.5 oc 1 L0.5 oc 3 L0.5 oc 9');
INSERT INTO balizamiento VALUES (25768,"E-","Boya catillete verde-roja-verde y marca de tope","NO",'GpD(2+1) V',9,'L0.5 oc 1 L0.5 oc 3 L0.5 oc 9');
INSERT INTO balizamiento VALUES (25768,"E-","Boya catillete verde-roja-verde y marca de tope","NO",'GpD(2+1) V',9,'L0.5 oc 1 L0.5 oc 3 L0.5 oc 9');                                 
INSERT INTO balizamiento VALUES (25768,"E-","Boya catillete verde-roja-verde y marca de tope","NO",'GpD(2+1) V',9,'L0.5 oc 1 L0.5 oc 3 L0.5 oc 9');
INSERT INTO balizamiento VALUES (25768,"E-","Boya catillete verde-roja-verde y marca de tope","NO",'GpD(2+1) V',9,'L0.5 oc 1 L0.5 oc 3 L0.5 oc 9');
INSERT INTO balizamiento VALUES (25768,"E-","Boya catillete verde-roja-verde y marca de tope","NO",'GpD(2+1) V',9,'L0.5 oc 1 L0.5 oc 3 L0.5 oc 9');                                 
INSERT INTO balizamiento VALUES (25768,"E-","Boya catillete verde-roja-verde y marca de tope","NO",'GpD(2+1) V',9,'L0.5 oc 1 L0.5 oc 3 L0.5 oc 9');
INSERT INTO balizamiento VALUES (25768,"E-","Boya catillete verde-roja-verde y marca de tope","NO",'GpD(2+1) V',9,'L0.5 oc 1 L0.5 oc 3 L0.5 oc 9');
INSERT INTO balizamiento VALUES (25768,"E-","Boya catillete verde-roja-verde y marca de tope","NO",'GpD(2+1) V',9,'L0.5 oc 1 L0.5 oc 3 L0.5 oc 9');                                 
INSERT INTO balizamiento VALUES (25768,"E-","Boya catillete verde-roja-verde y marca de tope","NO",'GpD(2+1) V',9,'L0.5 oc 1 L0.5 oc 3 L0.5 oc 9');
INSERT INTO balizamiento VALUES (25768,"E-","Boya catillete verde-roja-verde y marca de tope","NO",'GpD(2+1) V',9,'L0.5 oc 1 L0.5 oc 3 L0.5 oc 9');
INSERT INTO balizamiento VALUES (25768,"E-","Boya catillete verde-roja-verde y marca de tope","NO",'GpD(2+1) V',9,'L0.5 oc 1 L0.5 oc 3 L0.5 oc 9');
INSERT INTO balizamiento VALUES (25768,"E-","Boya catillete verde-roja-verde y marca de tope","NO",'GpD(2+1) V',9,'L0.5 oc 1 L0.5 oc 3 L0.5 oc 9');
INSERT INTO balizamiento VALUES (25768,"E-","Boya catillete verde-roja-verde y marca de tope","NO",'GpD(2+1) V',9,'L0.5 oc 1 L0.5 oc 3 L0.5 oc 9');
INSERT INTO balizamiento VALUES (25768,"E-","Boya catillete verde-roja-verde y marca de tope","NO",'GpD(2+1) V',9,'L0.5 oc 1 L0.5 oc 3 L0.5 oc 9');


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
INSERT INTO mantenimiento VALUES (26313,"2015/06/23","Sustitucion 8 PFV de 10w por 2 PFV de 95w");
INSERT INTO mantenimiento VALUES (26313,"2015/08/06","Sustitucion Mobilis amarilla por Boya");
INSERT INTO mantenimiento VALUES (26313,"2016/08/09","Sustitucion tren de fondeo, 28m, cadena galvanizada de 30mm");
INSERT INTO mantenimiento VALUES (26313,"2017/12/14","Paneles FV muy sucios por gaviotas");
INSERT INTO mantenimiento VALUES (26313,"2018/03/08","Sustitucion boya por Mobilis amarilla para mantenimiento");
INSERT INTO mantenimiento VALUES (26313,"2018/04/12","Se repone antena GPS, fotocelula y óptica. Se pinta y se fondea de nuevo");
#BALIZA 6 EN SAGUNTO
INSERT INTO mantenimiento VALUES (26314,"2006/02/07","Sustitucion baterias");
INSERT INTO mantenimiento VALUES (26314,"2009/11/17","Sustitucion optica");
INSERT INTO mantenimiento VALUES (26314,"2012/10/01","Sustitucion linterna provisional por caida de poste");
INSERT INTO mantenimiento VALUES (26314,"2012/10/01","Sustitucion de la parte superior de la Baliza, por caida poste (LMV)");
INSERT INTO mantenimiento VALUES (26314,"2013/01/11","Mejora de electrificación. Acometida no independiente");
INSERT INTO mantenimiento VALUES (26314,"2013/05/09","Fuente Alimentacion sin control de temperatura y un solo modulo de 200w");
INSERT INTO mantenimiento VALUES (26314,"2014/01/14","Sustitucion bateria");
INSERT INTO mantenimiento VALUES (26314,"2014/01/21","Magneto termino de 10A saltado. Anular ventilador fuente alimentacion");
INSERT INTO mantenimiento VALUES (26314,"2014/01/31","Reponer ventilador fuente de alimentacion");
INSERT INTO mantenimiento VALUES (26314,"2014/03/12","Nivelar parte inferior de la baliza");
INSERT INTO mantenimiento VALUES (26314,"2014/11/26","Sustitucion LDR01");
INSERT INTO mantenimiento VALUES (26314,"2016/12/27","Pintura nueva, con franja inferior 1/3 blanca.");
INSERT INTO mantenimiento VALUES (26314,"2018/08/03","Sustitucion LDR02 por deterioro");
#BALIZA 7 EN SAGUNTO
INSERT INTO mantenimiento VALUES (26320,"2005/11/05","Sustitucion panel roto");
INSERT INTO mantenimiento VALUES (26320,"2009/09/10","Sustitucion panel roto");
INSERT INTO mantenimiento VALUES (26320,"2009/10/15","Sustitucion baterias");
INSERT INTO mantenimiento VALUES (26320,"2013/05/10","Entrada de agua en la caja Himel exterior. Detector de intrusion corroido y tapa de baterias en mal estado");
INSERT INTO mantenimiento VALUES (26320,"2013/12/16","Se resetea por fallo de GPS y se anula detector de intrusion");
INSERT INTO mantenimiento VALUES (26320,"2014/01/30","Se sustituye por la mobilis. En tierra se sustituyen baterias, optica y regulador de FV");
INSERT INTO mantenimiento VALUES (26320,"2014/03/13","Vuelve al agua");
INSERT INTO mantenimiento VALUES (26320,"2014/09/24","Falla LDR02, pendiente de sustitucion (por malas condiciones)");
INSERT INTO mantenimiento VALUES (26320,"2014/11/26","Sustitucion LDR02");
INSERT INTO mantenimiento VALUES (26320,"2015/09/04","Modificación según resolución");
INSERT INTO mantenimiento VALUES (26320,"2017/09/14","Optica en mal estado, pendiente de cambio");
#BALIZA 8 EN SAGUNTO
INSERT INTO mantenimiento VALUES (26325,"2010/01/08","Sustitucion baterias");
INSERT INTO mantenimiento VALUES (26325,"2010/02/16","Sustitucion baterias");
INSERT INTO mantenimiento VALUES (26325,"2012/04/02","Sustitucion cierres de baliza");
INSERT INTO mantenimiento VALUES (26325,"2015/02/04","Sustitucion LDR02");
INSERT INTO mantenimiento VALUES (26325,"2015/09/16","Pintada");
INSERT INTO mantenimiento VALUES (26325,"2016/05/04","Sustitucion bateria, por otra usada pero en mejor estado");
INSERT INTO mantenimiento VALUES (26325,"2017/04/11","Sustitucion LDR01");
INSERT INTO mantenimiento VALUES (26325,"2017/07/13","Se repara acometida electrica por un fallo de conexion");
#BALIZA 9 EN SAGUNTO
INSERT INTO mantenimiento VALUES (26360,"2012/04/17","Sustitucion optica");
INSERT INTO mantenimiento VALUES (26360,"2013/01/09","Sustitucion baterias");
INSERT INTO mantenimiento VALUES (26360,"2013/02/05","Anular telecontrol. Alimentacion exterior linterna (Baja 04/02 y Alta 05/02)");
INSERT INTO mantenimiento VALUES (26360,"2013/03/06","Sustitucion por la mobilis para su revisión en tierra");
INSERT INTO mantenimiento VALUES (26360,"2013/03/21","Sustitucion regulador BP 20A por STECA 20A");
INSERT INTO mantenimiento VALUES (26360,"2013/03/22","Segun test solicitado, no funciona como autonoma");
INSERT INTO mantenimiento VALUES (26360,"2013/05/10","Puesta otra vez en el agua");
INSERT INTO mantenimiento VALUES (26360,"2014/06/19","Colisionada por un pesuqero");
INSERT INTO mantenimiento VALUES (26360,"2014/06/20","Sustitucion por Mobilis. Se repara estructuralmente, se pinta y se sustituye un PFV atersa A-38w");
INSERT INTO mantenimiento VALUES (26360,"2014/07/15","Vuelve al agua.");
INSERT INTO mantenimiento VALUES (26360,"2015/09/04","Modificación según resolución");
INSERT INTO mantenimiento VALUES (26360,"2016/08/08","Sustitucion tren fondeo");
INSERT INTO mantenimiento VALUES (26360,"2016/12/01","Por la noche permanece apagada. Se revisa y se deja en servicio");
INSERT INTO mantenimiento VALUES (26360,"2016/12/05","Se ha vuelto a apagar por bateria baja. Se da de baja");
INSERT INTO mantenimiento VALUES (26360,"2016/12/07","Se recupera la bateria y se da de alta.");
INSERT INTO mantenimiento VALUES (26360,"2016/12/20","Se apaga de matrugada y se recupera a las 18h (baja y alta mismo dia)");
INSERT INTO mantenimiento VALUES (26360,"2017/09/14","Panel FV averiado. Pendiente de sustitución");
INSERT INTO mantenimiento VALUES (26360,"2018/08/18","Se da de baja porque permanece apagada");
INSERT INTO mantenimiento VALUES (26360,"2018/08/20","Sustitucion baterias y regulador. Se da de alta");
INSERT INTO mantenimiento VALUES (26360,"2018/09/08","Se da de baja porque sigue apagandose. Preparamos sustituta.");
INSERT INTO mantenimiento VALUES (26360,"2018/09/13","Se sustituye por boya Mobilis para su reparacion y revision. Alta.");




#OBSERVACIONES SAGUNTO
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


#LOCALIZACION SAGUNTO
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




