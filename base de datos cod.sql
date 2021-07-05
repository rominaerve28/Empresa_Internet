-----creacion de tablas------
/*==============================================================*/
/* Table: CATEGORIA                                             */
/*==============================================================*/
create table CATEGORIA (
   COD_CATEGORIA        SERIAL               not null,
   NOMBRE_CATEGORIA     CHAR(256)            null,
   constraint PK_CATEGORIA primary key (COD_CATEGORIA)
);

/*==============================================================*/
/* Table: CIUDAD                                                */
/*==============================================================*/
create table CIUDAD (
   COD_CIUDAD           INT4                 not null,
   COD_PROVINCIA        INT4                 null,
   NOMBRE_CIUDAD        CHAR(256)            null,
   constraint PK_CIUDAD primary key (COD_CIUDAD)
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   COD_CLI              INT4                 not null,
   CEDULA_CLI           NUMERIC              null,
   NOMBRE_CLI           CHAR(256)            null,
   APELLIDO_CLI         CHAR(256)            null,
   DIRECCION_CLI        CHAR(256)            null,
   CORREO_CLI           CHAR(256)            null,
   CELULAR_CLI          INT4                 null,
   constraint PK_CLIENTE primary key (COD_CLI)
);

/*==============================================================*/
/* Table: CONTRATO                                              */
/*==============================================================*/
create table CONTRATO (
   COD_CONTRATO         INT4                 not null,
   COD_CLI              INT4                 null,
   COD_CIUDAD           INT4                 null,
   COD_PLAN             INT4                 null,
   COD_VENDEDOR         INT4                 null,
   FECH_INI_CON         DATE                 null,
   FECH_FIN_CON         DATE                 null,
   NOM_REP_LEGAL        CHAR(256)            null,
   NUM_CED_REP_LEGAL    NUMERIC              null,
   DIR_REP_LEGAL        CHAR(256)            null,
   EMAIL_REP_LEGAL      CHAR(256)            null,
   CEL_REP_LEGAL        INT4                 null,
   COS_INSTALACI        FLOAT8               null,
   constraint PK_CONTRATO primary key (COD_CONTRATO)
);

/*==============================================================*/
/* Table: FACTURA                                               */
/*==============================================================*/
create table FACTURA (
   COD_FACTURA          INT4                 not null,
   COD_CONTRATO         INT4                 null,
   FECHA_FAC            DATE                 null,
   SUBTOTAL             FLOAT8               null,
   MONTO_FINAL          FLOAT8               null,
   constraint PK_FACTURA primary key (COD_FACTURA)
);

/*==============================================================*/
/* Table: MARCACION                                             */
/*==============================================================*/
create table MARCACION (
   COD_MARCACION        INT4                 not null,
   COD_VENDEDOR         INT4                 null,
   HORA_ENT             TIME                 null,
   HORA_SAL             TIME                 null,
   FECHA_MARC           DATE                 null,
   constraint PK_MARCACION primary key (COD_MARCACION)
);

/*==============================================================*/
/* Table: PAGO                                                  */
/*==============================================================*/
create table PAGO (
   COD_PAGO             INT4                 not null,
   COD_VENDEDOR         INT4                 null,
   SUELDO_N             FLOAT8               null,
   HORAS_EXTRA          INT4                 null,
   VALORPOR_HORAEX      FLOAT8               null,
   HE_TOTAL             FLOAT8               null,
   DESCUENTOS           FLOAT8               null,
   BONOS                FLOAT8               null,
   SUELDO_TOT           FLOAT8               null,
   constraint PK_PAGO primary key (COD_PAGO)
);

/*==============================================================*/
/* Table: PLAN                                                  */
/*==============================================================*/
create table PLAN (
   COD_PLAN             INT4                 not null,
   COD_CATEGORIA        INT4                 null,
   NOMBRE_PLAN          CHAR(256)            null,
   PRECIO               FLOAT8               null,
   DESCRIPCION          CHAR(256)            null,
   constraint PK_PLAN primary key (COD_PLAN)
);

/*==============================================================*/
/* Table: PROVINCIA                                             */
/*==============================================================*/
create table PROVINCIA (
   COD_PROVINCIA        INT4                 not null,
   NOMBRE_PROV          CHAR(256)            null,
   constraint PK_PROVINCIA primary key (COD_PROVINCIA)
);

/*==============================================================*/
/* Table: VENDEDOR                                              */
/*==============================================================*/
create table VENDEDOR (
   COD_VENDEDOR         INT4                 not null,
   NOMBRE_VEN           CHAR(256)            null,
   APELLIDO_VEN         CHAR(256)            null,
   DIRECCION_VEN        CHAR(256)            null,
   FENA_VEN             DATE                 null,
   CELU_VEN             NUMERIC              null,
   constraint PK_VENDEDOR primary key (COD_VENDEDOR)
);

