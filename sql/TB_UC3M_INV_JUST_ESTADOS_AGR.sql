---------------------- MYSQL ------------------------
CREATE TABLE TB_UC3M_INV_JUST_ESTADOS_AGR (
  NUMIDESTADO     	INT   			NOT NULL AUTO_INCREMENT COMMENT 'Identificador del estado de la agrupación.',
  STRCODIGO		  	VARCHAR(3)		NOT NULL COMMENT 'Código del estado de la agrupación.',
  STRDESCRIPCION  	VARCHAR(100)	NOT NULL COMMENT 'Descripción del estado de la agrupación.',
  PRIMARY KEY (NUMIDESTADO)
) COMMENT 'Tabla que contiene los posibles estados de las agrupaciones de proyectos utilizadas para los lanzamientos de generación de los ficheros de la justificación';
---------------------- ORACLE ------------------------
CREATE SEQUENCE TECNICOS_INV.JUST_EST_AGR_SQ;

CREATE TABLE TECNICOS_INV.TB_UC3M_INV_JUST_ESTADOS_AGR (
  NUMIDESTADO     NUMBER(8)     NOT NULL,
  STRCODIGO       VARCHAR2(3)   NOT NULL,
  STRDESCRIPCION  VARCHAR2(100) NOT NULL
);

COMMENT ON TABLE TECNICOS_INV.TB_UC3M_INV_JUST_ESTADOS_AGR IS 'Tabla que contiene los posibles estados de las agrupaciones de proyectos utilizadas para los lanzamientos de generación de los ficheros de la justificación';
COMMENT ON COLUMN TECNICOS_INV.TB_UC3M_INV_JUST_ESTADOS_AGR.NUMIDESTADO IS 'Identificador del estado de la agrupación.';
COMMENT ON COLUMN TECNICOS_INV.TB_UC3M_INV_JUST_ESTADOS_AGR.STRCODIGO IS 'Código del estado de la agrupación.';
COMMENT ON COLUMN TECNICOS_INV.TB_UC3M_INV_JUST_ESTADOS_AGR.STRDESCRIPCION IS 'Descripción del estado de la agrupación.';

CREATE UNIQUE INDEX TECNICOS_INV.JUST_EST_AGR_PK_I ON TECNICOS_INV.TB_UC3M_INV_JUST_ESTADOS_AGR (NUMIDESTADO);
CREATE UNIQUE INDEX TECNICOS_INV.JUST_EST_AGR_UK_I ON TECNICOS_INV.TB_UC3M_INV_JUST_ESTADOS_AGR (STRCODIGO);

ALTER TABLE TECNICOS_INV.TB_UC3M_INV_JUST_ESTADOS_AGR ADD (
  CONSTRAINT JUST_EST_AGR_PK
  PRIMARY KEY (NUMIDESTADO)
  USING INDEX TECNICOS_INV.JUST_EST_AGR_PK_I
  ENABLE VALIDATE
);

CREATE OR REPLACE TRIGGER TG_JUST_ESTADOS_AGR_SQ
  BEFORE INSERT 
  ON TB_UC3M_INV_JUST_ESTADOS_AGR FOR EACH ROW
BEGIN
  IF :new.NUMIDESTADO IS NULL THEN
    SELECT JUST_EST_AGR_SQ.nextval INTO :new.NUMIDESTADO FROM DUAL;
  END IF;
END;
/
------------------------------------------------------
Insert into TB_UC3M_INV_JUST_ESTADOS_AGR
   (STRCODIGO, STRDESCRIPCION)
 Values
   ('REG', '(auto) Agrupación creada, sin proyectos asociados.');
Insert into TB_UC3M_INV_JUST_ESTADOS_AGR
   (STRCODIGO, STRDESCRIPCION)
 Values
   ('PRE', '(auto) Agrupación preparada, con proyectos asociados. Puede comenzar el lanzamiento.');
Insert into TB_UC3M_INV_JUST_ESTADOS_AGR
   (STRCODIGO, STRDESCRIPCION)
 Values
   ('ERR', '(auto) La agrupación se ha validado y se han producido errores.');
Insert into TB_UC3M_INV_JUST_ESTADOS_AGR
   (STRCODIGO, STRDESCRIPCION)
 Values
   ('VAL', '(auto) La agrupación se ha validado y está lista para generar los archivos.');
Insert into TB_UC3M_INV_JUST_ESTADOS_AGR
   (STRCODIGO, STRDESCRIPCION)
 Values
   ('GEN', '(auto) Se han generado los ficheros de la justificación asociados a esta agrupación.');
Insert into TB_UC3M_INV_JUST_ESTADOS_AGR
   (STRCODIGO, STRDESCRIPCION)
 Values
   ('CER', '(manual) Se cierra la agrupación por lo que no se puede operar más con ella.');

COMMIT;
