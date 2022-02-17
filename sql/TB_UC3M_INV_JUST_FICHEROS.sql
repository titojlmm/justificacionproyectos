CREATE TABLE TB_UC3M_INV_JUST_FICHEROS (
  NUMIDFICHERO		INT			NOT NULL AUTO_INCREMENT COMMENT 'Identificador del fichero.',
  STRDESCRIPCION	INT			NOT NULL COMMENT 'Descripción del fichero.',
  STRCONTENTYPE    	INT   		NOT NULL COMMENT 'Tipo de contenido del fichero.',
  NUMTAMANIO    	INT   		NOT NULL COMMENT 'Tamaño del fichero.',
  DATCREACION		DATETIME	NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FICHERO			BLOB		NOT NULL COMMENT 'Contenido del fichero',
  PRIMARY KEY (NUMIDFICHERO)
) COMMENT 'Tabla que contiene los ficheros generados por las justificaciones';
