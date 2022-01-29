CREATE TABLE TB_UC3M_INV_JUST_TECNICA (
  NUMIDTECNICA  INT    		NOT NULL AUTO_INCREMENT COMMENT 'Identificador del tipo de gasto de la justificación técnica',
  STRTECNICA    VARCHAR(50) NOT NULL COMMENT 'Descripción del tipo de gasto de la justificación técnica',
  STRCODIGO     VARCHAR(50) NOT NULL COMMENT 'Código del tipo de gasto de la justificación técnica',
  PRIMARY KEY (NUMIDTECNICA)
) COMMENT 'Tabla que contiene los tipos de gastos desde el punto de vista de la justificación técnica';

Insert into TB_UC3M_INV_JUST_TECNICA
   (NUMIDTECNICA, STRTECNICA, STRCODIGO)
 Values
   (1, 'Gastos de personal', 'T1');
Insert into TB_UC3M_INV_JUST_TECNICA
   (NUMIDTECNICA, STRTECNICA, STRCODIGO)
 Values
   (2, 'Material inventariable', 'T2');
Insert into TB_UC3M_INV_JUST_TECNICA
   (NUMIDTECNICA, STRTECNICA, STRCODIGO)
 Values
   (3, 'Material fungible', 'T3');
Insert into TB_UC3M_INV_JUST_TECNICA
   (NUMIDTECNICA, STRTECNICA, STRCODIGO)
 Values
   (4, 'Viajes y dietas', 'T4');
Insert into TB_UC3M_INV_JUST_TECNICA
   (NUMIDTECNICA, STRTECNICA, STRCODIGO)
 Values
   (5, 'Otros gastos', 'T5');
COMMIT;
