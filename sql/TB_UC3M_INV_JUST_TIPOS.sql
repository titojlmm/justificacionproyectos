CREATE TABLE TB_UC3M_INV_JUST_TIPOS (
  NUMIDTIPO INT 				NOT NULL AUTO_INCREMENT COMMENT 'Identificador interno del tipo de ayuda según el PN',
  STRCODIGO VARCHAR(8) 			NOT NULL COMMENT 'Identificador del tipo de ayuda según el PN',
  STRDESCRIPCION VARCHAR(100) 	NOT NULL COMMENT 'Nombre del tipo de ayuda según el PN',
  BLNVIGENTE	INT				NOT NULL DEFAULT '1' COMMENT 'Indica si el tipo está en vigor (1) o no (0)',
  PRIMARY KEY (NUMIDTIPO),
  UNIQUE INDEX STRCODIGO_UNIQUE (STRCODIGO ASC)
) COMMENT 'Tipos de proyectos de la entidad financiadora';

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

COMMIT;