alter table CIUDAD
   add constraint FK_CIUDAD_PROVINCIA_PROVINCI foreign key (COD_PROVINCIA)
      references PROVINCIA (COD_PROVINCIA)
      on delete restrict on update restrict;

alter table CONTRATO
   add constraint FK_CONTRATO_CIUDAD_CO_CIUDAD foreign key (COD_CIUDAD)
      references CIUDAD (COD_CIUDAD)
      on delete restrict on update restrict;

alter table CONTRATO
   add constraint FK_CONTRATO_CONTRATO__CLIENTE foreign key (COD_CLI)
      references CLIENTE (COD_CLI)
      on delete restrict on update restrict;

alter table CONTRATO
   add constraint FK_CONTRATO_PLAN_CONT_PLAN foreign key (COD_PLAN)
      references PLAN (COD_PLAN)
      on delete restrict on update restrict;

alter table CONTRATO
   add constraint FK_CONTRATO_VENDEDOR__VENDEDOR foreign key (COD_VENDEDOR)
      references VENDEDOR (COD_VENDEDOR)
      on delete restrict on update restrict;

alter table FACTURA
   add constraint FK_FACTURA_CONTRATO__CONTRATO foreign key (COD_CONTRATO)
      references CONTRATO (COD_CONTRATO)
      on delete restrict on update restrict;

alter table MARCACION
   add constraint FK_MARCACIO_VENDEDOR__VENDEDOR foreign key (COD_VENDEDOR)
      references VENDEDOR (COD_VENDEDOR)
      on delete restrict on update restrict;

alter table PAGO
   add constraint FK_PAGO_VENDEDOR__VENDEDOR foreign key (COD_VENDEDOR)
      references VENDEDOR (COD_VENDEDOR)
      on delete restrict on update restrict;

alter table PLAN
   add constraint FK_PLAN_CATEGORIA_CATEGORI foreign key (COD_CATEGORIA)
      references CATEGORIA (COD_CATEGORIA)
      on delete restrict on update restrict;




------insertar datos a las tablas-----
------Insertar tabla Categoria
insert into categoria values (1, 'Plan Hogar Fibra Optica' );
insert into categoria values (2, 'Plan Hogar Wireless' );
------Insertar tabla plan
insert into plan values (1, 1, 'Wion Gold', 25.00, '20 MB incluido impuestos');
insert into plan values (2, 1, 'Wion Platinum', 30.00, '25 MB incluido impuestos');
insert into plan values (3, 1, 'Wion Premium', 35.00, '30 MB incluido impuestos');
insert into plan values (4, 2, 'Wion Basico', 20.00, '5 MB incluido impuestos');
insert into plan values (5, 2, 'Wion Plus', 25.00, '7 MB incluido impuestos');
insert into plan values (6, 2, 'Wion Premium Wir', 30.00, '10 MB incluido impuestos');
------Insertar tabla ciudad
insert into ciudad values (1, 4, 'La Libertad');
insert into ciudad values (2 ,2 ,'Manta ');
insert into ciudad values (3 ,5 ,'Guayaquil ');
insert into ciudad values (4 ,2 ,' Portoviejo ');
insert into ciudad values ( 5, 8,' Cuenca');
insert into ciudad values ( 6, 7,' Machala ');
insert into ciudad values ( 7, 16,' Quito ');
insert into ciudad values ( 8, 17,' Ambato ');
insert into ciudad values ( 9, 22,' Lago Agrio');
insert into ciudad values ( 10, 23,' Zamora ');
-------Insertar tabla provincia
insert into provincia values (1 , 'Esmeraldas' );
insert into provincia values (2 , 'Manabi');
insert into provincia values (3 , 'Los Rios' );
insert into provincia values (4 , 'Santa Elena');
insert into provincia values (5 , 'Guayas' );
insert into provincia values (6 , 'Santo Domingo de los Tsáchilas' );
insert into provincia values (7 , 'El Oros' );
insert into provincia values (8 , 'Azuay' );
insert into provincia values (9 , 'Bolivar' );
insert into provincia values (10 , 'Cañar' );
insert into provincia values (11 , 'Carchi' );
insert into provincia values (12 , ' Cotopaxi');
insert into provincia values (13 , 'Chimborazo' );
insert into provincia values (14 , 'Imbabura' );
insert into provincia values (15 , 'Loja' );
insert into provincia values (16 , 'Pichincha' );
insert into provincia values (17 , 'Tungurahua' );
insert into provincia values (18 , 'Morona Santiago');
insert into provincia values (19 , 'Napo');
insert into provincia values (20 , 'Orellana' );
insert into provincia values (21 , 'Pastaza' );
insert into provincia values (22 , 'Sucumbios');
insert into provincia values (23 , 'Zamora Chinchipe' );
insert into provincia values (24 , 'Galápagos' );

