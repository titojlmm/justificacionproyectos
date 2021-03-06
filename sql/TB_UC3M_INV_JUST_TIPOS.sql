---------------------- MYSQL ------------------------
CREATE TABLE TB_UC3M_INV_JUST_TIPOS (
  NUMIDTIPO INT 				NOT NULL AUTO_INCREMENT COMMENT 'Identificador interno del tipo de ayuda según el ministerio.',
  STRCODIGO VARCHAR(8) 			NOT NULL COMMENT 'Identificador del tipo de ayuda según el ministerio.',
  STRDESCRIPCION VARCHAR(100) 	NOT NULL COMMENT 'Nombre del tipo de ayuda según el ministerio.',
  BLNVIGENTE	INT				NOT NULL DEFAULT '1' COMMENT 'Indica si el tipo está en vigor (1) o no (0).',
  PRIMARY KEY (NUMIDTIPO),
  UNIQUE INDEX STRCODIGO_UNIQUE (STRCODIGO ASC)
) COMMENT 'Tipos de proyectos de la entidad financiadora';
---------------------- ORACLE ------------------------
CREATE SEQUENCE TECNICOS_INV.JUST_TIPOS_SQ;

CREATE TABLE TECNICOS_INV.TB_UC3M_INV_JUST_TIPOS (
  NUMIDTIPO       NUMBER(8)     NOT NULL,
  STRCODIGO       VARCHAR2(8)   NOT NULL,
  STRDESCRIPCION  VARCHAR2(100) NOT NULL,
  BLNVIGENTE      NUMBER(1)     DEFAULT 1 NOT NULL
);

COMMENT ON TABLE TECNICOS_INV.TB_UC3M_INV_JUST_TIPOS IS 'Tipos de proyectos de la entidad financiadora.';
COMMENT ON COLUMN TECNICOS_INV.TB_UC3M_INV_JUST_TIPOS.NUMIDTIPO IS 'Identificador interno del tipo de ayuda según el ministerio.';
COMMENT ON COLUMN TECNICOS_INV.TB_UC3M_INV_JUST_TIPOS.STRCODIGO IS 'Identificador del tipo de ayuda según el ministerio.';
COMMENT ON COLUMN TECNICOS_INV.TB_UC3M_INV_JUST_TIPOS.STRDESCRIPCION IS 'Nombre del tipo de ayuda según el ministerio.';
COMMENT ON COLUMN TECNICOS_INV.TB_UC3M_INV_JUST_TIPOS.BLNVIGENTE IS 'Indica si el tipo está en vigor (1) o no (0).';

CREATE UNIQUE INDEX TECNICOS_INV.JUST_TIPOS_PK_I ON TECNICOS_INV.TB_UC3M_INV_JUST_TIPOS (NUMIDTIPO);
CREATE UNIQUE INDEX TECNICOS_INV.JUST_TIPOS_UK_I ON TECNICOS_INV.TB_UC3M_INV_JUST_TIPOS (STRCODIGO);

ALTER TABLE TECNICOS_INV.TB_UC3M_INV_JUST_TIPOS ADD (
  CONSTRAINT JUST_TIPOS_PK
  PRIMARY KEY (NUMIDTIPO)
  USING INDEX TECNICOS_INV.JUST_TIPOS_PK_I
  ENABLE VALIDATE
);

CREATE OR REPLACE TRIGGER TG_JUST_TIPOS_SQ
  BEFORE INSERT 
  ON TB_UC3M_INV_JUST_TIPOS FOR EACH ROW
BEGIN
  IF :new.NUMIDTIPO IS NULL THEN
    SELECT JUST_TIPOS_SQ.nextval INTO :new.NUMIDTIPO FROM DUAL;
  END IF;
