CREATE DATABASE MERCA_PRIME;
Drop database merca_prime;
use MERCA_PRIME; 

CREATE TABLE USUARIO
 (
 ID_USU 	int 			 primary key not null ,
 NOM_USU 	varchar 	(25),
 NOM_COM 	varchar 	(40),
 CONTRA 	varchar 	(25),
 ROL		char		(1),
 IMG		Varchar 	(25),
 FE_NAC		date			,
 SEXO		char		(1), 
 FE_IN		date			,
 PUB		char		(1), 
 CORREO 	Varchar 	(25)
 

 );
 
 CREATE TABLE PRODUCTO 
 (
 ID_PROD 	int 			 primary key not null ,
 ID_USU 	int				,
 NOM		varchar 	(40),
 DESCR 		varchar 	(250),
 PRECIO 	float			 ,
 CANT		int				 ,
 VAL		char		(1)  ,
 COMEN		varchar		(250), 
 AUTORI		char		(1)  ,
 ID_ADMIN_A	int				 ,

CONSTRAINT FK_PRODUCTO_USUARIO_ALTA
FOREIGN KEY (ID_USU) REFERENCES USUARIO (ID_USU),

CONSTRAINT FK_PRODUCTO_USUARIO_APROB
FOREIGN KEY (ID_ADMIN_A) REFERENCES USUARIO (ID_USU)
 );
 
 CREATE TABLE LISTAS
 (
 ID_LIS 	int 			 primary key not null ,
 ID_USU 	int				,
 NOM	 	varchar 	(25),
 DESCR 		varchar 	(250),
 IMG1		Varchar 	(100),
 ESTADO		char		(1),
 
CONSTRAINT FK_L_USU
FOREIGN KEY (ID_USU) REFERENCES USUARIO (ID_USU)

 );
 
 CREATE TABLE PROD_LISTAS
 (
 ID_PROD_LIS 	int 			 primary key not null ,
 ID_LIS 		int 								  ,
 ID_PROD 		int 								  ,

CONSTRAINT FK_PL_PRODUCTO
FOREIGN KEY (ID_PROD ) REFERENCES PRODUCTO (ID_PROD ),

CONSTRAINT FK_PL_LISTA
FOREIGN KEY (ID_LIS) REFERENCES LISTAS (ID_LIS)
 );
 

  CREATE TABLE CATEGORIAS
 (
 ID_CAT 	int 	primary key not null comment 'id de categoria' ,
 ID_USU 	int		comment 'id de los usuarios que crearon categoria'	,
 NOM	 	varchar 	(25) comment 'nombre de categoria',
 DESCR 		varchar 	(250) comment 'descripcion de la categoria',

CONSTRAINT FK_C_USU
FOREIGN KEY (ID_USU) REFERENCES USUARIO (ID_USU)

 );


 CREATE TABLE PRODUCTOS_CATEGORIAS
 (
 ID_PROD_CAT    int 			 primary key not null   ,
 ID_CAT			int										,
 ID_PROD 		int 								    ,

CONSTRAINT FK_PCAT_IDCAT
FOREIGN KEY (ID_CAT) REFERENCES CATEGORIAS (ID_CAT),

CONSTRAINT FK_PCAT_IDPROD
FOREIGN KEY (ID_PROD) REFERENCES PRODUCTO (ID_PROD)
 );
 
  CREATE TABLE CARRITO
 (
 ID_CARR	int 			 primary key not null ,
 ID_USU 	int				,
 FE_COMP	dateTIME		,
 TOTAL		FLOAT			,

CONSTRAINT FK_CARR_USU
FOREIGN KEY (ID_USU) REFERENCES USUARIO (ID_USU)

 );
 
   CREATE TABLE PRODUCTOS_CARRITO
 (
 ID_PROD_CARR	int 			 primary key not null ,
 ID_CARR		int										,
 ID_PROD 		int 								    ,
 CANTIDAD		int										,

CONSTRAINT FK_PC_IDCARR
FOREIGN KEY (ID_CARR) REFERENCES CARRITO (ID_CARR),

CONSTRAINT FK_PC_IDPROD
FOREIGN KEY (ID_PROD) REFERENCES PRODUCTO (ID_PROD)
 );
 
 CREATE TABLE VENTA 
 (
 ID_VENTA 	int 			 primary key not null ,
 ID_USU_C 	int				,
 ID_USU_V 	int				,
 FE_COMP	dateTIME		,

CONSTRAINT FK_VENTA_USUARIO
FOREIGN KEY (ID_USU_V) REFERENCES USUARIO (ID_USU),

CONSTRAINT FK_VENTA_USUARIOC
FOREIGN KEY (ID_USU_C) REFERENCES USUARIO (ID_USU)
 );
 
 CREATE TABLE PRODUCTOS_VENTA
 (
 ID_PROD_VENTA	int 				 primary key not null,
 ID_VENTA		int										,
 ID_PROD 		int 								    ,
 CANTIDAD		int										,
 PRECIO			float									,
 EXIS_A			int										,
 CALIFICACION	int										,

CONSTRAINT FK_PV_IDVENTA
FOREIGN KEY (ID_VENTA) REFERENCES VENTA (ID_VENTA),

CONSTRAINT FK_PV_IDPROD
FOREIGN KEY (ID_PROD) REFERENCES PRODUCTO (ID_PROD)
 );
 
 
  CREATE TABLE MULTIMEDIA
 (
 ID_MULTI		int 				 primary key not null,
 ID_PROD 		int 				 	 			     ,
 RUTA			Varchar 							(100),
 TIPO 			char								(1)	 ,


CONSTRAINT FK_M_IDPROD
FOREIGN KEY (ID_PROD) REFERENCES PRODUCTO (ID_PROD)
 );
 
   CREATE TABLE CHAT
 (
 ID_CHAT	int 			 primary key not null ,
 ID_USU1 	int				,
 ID_USU2 	int				,

CONSTRAINT FK_CHAT_USU1
FOREIGN KEY (ID_USU1) REFERENCES USUARIO (ID_USU),

CONSTRAINT FK_CHAT_USU2
FOREIGN KEY (ID_USU2) REFERENCES USUARIO (ID_USU)
 );

  CREATE TABLE MENSAJES
 (
 ID_MENS	int 			 primary key not null ,
 ID_CHAT 	int				,
 MENSAJE    VARCHAR(250)				,
 TIPO		CHAR (1)					, 
 
CONSTRAINT FK_MEN_CHAT
FOREIGN KEY (ID_CHAT) REFERENCES CHAT (ID_CHAT)
);

 
 
 SELECT distinct
 t.table_schema AS db_name,
       t.table_name,
       (CASE WHEN t.table_type = 'TABLE' THEN 'table'
             WHEN t.table_type = 'VIEW' THEN 'view'
             ELSE t.table_type
        END) AS table_type,
        c.column_name,
        c.column_type,
        c.column_default,
        c.column_key,
        c.is_nullable,
        c.extra,
        c.column_comment
FROM information_schema.tables AS t
INNER JOIN information_schema.columns AS c
ON t.table_name = c.table_name
AND t.table_schema = c.table_schema
WHERE t.table_type IN ('TABLE', 'VIEW')
AND t.table_schema = 'MERCA_PRIME'
ORDER BY 
        t.table_schema,
        t.table_name,
        c.ordinal_position
 
 

 