-------Insertar tabla cliente
insert into cliente values (001, 1315257855, 'Romina Eliana', 'Eras Véliz', 'Manta Calle 113 avenida 14 barrio las orquideas', 'romina@gmail.com', 0987654344);
insert into cliente values (002, 1345327482, 'Hamilton Orlando', 'Madrid Vera', 'Guayaquil Calle 20 avenida 114 barrio la paz', 'orlaham@hotmail.com', 0928393848);
insert into cliente values (003, 0948388327, 'Raul Abel', 'Velez Ortega', 'Ambato Calle 12 avenida 113 barrio las acacias', 'ab12jk@gmail.com', 0987653298);
insert into cliente values (004, 0987527384, 'Matilde Elizabeth', 'Velez Napa', 'Portoviejo Calle 20 avenida 120 barrio miraflores', 'velima@gmail.com', 0999459378);
insert into cliente values (005, 1237839590, 'Yoly Consuelo', 'Ortega Macías', ' Manta Calle 15 avenida 100 barrio los esteros', 'memyo@gmail.com', 0998767383);
insert into cliente values (006, 1564393050, 'Xavier Enrique', 'Macias Velez', 'Quito Calle 12 avenida 114 barrio altagracia', 'xavi@outlook.com', 0999326781);
insert into cliente values (007, 1324858393, 'Rodrigo Hernesto', 'Veliz Napa', 'Manta Calle 10 avenida 101 barrio miraflores', 'rodrigve102@gmail.com', 0947248298);
insert into cliente values (008, 1245448249, 'Aurora Julieta', 'Menendez Yoza', ' Manta Calle 10 avenida 203 barrio la pradera', 'auri@gmail.com', 0987632189);
insert into cliente values (009, 1387394930, 'Angy Esyavena', 'Lara Veliz', 'Machala Calle 1 avenida 10 urbanización terrazas del conde', 'esja@gmail.com', 0983647282);
insert into cliente values (010, 1347583959, 'Cristina Maria', 'Veliz Ortiz', 'Cuenca Calle 20 avenida 10 urbanización sarilan', 'cristies@gmail.com', 0984325689);

------ insertar tabla vendedor
insert into vendedor values (1, 'Julio Alberto', 'Ramirez Lopez', 'Urbanización costa azul', '1999/01/23', 0999654328);
insert into vendedor values (2, 'Juan Marco', 'Velez Padilla', 'Barrio las cumbres', '2000/02/20', 0987456327);
insert into vendedor values (3, 'María Alfreda', 'Vinueza Velazques', 'Barrio Jocay', '1969/04/02', 0983742845);
insert into vendedor values (4, 'Esmeralda Narcisa', 'Erazo Bonilla', 'Barrio Altagracia', '1990/02/02', 0983752842);
insert into vendedor values (5, 'Orlando Enrique', 'Lara Mendoza', 'Barrio Miraflores', '2001/03/23', 0983456712);

------ insertar tabla marcaciones
insert into marcacion values (01, 1, '07:00:00', '18:00:02', '2021/06/28' );
insert into marcacion values (02, 1, '06:45:23', '17:40:20', '2021/06/29' );
insert into marcacion values (03, 1, '06:58:03', '17:55:20', '2021/06/30' );

insert into marcacion values (04, 2, '07:00:00', '18:00:02', '2021/06/28' );
insert into marcacion values (05, 2, '07:00:23', '17:45:00', '2021/06/29' );
insert into marcacion values (06, 2, '07:00:03', '17:50:02', '2021/06/30' );

insert into marcacion values (07, 3, '07:00:00', '18:00:02', '2021/06/28' );
insert into marcacion values (08, 3, '06:45:23', '17:40:20', '2021/06/29' );
insert into marcacion values (09, 3, '06:58:03', '17:55:20', '2021/06/30' );

insert into marcacion values (10, 4, '06:50:00', '18:00:02', '2021/06/28' );
insert into marcacion values (11, 4, '06:35:23', '19:40:20', '2021/06/29' );
insert into marcacion values (12, 4, '06:40:03', '20:55:20', '2021/06/30' );

insert into marcacion values (13, 5, '07:10:00', '18:00:02', '2021/06/28' );
insert into marcacion values (14, 5, '06:50:23', '18:40:20', '2021/06/29' );
insert into marcacion values (15, 5, '06:45:03', '18:55:20', '2021/06/30' );