END;
/
------------------------------------------------------
Insert into TB_UC3M_INV_JUST_TIPOS (NUMIDTIPO, STRCODIGO, STRDESCRIPCION) Values (1, '01', 'PROYECTOS I+D');
Insert into TB_UC3M_INV_JUST_TIPOS (NUMIDTIPO, STRCODIGO, STRDESCRIPCION) Values (2, '02', 'ACCIONES COMPLEMENTARIAS');
Insert into TB_UC3M_INV_JUST_TIPOS (NUMIDTIPO, STRCODIGO, STRDESCRIPCION) Values (3, '03', 'RAMÓN Y CAJAL');
Insert into TB_UC3M_INV_JUST_TIPOS (NUMIDTIPO, STRCODIGO, STRDESCRIPCION) Values (4, '04', 'CONSOLIDER');
Insert into TB_UC3M_INV_JUST_TIPOS (NUMIDTIPO, STRCODIGO, STRDESCRIPCION) Values (5, '05', 'PETRI, OTRI, ACI, EUROCIENCIA');
Insert into TB_UC3M_INV_JUST_TIPOS (NUMIDTIPO, STRCODIGO, STRDESCRIPCION) Values (6, '06', 'ACCIONES INTEGRADAS');
Insert into TB_UC3M_INV_JUST_TIPOS (NUMIDTIPO, STRCODIGO, STRDESCRIPCION) Values (7, '07', 'TRACE');
Insert into TB_UC3M_INV_JUST_TIPOS (NUMIDTIPO, STRCODIGO, STRDESCRIPCION) Values (8, '08', 'JUAN DE LA CIERVA, BECAS FPI Y TORRES QUEVEDO');
Insert into TB_UC3M_INV_JUST_TIPOS (NUMIDTIPO, STRCODIGO, STRDESCRIPCION) Values (9, '09', 'TÉCNICOS DE APOYO');
Insert into TB_UC3M_INV_JUST_TIPOS (NUMIDTIPO, STRCODIGO, STRDESCRIPCION) Values (10, '10', 'INNPACTO 2011');
Insert into TB_UC3M_INV_JUST_TIPOS (NUMIDTIPO, STRCODIGO, STRDESCRIPCION) Values (11, '11', 'ESTANCIAS BREVES 2010-2012');
Insert into TB_UC3M_INV_JUST_TIPOS (NUMIDTIPO, STRCODIGO, STRDESCRIPCION) Values (12, '12', 'INNPACTO 2010');
Insert into TB_UC3M_INV_JUST_TIPOS (NUMIDTIPO, STRCODIGO, STRDESCRIPCION) Values (13, '13', 'PROY. INT. MULTILATERALES');
Insert into TB_UC3M_INV_JUST_TIPOS (NUMIDTIPO, STRCODIGO, STRDESCRIPCION) Values (14, '14', 'PROY. INT. BILATERALES');
Insert into TB_UC3M_INV_JUST_TIPOS (NUMIDTIPO, STRCODIGO, STRDESCRIPCION) Values (15, '15', 'PROY. INT. MOVILIDAD');
Insert into TB_UC3M_INV_JUST_TIPOS (NUMIDTIPO, STRCODIGO, STRDESCRIPCION) Values (16, '16', 'PROY. INT. MULTILAT., BILAT. Y MOVILIDAD 2010');
Insert into TB_UC3M_INV_JUST_TIPOS (NUMIDTIPO, STRCODIGO, STRDESCRIPCION) Values (17, '17', 'EUROCIENCIA 2008');
Insert into TB_UC3M_INV_JUST_TIPOS (NUMIDTIPO, STRCODIGO, STRDESCRIPCION) Values (18, '18', 'EUROCIENCIA 2006');
Insert into TB_UC3M_INV_JUST_TIPOS (NUMIDTIPO, STRCODIGO, STRDESCRIPCION) Values (19, '19', 'INNPACTO 2012');
Insert into TB_UC3M_INV_JUST_TIPOS (NUMIDTIPO, STRCODIGO, STRDESCRIPCION) Values (20, '20', 'COFUND');
Insert into TB_UC3M_INV_JUST_TIPOS (NUMIDTIPO, STRCODIGO, STRDESCRIPCION) Values (21, '21', 'PROYECTOS I+D EXCELENCIA 2013-2016');
Insert into TB_UC3M_INV_JUST_TIPOS (NUMIDTIPO, STRCODIGO, STRDESCRIPCION) Values (22, '22', 'PROYECTOS I+D RETOS 2013-2016');
Insert into TB_UC3M_INV_JUST_TIPOS (NUMIDTIPO, STRCODIGO, STRDESCRIPCION) Values (23, '23', 'EXPLORA CIENCIA/TECNOLOGIA');
Insert into TB_UC3M_INV_JUST_TIPOS (NUMIDTIPO, STRCODIGO, STRDESCRIPCION) Values (24, '24', 'ESTANCIAS BREVES 2013');
Insert into TB_UC3M_INV_JUST_TIPOS (NUMIDTIPO, STRCODIGO, STRDESCRIPCION) Values (25, '25', 'EUROPA INVESTIGACION 2013 (ACCIONES DINAMIZACION)');
Insert into TB_UC3M_INV_JUST_TIPOS (NUMIDTIPO, STRCODIGO, STRDESCRIPCION) Values (26, '26', 'RETOS COLABORACION');
Insert into TB_UC3M_INV_JUST_TIPOS (NUMIDTIPO, STRCODIGO, STRDESCRIPCION) Values (27, '27', 'EUROPA REDES Y GESTORES');
Insert into TB_UC3M_INV_JUST_TIPOS (NUMIDTIPO, STRCODIGO, STRDESCRIPCION) Values (28, '28', 'REDES EXCELENCIA');
Insert into TB_UC3M_INV_JUST_TIPOS (NUMIDTIPO, STRCODIGO, STRDESCRIPCION) Values (29, '29', 'EUROPA INVESTIGACION 2015');
Insert into TB_UC3M_INV_JUST_TIPOS (NUMIDTIPO, STRCODIGO, STRDESCRIPCION) Values (30, '30', 'EUROPA EXCELENCIA');
Insert into TB_UC3M_INV_JUST_TIPOS (NUMIDTIPO, STRCODIGO, STRDESCRIPCION) Values (31, '31', 'SEVERO OCHOA / MARIA DE MAETZU');
Insert into TB_UC3M_INV_JUST_TIPOS (NUMIDTIPO, STRCODIGO, STRDESCRIPCION) Values (32, '32', 'APCIN');
Insert into TB_UC3M_INV_JUST_TIPOS (NUMIDTIPO, STRCODIGO, STRDESCRIPCION) Values (33, '33', 'JUAN DE LA CIERVA 2014');
Insert into TB_UC3M_INV_JUST_TIPOS (NUMIDTIPO, STRCODIGO, STRDESCRIPCION) Values (34, '34', 'INFRAESTRUCTURAS CIENTIFICAS 2015');
Insert into TB_UC3M_INV_JUST_TIPOS (NUMIDTIPO, STRCODIGO, STRDESCRIPCION) Values (35, '35', 'RETOS JOVENES INVESTIGADORES');
Insert into TB_UC3M_INV_JUST_TIPOS (NUMIDTIPO, STRCODIGO, STRDESCRIPCION) Values (36, '36', 'PROYECTOS I+D EXCELENCIA 2017');
Insert into TB_UC3M_INV_JUST_TIPOS (NUMIDTIPO, STRCODIGO, STRDESCRIPCION) Values (37, '37', 'PROYECTOS I+D RETOS 2017');
Insert into TB_UC3M_INV_JUST_TIPOS (NUMIDTIPO, STRCODIGO, STRDESCRIPCION) Values (38, '38', 'PROMOCIÓN EMPLEO JOVEN');
Insert into TB_UC3M_INV_JUST_TIPOS (NUMIDTIPO, STRCODIGO, STRDESCRIPCION) Values (39, '39', 'EUROPA INVESTIGACION 2019');
Insert into TB_UC3M_INV_JUST_TIPOS (NUMIDTIPO, STRCODIGO, STRDESCRIPCION) Values (40, '40', 'APCIN 2018-2020');
Insert into TB_UC3M_INV_JUST_TIPOS (NUMIDTIPO, STRCODIGO, STRDESCRIPCION) Values (41, '41', 'PROYECTOS I+D RETOS 2020');

COMMIT;
