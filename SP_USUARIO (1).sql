
use MERCA_PRIME;

DELIMITER $$

CREATE PROCEDURE AGREGA_USUARIO1 (ID_USU1 int,NOM_USU1 VARCHAR(25), NOM_COM1 VARCHAR(40), CONTRA1 	varchar 	(25),ROL1 char (1), IMG1 Varchar (25), FE_NAC1	date, SEXO1 char(1),  FE_IN1	date, PUB1	char(1), CORREO1 Varchar (25))
BEGIN
DECLARE ID INT; 
	INSERT INTO USUARIO (ID_USU,NOM_USU,NOM_COM,CONTRA,ROL,IMG,FE_NAC,SEXO,FE_IN,PUB,CORREO) VALUES (ID_USU1,NOM_USU1,NOM_COM1,CONTRA1,ROL1,IMG1,FE_NAC1,SEXO1,FE_IN1,PUB1,CORREO1);



END; $$

DELIMITER $$
CREATE PROCEDURE UPDATE_USUARIO (ID_USU1 int,NOM_USU1 VARCHAR(25), NOM_COM1 VARCHAR(40), CONTRA1 	varchar 	(25),ROL1 char (1), IMG1 Varchar (25), FE_NAC1	date, SEXO1 char(1),  FE_IN1	date, PUB1	char(1), CORREO1 Varchar (25))
BEGIN
DECLARE ID INT; 
DECLARE EXISTE_PERSONA INT; 
DECLARE IDP INT; 
SET EXISTE_PERSONA = (SELECT COUNT(*) FROM USUARIO WHERE ID_USU =ID_USU1);
	IF EXISTE_PERSONA>0 THEN 
	UPDATE USUARIO 
    SET 
    ID_USU=ID_USU1, 
    NOM_USU=NOM_USU1, 
    NOM_COM=NOM_COM1, 
    CONTRA=CONTRA1,
    ROL=ROL1 ,
    IMG=IMG1 ,
    FE_NAC= FE_NAC1 ,
    SEXO= SEXO1,
    FE_IN= FE_IN1,
    PUB= PUB1 ,
    CORREO= CORREO1 WHERE ID_USU=ID_USU1;
	SET IDP= ID_USU1; 
END IF ;

END; $$

DELIMITER $$
CREATE PROCEDURE VER_USUARIO2 (NOM_USU1 VARCHAR(25))
BEGIN

	SELECT  *FROM USUARIO  WHERE NOM_USU =NOM_USU1 ;
   


END; $$

CALL  UPDATE_USUARIO (2,'JAIME','ALEX','1233','2','IMAGAEN',NOW(),'3',now(),'3','ARTUROI@GMAIL.COM');
CALL VER_USUARIO2 ("JAIME");
INSERT INTO USUARIO  (ID_USU, NOM_USU, NOM_COM, CONTRA, ROL, IMG, FE_NAC, SEXO, FE_IN, PUB, CORREO)
 VALUES (1,'ALO','ALE','123','1','IMAGEN',NOW(),'1',now(),'1','ASDASD@GMAIL.COM');
 
 SELECT * FROM USUARIO;