------ insertar tabla contrato
insert into contrato values (0001, 005, 2,1, 2, '2020/07/04' , '2022/07/04', 'Yoly Consuelo Ortega', 1237839590, 'Manta Calle 15 avenida 100 barrio los esteros', 'memyo@gmail.com', 0998767383, 40.00  );
insert into contrato values (0002, 002, 3, 2, 4, '2020/07/06', '2021/07/06', 'Hamilton Madrid', 1345327482,'Guayaquil Calle 20 avenida 114 barrio la paz', ' orlaham@hotmail.com', 0928393848, 30.00 );
insert into contrato values (0003, 006, 7, 4, 2, '2021/05/20', '2025/05/20', ' Xavier Macías', 1564393050, ' Quito Calle 12 avenida 114 barrio altagracia ', ' xavi@outlook.com ', 0999326781 , 40.00 );
insert into contrato values (0004, 001, 2, 5, 5, '2020/07/21', '2022/07/21', 'Romina Eras ', 1315257855, ' Manta Calle 113 avenida 14 barrio las orquideas ', ' romina@gmail.com ', 0987654344, 30.00);
------ insertar tabla factura 
insert into factura values (0101, 0001, '2020/07/04', 65.00, 65.00, ' Yoly Ortega '  );
insert into factura values (0102, 0003, '2021/05/20', 60.00, 60.00, 'Xavier Macías' );
insert into factura values (0103, 0002, '2020/07/06 ', 60.00, 60.00, 'Hamilton Madrid ' );
insert into factura values (0104, 0004, '2020/07/21', 55.00, 55.00, ' Romina Eras ');
insert into factura values (0105, 0002, '2020/08/20 ', 30.00, 30.00, 'Hamilton Madrid ');
insert into factura values (0106, 0003, '2021/06/10', 20.00, 20.00, 'Xavier Macías');
insert into factura values (0107, 0001, '2021/08/28', 25.00, 25.00, ' Yoly Ortega '  ););
insert into factura values (0108, 0003, '2021/07/10', 20.00, 20.00, 'Xavier Macías'););
insert into factura values (0109, 0004, '2020/08/21', 25.00, 25.00, ' Romina Eras '););
insert into factura values (0110, 0004, '2020/09/21', 25.00, 25.00, ' Romina Eras '););

------ insertar tabla pago
insert into pago values (000001, 1, 450.10, 0, 2.30, 0.00, 22.50, 0.00, 427.6  );
insert into pago values (000002, 2, 450.10, 0, 2.30, 0.00, 0, 16.00, 466.1  );
insert into pago values (000003, 3, 450.10, 0, 2.30, 0.00, 22.50, 0.00, 427.6  );
insert into pago values (000004, 4, 450.10, 4, 2.30, 9.20, 22.50, 0.00, 436.8  );
insert into pago values (000005, 5, 450.10, 1, 2.30, 2.30, 22.50, 0.00, 429.9  );


------ CONSULTA 1
-- planes vendidos en el mesde julio/2020 junto al vendedor
select contrato.cod_contrato, 
contrato.cod_plan, 
contrato.cod_vendedor,
contrato.fech_ini_con,
plan.nombre_plan,
vendedor.nombre_ven,
from contrato 
inner join plan on plan.cod_plan = contrato.cod_plan 
inner join vendedor on vendedor.cod_vendedor = contrato.cod_vendedor
where contrato.fech_ini_con >= '2020/07/01' and contrato.fech_ini_con <= '2020/07/31'
 ------ CONSULTA 2
-- mostrar las facturas emitidas en el mes de agosto desde el 2020 hasta la actualidad
SELECT *FROM factura WHERE TO_CHAR(fecha_fac,'MM')='08' ;

-------CONSULTA 3
•	Mostrar a los trabajadores que hicieron sobretiempo.
select marcacion.cod_marcacion,
marcacion.cod_vendedor, 
marcacion.hora_ent,
marcacion.hora_sal,
marcacion.fecha_marc,
vendedor.nombre_ven
from marcacion 
inner join vendedor on  vendedor.cod_vendedor = marcacion.cod_vendedor
where hora_sal >= '18:00:00' 

-------CONSULTA 4
--mostrar los trabajadores que recibieron el bono del 20% y las ventas realizadas
select contrato.cod_cli,
contrato.cod_ciudad,
contrato.cod_plan,
contrato.cod_vendedor,
contrato.fech_ini_con,
contrato.fech_fin_con, 
vendedor.nombre_ven,
pago.bonos
from contrato 
inner join vendedor on vendedor.cod_vendedor= contrato.cod_vendedor
inner join pago on pago.cod_vendedor= contrato.cod_vendedor
where pago.bonos <> 0 


