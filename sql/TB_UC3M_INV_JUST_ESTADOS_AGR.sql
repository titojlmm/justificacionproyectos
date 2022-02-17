CREATE TABLE TB_UC3M_INV_JUST_ESTADOS_AGR (
  NUMIDESTADO     	INT   			NOT NULL AUTO_INCREMENT COMMENT 'Identificador del estado de la agrupación.',
  STRCODIGO		  	VARCHAR(3)		NOT NULL COMMENT 'Código del estado de la agrupación.',
  STRDESCRIPCION  	VARCHAR(100)	NOT NULL COMMENT 'Descripción del estado de la agrupación.',
  PRIMARY KEY (NUMIDESTADO)
) COMMENT 'Tabla que contiene los posibles estados de las agrupacoines de proyectos utilizadas para los lanzamientos de generación de los ficheros de la justificación';

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
