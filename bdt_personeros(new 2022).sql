-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.22-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para bdt_personeros
CREATE DATABASE IF NOT EXISTS `bdt_personeros` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bdt_personeros`;

-- Volcando estructura para tabla bdt_personeros.candidatos
DROP TABLE IF EXISTS `candidatos`;
CREATE TABLE IF NOT EXISTS `candidatos` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `FOTO` char(150) DEFAULT 'default',
  `alumnos_CODEST` char(30) NOT NULL,
  `color` varchar(10) DEFAULT NULL,
  `partido` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_candidatosvot_alumnos1_idx` (`alumnos_CODEST`),
  CONSTRAINT `fk_candidatosvot_alumnos1` FOREIGN KEY (`alumnos_CODEST`) REFERENCES `estudiantes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bdt_personeros.candidatos: ~4 rows (aproximadamente)
DELETE FROM `candidatos`;
INSERT INTO `candidatos` (`Id`, `FOTO`, `alumnos_CODEST`, `color`, `partido`) VALUES
	(0, 'Enblanco.png', 'voto_b2021', '#FAFAFA', NULL),
	(1, 'jose.jpg', '371', 'green', 'MOVIMIENTO SANRAFAELISTA'),
	(2, 'shadia.jpg', '114', '#64039A', 'EXELENCIA'),
	(3, 'libardo.jpg', '284', '#FFC700', 'LIDERAZGO JUVENIL');

-- Volcando estructura para tabla bdt_personeros.estudiantes
DROP TABLE IF EXISTS `estudiantes`;
CREATE TABLE IF NOT EXISTS `estudiantes` (
  `id` char(30) NOT NULL,
  `grado` double DEFAULT NULL,
  `grupo` varchar(3) DEFAULT NULL,
  `apellido1` varchar(90) DEFAULT NULL,
  `apellido2` varchar(90) DEFAULT NULL,
  `nombre1` varchar(90) DEFAULT NULL,
  `nombre2` varchar(90) DEFAULT NULL,
  `estado` varchar(15) DEFAULT 'Inactivo',
  `codInst` int(11) NOT NULL DEFAULT 1,
  `sexo` char(2) NOT NULL,
  `rol` varchar(20) NOT NULL DEFAULT 'Estudiante',
  `contrasena` varchar(20) NOT NULL DEFAULT '123456',
  PRIMARY KEY (`id`),
  KEY `fk_alumnos_Institucion1_idx` (`codInst`),
  CONSTRAINT `fk_alumnos_Institucion1` FOREIGN KEY (`codInst`) REFERENCES `institucion` (`idInstitucion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bdt_personeros.estudiantes: ~276 rows (aproximadamente)
DELETE FROM `estudiantes`;
INSERT INTO `estudiantes` (`id`, `grado`, `grupo`, `apellido1`, `apellido2`, `nombre1`, `nombre2`, `estado`, `codInst`, `sexo`, `rol`, `contrasena`) VALUES
	('001', 11, '1', 'GARCIA', 'PEREZ', 'JORGE', 'ANDRES', 'Ya Votó', 1, 'M', 'Estudiante', '123456'),
	('002', 1, '1', 'GARCIA', 'GARCIA', 'CESAR', 'ANDRES', 'Ya Votó', 1, 'M', 'Estudiante', '123456'),
	('003', 5, '1', 'SAAB', 'GUTIERREZ', 'HAISAM', 'KARIM', 'Ya Votó', 1, 'M', 'Estudiante', '123456'),
	('009', 5, '1', 'OBREDOR', 'YEPES', 'JUAN', 'SEBASTIAN', 'Ya Votó', 1, 'M', 'Estudiante', '123456'),
	('010', 3, '1', 'BENITEZ', 'VASQUEZ', 'SANTIAGO', 'JOSE', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('011', 5, '1', 'FERNANDEZ', 'VIDAL', 'SARA', 'SOPHIA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('013', 8, '1', 'ARISTIZABAL', 'CONDE', 'SEBASTIAN', '', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('014', 10, '1', 'TORRES', 'RAMIREZ', 'ISABELLA', '', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('016', 3, '1', 'SANCHEZ', 'ESPINOSA', 'PEDRO', 'JULIO', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('017', -1, '1', 'HERNANDEZ', 'BALLESTA', 'JHOSUA', 'DAVID', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('018', 0, '1', 'ANDRADES', 'NARVAEZ', 'MOISES', 'ELIAS', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('019', 5, '1', 'BARON', 'NARVAEZ', 'MARIA', 'DEL CIELO', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('021', -1, '1', 'NAVARRO', 'MEJIA', 'ANTONELLA', '', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('022', -1, '1', 'MARMOL', 'LUNA', 'ABIGAIL', 'SOFIA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('023', 5, '1', 'BARRETO', 'ARDILA', 'MARIA', 'CAMILA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('024', 10, '1', 'LOPEZ', 'CASTAÑO', 'NICOLL', 'DANIELA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('025', 10, '1', 'PONNEFZ', 'FONTALVO', 'JULIANA', 'SOFIA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('026', 3, '1', 'NOVOA', 'MONTES', 'JUAN', 'FELIPE', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('027', 4, '1', 'MONTES', 'OCHOA', 'SANTIAGO', 'RAFAEL', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('028', 9, '1', 'HERNANDEZ', 'BALLESTA', 'JESUS', 'DAVID', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('029', 3, '1', 'CASTILLO', 'TAPIAS', 'LUCIANA', '', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('030', 5, '1', 'ANDRADE', 'FONTALVO', 'JESUS', 'JAVIER', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('031', 2, '1', 'GARCIA', 'YEPES', 'JULIETTA', '', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('032', 4, '1', 'ROJANO', 'TORRES', 'ALEJANDRO', 'MIGUEL', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('033', 9, '1', 'SIERRA', 'CHAMORRO', 'ANTONELLA', '', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('034', 4, '1', 'FERNANDEZ', 'TOBIAS', 'MARIANA', '', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('035', 3, '1', 'POSADA', 'HERNANDEZ', 'GABRIEL', 'JOSE', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('036', 8, '1', 'ORTIZ', 'ROMANO', 'LUIS', 'ANDRES', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('037', 3, '1', 'GOMEZ', 'CONTRERAS', 'DAVID', 'SANTIAGO', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('038', 0, '1', 'IZQUIERDO', 'OVIEDO', 'IBETH', 'JOHANA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('039', 7, '1', 'RICARDO', 'MOLINARES', 'VALENTINA', 'SOFIA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('04', 1, '1', 'GARCIA', 'ORTEGA', 'LUCIANA', '', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('040', 6, '1', 'HERRAN', 'STEVENSON', 'SEBASTIAN', '', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('041', 4, '1', 'SANCHEZ', 'LORA', 'ANA', 'LUCÍA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('042', 4, '1', 'HERRAN', 'STEVENSON', 'ESTEBAN', '', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('045', 0, '1', 'NUÑEZ', 'EUSSE', 'JERONIMO', '', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('046', 10, '1', 'LOPEZ', 'VIZCAINO', 'ANGELLY', 'YULIANA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('047', 10, '1', 'BOBADILLA', 'MIRANDA', 'ISABELLA', '', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('048', 7, '1', 'GARCIA', 'MEZA', 'JESUS', 'MANUEL', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('049', 4, '1', 'MORANTE', 'OCAMPO', 'JUAN', 'JOSE', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('051', 9, '1', 'BANQUETT', 'SIERRA', 'MELANY', 'YANITH', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('052', 10, '1', 'BARRIOS', 'MEJIA', 'MARIA', 'ELENA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('054', 2, '1', 'LORA', 'YEPES', 'MARTIN', '', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('055', 9, '1', 'MONTERO', 'NOVOA', 'TOMAS', 'GUILLERMO', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('056', 4, '1', 'OVIEDO', 'MEZA', 'KAROL', 'MARIANA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('057', 11, '1', 'RIVERA', 'CASTRO', 'ALICIA', 'ESTER', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('058', 6, '1', 'CHACON', 'COLLANTE', 'SOFIA', '', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('059', 9, '1', 'ROMERO', 'MARTINEZ', 'IVAN', 'RENE', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('06', 0, '1', 'MARTELO', 'TORRES', 'EMMA', 'MARIA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('060', 2, '1', 'DUARTE', 'MEDINA', 'THOMAS', '', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('062', 9, '1', 'CARDENAS', 'ARAGON', 'CRISTIAN', 'DAVID', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('063', 10, '1', 'PUELLO', 'BARRAZA', 'GUILLERMO', 'ALEJANDRO', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('065', 8, '1', 'PEREZ', 'BARRIOS', 'VALERIA', '', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('069', 10, '1', 'VASQUEZ', 'MORRON', 'PEDRO', 'JOSE', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('070', 8, '1', 'SALAZAR', 'MENDOZA', 'JOAQUIN', 'GABRIEL', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('071', 3, '1', 'TERAN', 'BALLESTEROS', 'JESUS', 'DAVID', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('072', 7, '1', 'VARGAS', 'TOBIAS', 'PAULA', 'ALEJANDRA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('073', 10, '1', 'CARDENAS', 'TORRES', 'ISAAC', 'DAVID', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('074', 3, '1', 'MARMOL', 'LUNA', 'DANIEL', 'ALEJANDRO', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('075', 7, '1', 'TORRES', 'TORRES', 'PAULA', 'ANDREA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('076', 3, '1', 'BOBADILLA', 'LOAIZA', 'JUAN', 'DIEGO', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('077', 0, '1', 'TORRES', 'TORRES', 'CARLOS', 'EDUARDO', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('079', 6, '1', 'MIRANDA', 'CARDENAS', 'JUAN', 'DAVID', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('080', 5, '1', 'TAPIA', 'SEÑAS', 'ALEX', 'DAVID', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('082', 2, '1', 'BENAVIDES', 'ORTEGA', 'VALENTINA', '', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('084', -1, '1', 'MUÑOZ', 'ROMERO', 'ISAAC', 'DANIEL', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('085', 9, '1', 'OCAMPO', 'SUAREZ', 'MARIA', 'ANDREA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('086', 2, '1', 'RODELO', 'REYES', 'AHINARA', 'SOFIA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('090', 2, '1', 'ANGULO', 'TORRES', 'MARIA', 'SALOME', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('091', 11, '1', 'HERNANDEZ', 'RIVERA', 'MALE', '', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('093', 5, '1', 'BOBADILLA', 'YERENA', 'SALMA', 'ISABELLA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('095', -2, '1', 'MUÑOZ', 'DE LA ROSA', 'MATIAS', '', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('096', 8, '1', 'RAMIREZ', 'ACOSTA', 'SHANNIK', 'DEL ROSARIO', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('097', 10, '1', 'SANABRIA', 'GARRIDO', 'SANTIAGO', 'DE LOS SANTOS', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('098', 7, '1', 'GALVAN', 'TAPIA', 'HENRY', '', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('099', 9, '1', 'CONSUEGRA', 'ROMERO', 'NICOLAS', 'ANDRÉS', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('100', 4, '1', 'PIMIENTA', 'ORTEGA', 'JESUS', 'ALEJANDRO', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('101', 7, '1', 'CARDENAS', 'TORRES', 'ABRAHAM', 'DAVID', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('102', 9, '1', 'SANCHEZ', 'LORA', 'SANTIAGO', 'ANDRES', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('103', 11, '1', 'ESPITALETA', 'LEGUIA', 'ESMERALDA', '', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('106', -2, '1', 'TORRES', 'ORTEGA', 'ROCIO', 'DEL CARMEN', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('108', 0, '1', 'LUNAS', 'MARQUEZ', 'DYLAN', 'JAVIER', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('109', 7, '1', 'ANDRADE', 'TORRES', 'RENE', 'ARMANDO', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('110', 0, '1', 'RODRIGUEZ', 'PELUFFO', 'JOSE', 'FERNANDO', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('111', 9, '1', 'SALAZAR', 'BERNAL', 'CHINDAU', '', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('112', 1, '1', 'PEREZ', 'MERCADO', 'VALERY', 'SOFIA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('114', 11, '1', 'GARIZAO', 'QUESADA', 'SHADIA', 'VALENTINA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('115', 6, '1', 'PEREZ', 'MERCADO', 'AURA', 'SOFIA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('116', 6, '1', 'MONTES', 'YEPES', 'JUAN', 'JOSE', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('117', 2, '1', 'SIERRA', 'FERRER', 'LEANDRO', 'JOSE', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('118', 7, '1', 'LOZANO', 'TORRES', 'ISABELLA', '', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('121', 9, '1', 'GIRALDO', 'PEREZ', 'DIEGO', 'ALEJANDRO', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('124', 3, '1', 'BARRAZA', 'ZAPATA', 'JULIANA', '', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('127', 6, '1', 'ROJANO', 'COTES', 'VALERIA', 'SOFIA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('129', 4, '1', 'SANCHEZ', 'ROJANO', 'VICTORIA', '', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('130', 11, '1', 'HERRERA', 'VARGAS', 'JUAN', 'DAVID', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('132', 11, '1', 'HERRERA', 'PEREA', 'SEBASTIAN', 'ELIAS', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('133', 11, '1', 'GARRIDO', 'TAPIA', 'FRANSCESKA', '', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('135', 0, '1', 'GARCIA', 'ESTRADA', 'SAMUEL', 'ELIAS', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('137', 11, '1', 'RICO', 'RODRIGUEZ', 'DANIELA', 'ANDREA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('138', -1, '1', 'SERRANO', 'FONTALVO', 'CESAR', 'RAFAEL', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('139', 8, '1', 'HERRERA', 'DUARTE', 'ISAAC', 'DANIEL', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('141', 10, '1', 'VARGAS', 'HERRERA', 'FABIAN', 'HUMBERTO', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('142', 2, '1', 'BARRIOS', 'CASTRO', 'TOMAS', '', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('144', 5, '1', 'MORANTE', 'OCAMPO', 'CAMILA', 'ANDREA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('145', 11, '1', 'MONTES', 'SALAZAR', 'SAMUEL', 'DAVID', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('146', 8, '1', 'VILORIA', 'CABEZA', 'DARIANA', 'MARCELA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('147', 10, '1', 'VEGA', 'TORRES', 'JESUS', 'DAVID', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('149', 1, '1', 'VERGARA', 'RODRIGUEZ', 'NICOLAS', 'ALFONSO', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('151', 7, '1', 'ROJANO', 'TORRES', 'LUNA', 'SOFIA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('152', 3, '1', 'DIAZ', 'SISILIANO', 'ISABELLA', '', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('154', 0, '1', 'MARTINEZ', 'CASTILLO', 'MATHIAS', 'ALEJANDRO', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('156', 7, '1', 'MARQUEZ', 'SANCHEZ', 'LUZ', 'ANGELA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('157', 8, '1', 'YEPES', 'ARRIETA', 'LUISA', 'DANIELA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('160', -1, '1', 'BERROCAL', 'FONSECA', 'DANIEL', 'ELIAS', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('161', 2, '1', 'TORRES', 'COHEN', 'SARA', 'SOFIA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('162', 0, '1', 'TERAN', 'BALLESTEROS', 'JOSE', 'DAVID', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('163', 2, '1', 'PEREZ', 'SIERRA', 'SALOME', '', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('165', 3, '1', 'BOBADILLA', 'YERENA', 'MARIANA', 'SOFIA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('168', 2, '1', 'BARRERO', 'PALIS', 'MARIA', 'FERNANDA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('169', 4, '1', 'PULGAR', 'LORA', 'LUISA', 'FERNANDA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('170', 4, '1', 'VILLEGAS', 'QUESADA', 'LUISA', 'VALENTINA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('171', 6, '1', 'MEDINA', 'MONTES', 'MARIANA', 'MICHELLE', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('172', 3, '1', 'ARRIETA', 'HERNANDEZ', 'ALEJANDRO', '', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('173', 8, '1', 'ESPITALETA', 'LEGUIA', 'ESTEFANIA', '', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('174', 6, '1', 'DEL VALLE', 'MUÑOZ', 'ANDRES', 'MAURICIO', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('175', 9, '1', 'DONADO', 'TORRES', 'JOSE', 'EDUARDO', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('177', 10, '1', 'NOVOA', 'MONTES', 'MARIA', 'VALENTINA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('179', 3, '1', 'ANGULO', 'TORRES', 'SANTIAGO', 'JOSE', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('180', 4, '1', 'TORRES', 'BERRIO', 'LUCIANA', 'VALENTINA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('182', 9, '1', 'THERAN', 'PINEDA', 'LUIS', 'ARMANDO', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('183', 8, '1', 'DONADO', 'TORRES', 'SAMUEL', 'JOSE', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('185', 1, '1', 'VASQUEZ', 'BATISTA', 'IKER', 'ADRIAN', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('188', 6, '1', 'PEÑA', 'HERNANDEZ', 'EMILIA', '', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('190', 1, '1', 'VASQUEZ', 'MORRON', 'MARIAM', 'JOSE', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('191', 9, '1', 'BARRAZA', 'RODRIGUEZ', 'JUAN', 'MANUEL', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('192', 1, '1', 'IBAÑEZ', 'DIAZ', 'VALERY', 'SOFIA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('193', 5, '1', 'PORTO', 'MERIÑO', 'JAVIER', 'SAUL', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('195', 1, '1', 'BENITEZ', 'VASQUEZ', 'ISABELLA', '', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('196', 8, '1', 'SUAREZ', 'GOMEZ', 'LAURA', 'MARGARITA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('197', 1, '1', 'VEGA', 'TORRES', 'SAMUEL', 'DAVID', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('198', 7, '1', 'CORDERO', 'HERRERA', 'MARIA', 'MERCEDES', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('200', 1, '1', 'HERNANDEZ', 'PEREZ', 'MARIANA', '', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('202', 6, '1', 'RAMIREZ', 'ACOSTA', 'SERGIO', 'LUIS', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('204', 1, '1', 'ROJANO', 'TAPIA', 'LUCIANA', '', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('206', 6, '1', 'JARAMILLO', 'CASTRO', 'SEBASTIAN', 'FELIPE', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('207', 3, '1', 'PEREZ', 'ROMERO', 'SEBASTIAN', 'DE JESUS', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('209', 5, '1', 'NUÑEZ', 'EUSSE', 'PABLO', '', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('210', 6, '1', 'GARCIA', 'RAMOS', 'ISABELLA', 'JOSE', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('212', 9, '1', 'MUÑOZ', 'PEREZ', 'CARLOS', 'MAURICIO', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('213', 7, '1', 'BARRAZA', 'ROCHA', 'NIKOLE', '', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('214', 2, '1', 'GOMEZ', 'RODRIGUEZ', 'JORGE', 'ENRIQUE', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('216', 5, '1', 'IZQUIERDO', 'OVIEDO', 'CARLOS', 'ALBERTO', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('217', 7, '1', 'SANTIS', 'VITOLA', 'DANNA', 'SOFIA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('218', 5, '1', 'BOBADILLA', 'PEÑATE', 'VALERI', 'NICOLLE', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('219', -2, '1', 'HERRERA', 'PAREDES', 'JUAN', 'PABLO', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('220', 3, '1', 'NAVARRO', 'MARTELO', 'ISABELLA', 'VALENTINA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('221', 2, '1', 'CHAMORRO', 'FERNANDEZ', 'ISAAC', 'DAVID', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('222', 1, '1', 'VASQUEZ', 'MORRON', 'MARIE', 'JOSE', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('223', 4, '1', 'PINTO', 'VELANDIA', 'MARIAPAZ', '', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('226', 8, '1', 'HERRERA', 'PEREA', 'JUAN', 'GUILLERMO', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('227', 5, '1', 'SIERRA', 'FLOREZ', 'VALERIA', 'CRISTINA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('229', 11, '1', 'DUARTE', 'MEDINA', 'BLADIMIR', 'JOSÉ', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('230', 11, '1', 'VASQUEZ', 'GONZALEZ', 'ZHARICK', 'ALEJANDRA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('231', 4, '1', 'JIMENEZ', 'LEGUIA', 'JUAN', 'JOSE', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('233', 10, '1', 'NOBMAN', 'BELTRAN', 'OLGA', 'LUCIA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('234', 0, '1', 'MARTELO', 'TORRES', 'GABRIEL', 'ALEJANDRO', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('237', 2, '1', 'GUTIERREZ', 'RODRIGUEZ', 'ELIAS', 'SAMUEL', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('239', 8, '1', 'TAPIA', 'MONTES', 'IVAN', 'RAMIRO', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('240', 6, '1', 'MONTERO', 'NOVOA', 'ISABEL', 'SOFIA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('241', 5, '1', 'GOMEZ', 'CONTRERAS', 'THOMAS', 'ANDRES', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('242', 6, '1', 'RICO', 'ROJANO', 'ALEJANDRO', 'JAVIER', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('243', -1, '1', 'RUA', 'CARDENAS', 'MANUELA', '', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('245', 0, '1', 'BUSTAMANTE', 'ROJANO', 'MARIA', 'GABRIELA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('246', 6, '1', 'DIAZ', 'OROZCO', 'ANDRES', 'FELIPE', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('247', 8, '1', 'RAMIREZ', 'FERNANDEZ', 'LAURA', 'SOFIA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('248', 2, '1', 'SUAREZ', 'TAPIA', 'MATIAS', 'ANDRES', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('249', -1, '1', 'BARRAZA', 'DIAZ', 'JUAN', 'SEBASTIAN', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('250', 7, '1', 'MEZA', 'JABBA', 'ABRAHAM', 'ISAAC', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('253', 7, '1', 'NOVOA', 'CARDENAS', 'DANIELA', '', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('255', 10, '1', 'PEREZ', 'BOBADILLA', 'ISABELA', 'MARIA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('257', 10, '1', 'BARRIOS', 'TOBIAS', 'MARÍA', 'JOSE', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('258', 7, '1', 'MENDOZA', 'RODELO', 'AVRIL', '', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('260', 9, '1', 'BAYUELO', 'MUÑOZ', 'GABRIELA', '', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('262', 8, '1', 'ARROYO', 'LEYVA', 'MARIA', 'JOSE', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('263', 10, '1', 'SOSA', 'VERGARA', 'SEBASTIAN', 'EDUARDO', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('264', 3, '1', 'PEÑALOZA', 'ROSSI', 'JUAN', 'DIEGO', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('265', 5, '1', 'VILLAVECES', 'PALACIO', 'GABRIELA', '', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('266', 1, '1', 'RONCALLO', 'BLANQUICET', 'PAULINA', 'SOFIA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('268', 9, '1', 'MEZA', 'MUÑOZ', 'ALFREDO', 'JOSE', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('269', 7, '1', 'ORTIZ', 'TAPIA', 'SOFIA', 'FERNANDA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('270', 6, '1', 'PEREZ', 'LOPEZ', 'CAMILA', 'ANDREA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('271', 8, '1', 'YEPES', 'TORRES', 'VALERIA', '', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('273', 6, '1', 'MARCHENA', 'PUELLO', 'DANIEL', 'ALEJANDRO', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('275', 10, '1', 'LONDOÑO', 'SERMEÑO', 'JOZEF', 'ISAAC', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('277', 10, '1', 'OLEA', 'CASTRO', 'FAIRUZ', 'SALETH', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('278', 8, '1', 'ROMERO', 'MARTINEZ', 'CARLOS', 'IVAN', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('279', 3, '1', 'GUZMAN', 'SALCEDO', 'DANIELA', 'SOFIA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('280', 6, '1', 'BENAVIDES', 'HERRERA', 'MARIANA', '', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('281', 8, '1', 'CARDENAS', 'BARRANCO', 'JUAN', 'SEBASTIAN', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('282', 2, '1', 'GALVAN', 'TAPIA', 'ISABELLA', '', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('284', 11, '1', 'TORRES', 'NADAFF', 'LIBARDO', 'JOSE', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('286', 11, '1', 'PONNEFZ', 'PARDO', 'VALERIE', 'SOFIA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('287', 10, '1', 'PIMIENTA', 'ORTEGA', 'MARIANA', '', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('288', 11, '1', 'PALIS', 'HERNANDEZ', 'ZAKILLE', '', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('289', 11, '1', 'ATENCIA', 'GUEVARA', 'ANA', 'LUCÍA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('290', 6, '1', 'USTARIS', 'SANTOS', 'JULIO', 'ENRIQUE', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('291', 2, '1', 'CARDOZO', 'BAYUELO', 'MARIANGEL', '', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('292', 8, '1', 'BENITEZ', 'CASTILLO', 'NATALIA', 'MARCELA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('294', 5, '1', 'LEGUIA', 'TAPIA', 'ZAHARASOFIA', '', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('295', 0, '1', 'FONSECA', 'BUELVAS', 'ENMANUEL', '', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('296', 0, '1', 'MUÑOZ', 'DE LA ROSA', 'ISABELLA', '', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('297', 1, '1', 'PINTO', 'VELANDIA', 'LUCIANA', '', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('302', 1, '1', 'MEDINA', 'TAPIA', 'SALOME', '', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('304', 7, '1', 'PALIS', 'HERNANDEZ', 'RAFIK', 'ELIAS', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('305', 1, '1', 'BENITEZ', 'VASQUEZ', 'ANTONELLA', '', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('308', 11, '1', 'OBREDOR', 'PELUFFO', 'MARIANA', 'SOFIA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('309', 4, '1', 'MORA', 'MOLINARES', 'MARIA', 'PAULA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('310', 2, '1', 'AMAYA', 'MONTES', 'MARTINA', '', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('311', 8, '1', 'BARRIOS', 'ANDRADE', 'MARIA', 'VICTORIA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('313', 7, '1', 'MARQUEZ', 'SANCHEZ', 'GUIDO', 'JOSE', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('314', 8, '1', 'BENITEZ', 'VASQUEZ', 'KEILA', 'VALENTINA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('315', 5, '1', 'CARRILLO', 'REYES', 'SAMUEL', 'DAVID', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('318', 2, '1', 'BLANCO', 'TEHERAN', 'JULIANA', '', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('319', 7, '1', 'HERNANDEZ', 'PATIÑO', 'DANIEL', 'FELIPE', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('320', 6, '1', 'RODRIGUEZ', 'ESCALANTE', 'JOSE', 'LUIS', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('321', 5, '1', 'JACOME', 'GONZALEZ', 'SANTIAGO', '', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('323', -1, '1', 'RAMOS', 'MARTELO', 'KAROLINA', '', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('324', 6, '1', 'BARRIOS', 'QUESADA', 'EMELY', '', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('327', 5, '1', 'OTERO', 'DIAZ', 'VALERY', 'SOFIA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('329', 7, '1', 'DUARTE', 'MEDINA', 'FRANCISCO', 'ALEJANDRO', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('332', 6, '1', 'BARRETO', 'TORRES', 'MARIA', 'JOSE', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('333', 1, '1', 'NARVAEZ', 'VERGARA', 'LUIS', 'DANIEL', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('336', 4, '1', 'GONZALEZ', 'LOPEZ', 'MATIAS', '', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('337', -1, '1', 'NADAFF', 'BERRIO', 'KHALIQ', 'ELIAS', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('338', 2, '1', 'FONTALVO', 'YOLI', 'SALOME', '', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('345', 9, '1', 'TAMARA', 'MOLINARES', 'MARIA', 'JOSE', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('346', 3, '1', 'FONSECA', 'BUELVAS', 'SHARICK', 'MARIA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('349', 7, '1', 'MIRANDA', 'ARAGON', 'ANA', 'EMILIA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('350', -1, '1', 'LEGUIA', 'ANDRADE', 'LUCIANA', 'VALENTINA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('351', 2, '1', 'CAAMAÑO', 'BARRETO', 'VALERIA', '', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('352', 7, '1', 'HERNANDEZ', 'TRUCCO', 'ALEJANDRO', '', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('354', 10, '1', 'MONTES', 'YEPES', 'JUAN', 'PABLO', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('357', 5, '1', 'VILLARRUEL', 'OROZCO', 'SOPHIA', '', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('363', 9, '1', 'NAVARRO', 'MARTELO', 'ANDREA', 'VALENTINA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('368', 5, '1', 'SUAREZ', 'ROMERO', 'VALENTINA', '', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('369', 4, '1', 'TERAN', 'BALLESTEROS', 'ALEJANDRO', 'DAVID', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('370', 8, '1', 'LONDOÑO', 'SERMEÑO', 'MISHELL', 'ROSA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('371', 11, '1', 'DURAN', 'SANDOVAL', 'JOSE', ' CARLOS', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('383', -2, '1', 'ALVAREZ', 'MEDINA', 'KEISY', 'SOFIA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('386', 7, '1', 'BOBADILLA', 'LOAIZA', 'GABRIELA', '', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('393', 9, '1', 'ALMEIDA', 'MARRUGO', 'JUAN', 'FELIPE', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('394', 6, '1', 'VARGAS', 'CHAMORRO', 'SANTIAGO', 'ELIAS', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('395', 8, '1', 'SANCHEZ', 'TAPIAS', 'KEIDER', 'JAVID', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('396', 2, '1', 'VILLARREAL', 'HERNANDEZ', 'JOSE', 'CARLO', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('400', 1, '1', 'STEVENSON', 'VANEGAS', 'ADRIANA', 'LUCIA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('402', 8, '1', 'BUELVAS', 'CARRERA', 'MIGUEL', 'ANGEL', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('404', 5, '1', 'CRUZ', 'MERIÑO', 'JUAN', 'JOSE', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('405', 9, '1', 'LUNA', 'JIMENEZ', 'MARIA', 'VALENTINA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('406', 1, '1', 'GARCIA', 'RAMOS', 'VICENTE', 'JOSE', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('410', 1, '1', 'TORRES', 'BENITEZ', 'VALERY', 'SOFIA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('411', 10, '1', 'MEZA', 'MUÑOZ', 'ANDRES', 'CAMILO', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('413', 8, '1', 'TORRES', 'ORTIZ', 'MARIA', 'PAULA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('419', 5, '1', 'LAMADRID', 'VILLAREAL', 'JUAN', 'DAVID', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('421', 3, '1', 'BARRAZA', 'ZAPATA', 'JULIAN', '', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('423', 3, '1', 'HERNANDEZ', 'ARROYO', 'VALERIA', '', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('425', 7, '1', 'VASQUEZ', 'MEJIA', 'ABRAHAN', 'ELIAS', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('427', 0, '1', 'MONTES', 'MARTINEZ', 'DANNA', 'LUCIA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('429', 1, '1', 'BARRIOS', 'QUESADA', 'STANLEY', 'DE JESUS', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('437', 2, '1', 'SANABRIA', 'GARRIDO', 'SAMUEL', 'ALEJANDRO', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('441', 0, '1', 'ARTEAGA', 'MANRIQUE', 'ANTONELLA', '', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('443', 9, '1', 'TORRES', 'NADAFF', 'ALEJANDRO', '', 'No ha votado', 1, 'M', 'Estudiante', '123456'),
	('444', 9, '1', 'PORTO', 'MERIÑO', 'LAURA', 'SOFIA', 'No ha votado', 1, 'F', 'Estudiante', '123456'),
	('5556', 9, '1', 'TAPIA', 'GARIZAO', 'ALEJANDRA', 'LUCIA', 'Inactivo', 1, '0', 'Estudiante', '123456'),
	('5557', 11, '1', 'TAPIA', 'GARIZAO', 'MARIANA', 'SOFIA', 'Inactivo', 1, '0', 'Estudiante', '123456'),
	('voto_b2021', 11, '1', 'EN BLANCO', '', 'VOTO', '', 'No ha votado', 1, '', 'Estudiante', 'Votación Cerrada');

-- Volcando estructura para tabla bdt_personeros.grados
DROP TABLE IF EXISTS `grados`;
CREATE TABLE IF NOT EXISTS `grados` (
  `idNivel` char(3) CHARACTER SET latin1 NOT NULL,
  `id` int(11) NOT NULL,
  `nombre` char(50) NOT NULL,
  `sigla` char(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_grados` (`idNivel`),
  KEY `grados_ibfk_1` (`idNivel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bdt_personeros.grados: ~14 rows (aproximadamente)
DELETE FROM `grados`;
INSERT INTO `grados` (`idNivel`, `id`, `nombre`, `sigla`) VALUES
	('PRE', -2, 'Párvulo', 'PAR'),
	('PRE', -1, 'Jardín A', 'JAR'),
	('PRE', 0, 'Grado B', 'GRB'),
	('PRI', 1, 'Primero', 'PRI'),
	('PRI', 2, 'Segundo', 'SEG'),
	('PRI', 3, 'Tercero', 'TER'),
	('PRI', 4, 'Cuarto', 'CUA'),
	('PRI', 5, 'Quinto', 'QUI'),
	('SEC', 6, 'Sexto', 'SEX'),
	('SEC', 7, 'Septimo', 'SEP'),
	('SEC', 8, 'Octavo', 'OCT'),
	('SEC', 9, 'Noveno', 'NOV'),
	('MED', 10, 'Décimo', 'DEC'),
	('MED', 11, 'Undécimo', 'UND');

-- Volcando estructura para tabla bdt_personeros.institucion
DROP TABLE IF EXISTS `institucion`;
CREATE TABLE IF NOT EXISTS `institucion` (
  `idInstitucion` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` char(150) NOT NULL,
  PRIMARY KEY (`idInstitucion`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bdt_personeros.institucion: ~0 rows (aproximadamente)
DELETE FROM `institucion`;
INSERT INTO `institucion` (`idInstitucion`, `Nombre`) VALUES
	(1, 'COLEGIO SAN RAFAEL');

-- Volcando estructura para tabla bdt_personeros.registrovotos
DROP TABLE IF EXISTS `registrovotos`;
CREATE TABLE IF NOT EXISTS `registrovotos` (
  `idEstudiante` varchar(30) NOT NULL,
  `Numero` int(11) unsigned NOT NULL,
  `Anio` char(5) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '2022',
  `fecha_reg` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`idEstudiante`,`Anio`),
  KEY `Numero` (`Numero`),
  CONSTRAINT `registrovotos_ibfk_1` FOREIGN KEY (`Numero`) REFERENCES `candidatos` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bdt_personeros.registrovotos: ~261 rows (aproximadamente)
DELETE FROM `registrovotos`;
INSERT INTO `registrovotos` (`idEstudiante`, `Numero`, `Anio`, `fecha_reg`) VALUES
	('001', 3, '2022', '2022-11-04 03:01:40'),
	('002', 3, '2022', '2022-11-04 03:03:06'),
	('003', 3, '2022', '2022-11-04 03:07:04'),
	('009', 3, '2022', '2022-11-04 03:05:09'),
	('010', 3, '2022', '2022-03-10 14:07:47'),
	('011', 2, '2022', '2022-03-10 13:48:21'),
	('013', 3, '2022', '2022-03-10 13:39:59'),
	('016', 3, '2022', '2022-03-10 14:05:42'),
	('017', 3, '2022', '2022-03-10 13:47:39'),
	('018', 3, '2022', '2022-03-10 14:05:52'),
	('019', 3, '2022', '2022-03-10 13:53:35'),
	('021', 3, '2022', '2022-03-10 13:47:11'),
	('022', 3, '2022', '2022-03-10 13:46:45'),
	('023', 3, '2022', '2022-03-10 13:51:43'),
	('024', 2, '2022', '2022-03-10 13:49:23'),
	('025', 2, '2022', '2022-03-10 13:43:42'),
	('026', 2, '2022', '2022-03-10 14:03:36'),
	('027', 2, '2022', '2022-03-10 13:39:12'),
	('028', 3, '2022', '2022-03-10 13:53:36'),
	('029', 3, '2022', '2022-03-10 14:01:55'),
	('030', 3, '2022', '2022-03-10 13:47:30'),
	('031', 3, '2022', '2022-03-10 14:15:49'),
	('032', 2, '2022', '2022-03-10 13:36:37'),
	('033', 2, '2022', '2022-03-10 13:57:52'),
	('034', 2, '2022', '2022-03-10 13:36:17'),
	('035', 2, '2022', '2022-03-10 14:07:09'),
	('036', 3, '2022', '2022-03-10 13:44:41'),
	('037', 3, '2022', '2022-03-10 14:05:19'),
	('038', 2, '2022', '2022-03-10 14:00:05'),
	('039', 3, '2022', '2022-03-10 13:44:38'),
	('04', 2, '2022', '2022-03-10 13:54:47'),
	('040', 3, '2022', '2022-03-10 13:56:57'),
	('041', 2, '2022', '2022-03-10 13:40:06'),
	('042', 2, '2022', '2022-03-10 13:40:48'),
	('045', 3, '2022', '2022-03-10 14:03:39'),
	('046', 2, '2022', '2022-03-10 13:50:25'),
	('047', 2, '2022', '2022-03-10 13:38:51'),
	('048', 3, '2022', '2022-03-10 13:48:51'),
	('049', 3, '2022', '2022-03-10 13:34:46'),
	('051', 0, '2022', '2022-03-10 14:01:33'),
	('052', 2, '2022', '2022-03-10 13:49:51'),
	('054', 3, '2022', '2022-03-10 14:13:14'),
	('055', 3, '2022', '2022-03-10 13:58:44'),
	('056', 2, '2022', '2022-03-10 13:35:59'),
	('057', 1, '2022', '2022-03-10 13:38:18'),
	('058', 2, '2022', '2022-03-10 13:55:12'),
	('059', 3, '2022', '2022-03-10 14:00:19'),
	('060', 3, '2022', '2022-03-10 14:17:39'),
	('062', 1, '2022', '2022-03-10 14:00:40'),
	('063', 3, '2022', '2022-03-10 13:39:58'),
	('065', 3, '2022', '2022-03-10 13:45:04'),
	('069', 3, '2022', '2022-03-10 13:46:47'),
	('070', 0, '2022', '2022-03-10 13:47:24'),
	('071', 3, '2022', '2022-03-10 14:06:02'),
	('072', 3, '2022', '2022-03-10 13:42:32'),
	('073', 2, '2022', '2022-03-10 13:45:23'),
	('074', 3, '2022', '2022-03-10 14:07:26'),
	('075', 3, '2022', '2022-03-10 13:42:53'),
	('076', 1, '2022', '2022-03-10 14:11:22'),
	('077', 3, '2022', '2022-03-10 14:06:10'),
	('079', 0, '2022', '2022-03-10 13:52:14'),
	('080', 2, '2022', '2022-03-10 13:53:14'),
	('082', 3, '2022', '2022-03-10 14:17:00'),
	('084', 1, '2022', '2022-03-10 13:43:23'),
	('085', 3, '2022', '2022-03-10 13:55:10'),
	('086', 3, '2022', '2022-03-10 14:18:01'),
	('090', 3, '2022', '2022-03-10 14:16:32'),
	('091', 2, '2022', '2022-03-10 13:33:58'),
	('093', 3, '2022', '2022-03-10 13:49:18'),
	('095', 3, '2022', '2022-03-10 13:40:32'),
	('096', 3, '2022', '2022-03-10 13:46:07'),
	('097', 3, '2022', '2022-03-10 13:46:17'),
	('098', 0, '2022', '2022-03-10 13:46:09'),
	('099', 3, '2022', '2022-03-10 13:54:28'),
	('100', 2, '2022', '2022-03-10 13:34:25'),
	('101', 3, '2022', '2022-03-10 13:43:52'),
	('102', 3, '2022', '2022-03-10 13:57:04'),
	('103', 3, '2022', '2022-03-10 14:04:05'),
	('106', 3, '2022', '2022-03-10 13:41:42'),
	('108', 3, '2022', '2022-03-10 14:06:34'),
	('109', 3, '2022', '2022-03-10 13:45:43'),
	('110', 3, '2022', '2022-03-10 14:01:59'),
	('111', 3, '2022', '2022-03-10 13:55:54'),
	('112', 3, '2022', '2022-03-10 13:52:31'),
	('114', 1, '2022', '2022-03-10 13:40:30'),
	('115', 2, '2022', '2022-03-10 13:54:22'),
	('116', 2, '2022', '2022-03-10 13:51:26'),
	('117', 3, '2022', '2022-03-10 14:18:51'),
	('118', 3, '2022', '2022-03-10 13:39:49'),
	('121', 3, '2022', '2022-03-10 13:59:30'),
	('124', 3, '2022', '2022-03-10 14:02:18'),
	('127', 3, '2022', '2022-03-10 13:49:33'),
	('129', 2, '2022', '2022-03-10 13:37:47'),
	('130', 3, '2022', '2022-03-10 14:00:33'),
	('132', 3, '2022', '2022-03-10 13:57:07'),
	('133', 0, '2022', '2022-03-10 14:22:02'),
	('135', 1, '2022', '2022-03-10 14:07:51'),
	('137', 2, '2022', '2022-03-10 13:56:36'),
	('138', 3, '2022', '2022-03-10 13:44:37'),
	('139', 2, '2022', '2022-03-10 13:43:21'),
	('141', 2, '2022', '2022-03-10 13:36:05'),
	('142', 3, '2022', '2022-03-10 14:11:52'),
	('144', 2, '2022', '2022-03-10 13:54:08'),
	('146', 2, '2022', '2022-03-10 13:49:31'),
	('147', 2, '2022', '2022-03-10 13:48:03'),
	('149', 3, '2022', '2022-03-10 13:50:05'),
	('151', 3, '2022', '2022-03-10 13:44:15'),
	('152', 2, '2022', '2022-03-10 14:04:50'),
	('156', 3, '2022', '2022-03-10 13:47:12'),
	('157', 3, '2022', '2022-03-10 13:50:12'),
	('160', 3, '2022', '2022-03-10 13:45:38'),
	('161', 3, '2022', '2022-03-10 14:12:32'),
	('162', 3, '2022', '2022-03-10 14:06:56'),
	('163', 3, '2022', '2022-03-10 14:14:25'),
	('165', 2, '2022', '2022-03-10 14:03:55'),
	('168', 2, '2022', '2022-03-10 14:18:28'),
	('169', 2, '2022', '2022-03-10 13:39:47'),
	('170', 2, '2022', '2022-03-10 13:32:41'),
	('171', 2, '2022', '2022-03-10 13:54:55'),
	('172', 2, '2022', '2022-03-10 14:08:12'),
	('173', 3, '2022', '2022-03-10 13:42:54'),
	('175', 3, '2022', '2022-03-10 13:53:13'),
	('177', 2, '2022', '2022-03-10 13:52:33'),
	('179', 3, '2022', '2022-03-10 14:06:48'),
	('180', 2, '2022', '2022-03-10 13:35:41'),
	('182', 3, '2022', '2022-03-10 13:59:59'),
	('183', 2, '2022', '2022-03-10 13:42:23'),
	('188', 3, '2022', '2022-03-10 13:56:08'),
	('190', 3, '2022', '2022-03-10 13:59:02'),
	('191', 2, '2022', '2022-03-10 13:52:03'),
	('192', 2, '2022', '2022-03-10 13:56:08'),
	('193', 3, '2022', '2022-03-10 13:42:02'),
	('195', 3, '2022', '2022-03-10 13:56:55'),
	('196', 3, '2022', '2022-03-10 14:02:02'),
	('197', 2, '2022', '2022-03-10 13:58:13'),
	('198', 3, '2022', '2022-03-10 13:44:56'),
	('200', 3, '2022', '2022-03-10 13:50:36'),
	('202', 3, '2022', '2022-03-10 13:52:42'),
	('204', 3, '2022', '2022-03-10 13:52:55'),
	('206', 3, '2022', '2022-03-10 13:50:29'),
	('207', 3, '2022', '2022-03-10 14:08:38'),
	('209', 2, '2022', '2022-03-10 13:43:40'),
	('210', 2, '2022', '2022-03-10 13:53:00'),
	('212', 3, '2022', '2022-03-10 13:59:11'),
	('213', 2, '2022', '2022-03-10 13:40:33'),
	('214', 3, '2022', '2022-03-10 14:19:17'),
	('216', 2, '2022', '2022-03-10 13:48:46'),
	('217', 3, '2022', '2022-03-10 13:43:18'),
	('218', 1, '2022', '2022-03-10 13:44:35'),
	('220', 3, '2022', '2022-03-10 14:03:08'),
	('221', 3, '2022', '2022-03-10 14:12:50'),
	('222', 3, '2022', '2022-03-10 13:57:52'),
	('223', 2, '2022', '2022-03-10 13:40:26'),
	('226', 3, '2022', '2022-03-10 13:43:47'),
	('227', 2, '2022', '2022-03-10 13:41:37'),
	('229', 3, '2022', '2022-03-10 14:03:37'),
	('230', 3, '2022', '2022-03-10 13:36:57'),
	('231', 2, '2022', '2022-03-10 13:36:56'),
	('233', 2, '2022', '2022-03-10 13:52:06'),
	('234', 3, '2022', '2022-03-10 14:07:26'),
	('237', 3, '2022', '2022-03-10 14:20:28'),
	('239', 2, '2022', '2022-03-10 13:48:35'),
	('240', 2, '2022', '2022-03-10 13:57:44'),
	('241', 2, '2022', '2022-03-10 13:46:50'),
	('242', 3, '2022', '2022-03-10 13:49:59'),
	('243', 3, '2022', '2022-03-10 13:48:07'),
	('245', 2, '2022', '2022-03-10 14:01:25'),
	('246', 3, '2022', '2022-03-10 13:50:50'),
	('247', 2, '2022', '2022-03-10 13:46:35'),
	('248', 3, '2022', '2022-03-10 14:19:42'),
	('249', 3, '2022', '2022-03-10 13:45:08'),
	('250', 3, '2022', '2022-03-10 13:48:21'),
	('255', 2, '2022', '2022-03-10 13:43:05'),
	('257', 3, '2022', '2022-03-10 13:51:30'),
	('258', 3, '2022', '2022-03-10 13:43:34'),
	('260', 3, '2022', '2022-03-10 13:56:39'),
	('262', 3, '2022', '2022-03-10 13:40:45'),
	('263', 2, '2022', '2022-03-10 13:48:38'),
	('264', 3, '2022', '2022-03-10 14:06:28'),
	('265', 2, '2022', '2022-03-10 13:52:48'),
	('266', 2, '2022', '2022-03-10 13:51:05'),
	('268', 3, '2022', '2022-03-10 13:54:06'),
	('269', 2, '2022', '2022-03-10 13:46:47'),
	('270', 2, '2022', '2022-03-10 13:53:45'),
	('271', 3, '2022', '2022-03-10 13:50:41'),
	('273', 3, '2022', '2022-03-10 13:58:08'),
	('275', 2, '2022', '2022-03-10 13:44:20'),
	('277', 3, '2022', '2022-03-10 13:50:59'),
	('278', 3, '2022', '2022-03-10 13:47:00'),
	('279', 3, '2022', '2022-03-10 14:01:10'),
	('280', 3, '2022', '2022-03-10 13:51:53'),
	('281', 3, '2022', '2022-03-10 13:41:51'),
	('282', 3, '2022', '2022-03-10 14:15:31'),
	('284', 3, '2022', '2022-03-10 14:02:45'),
	('286', 2, '2022', '2022-03-10 13:42:30'),
	('287', 2, '2022', '2022-03-10 13:39:27'),
	('288', 2, '2022', '2022-03-10 13:41:54'),
	('289', 2, '2022', '2022-03-10 13:55:15'),
	('290', 3, '2022', '2022-03-10 13:51:07'),
	('291', 2, '2022', '2022-03-10 14:10:27'),
	('292', 3, '2022', '2022-03-10 13:45:30'),
	('294', 3, '2022', '2022-03-10 13:42:31'),
	('295', 3, '2022', '2022-03-10 14:05:27'),
	('297', 3, '2022', '2022-03-10 13:51:32'),
	('302', 3, '2022', '2022-03-10 13:51:55'),
	('304', 2, '2022', '2022-03-10 13:48:05'),
	('305', 2, '2022', '2022-03-10 13:56:34'),
	('308', 3, '2022', '2022-03-10 13:37:30'),
	('309', 3, '2022', '2022-03-10 13:33:11'),
	('310', 3, '2022', '2022-03-10 14:14:48'),
	('311', 2, '2022', '2022-03-10 13:47:43'),
	('313', 3, '2022', '2022-03-10 13:45:23'),
	('314', 3, '2022', '2022-03-10 13:51:18'),
	('315', 3, '2022', '2022-03-10 13:52:27'),
	('318', 3, '2022', '2022-03-10 14:13:35'),
	('320', 3, '2022', '2022-03-10 13:56:34'),
	('321', 3, '2022', '2022-03-10 13:45:43'),
	('324', 3, '2022', '2022-03-10 13:54:02'),
	('327', 2, '2022', '2022-03-10 13:52:07'),
	('329', 3, '2022', '2022-03-10 13:49:10'),
	('332', 3, '2022', '2022-03-10 13:57:17'),
	('333', 3, '2022', '2022-03-10 13:57:12'),
	('336', 2, '2022', '2022-03-10 13:38:07'),
	('337', 3, '2022', '2022-03-10 13:46:07'),
	('338', 3, '2022', '2022-03-10 14:12:10'),
	('345', 3, '2022', '2022-03-10 13:58:21'),
	('346', 3, '2022', '2022-03-10 14:02:39'),
	('350', 3, '2022', '2022-03-10 13:44:05'),
	('351', 3, '2022', '2022-03-10 14:13:57'),
	('352', 2, '2022', '2022-03-10 13:47:42'),
	('354', 3, '2022', '2022-03-10 13:44:47'),
	('357', 3, '2022', '2022-03-10 13:45:00'),
	('363', 3, '2022', '2022-03-10 14:01:07'),
	('368', 2, '2022', '2022-03-10 13:47:58'),
	('369', 2, '2022', '2022-03-10 13:30:45'),
	('370', 3, '2022', '2022-03-10 13:44:17'),
	('371', 1, '2022', '2022-03-10 13:41:15'),
	('383', 3, '2022', '2022-03-10 13:42:20'),
	('386', 3, '2022', '2022-03-10 13:42:14'),
	('393', 3, '2022', '2022-03-10 13:57:29'),
	('394', 3, '2022', '2022-03-10 14:20:52'),
	('395', 2, '2022', '2022-03-10 13:48:06'),
	('396', 2, '2022', '2022-03-10 14:09:28'),
	('400', 3, '2022', '2022-03-10 13:55:14'),
	('402', 3, '2022', '2022-03-10 13:41:16'),
	('404', 3, '2022', '2022-03-10 13:46:18'),
	('405', 2, '2022', '2022-03-10 13:52:30'),
	('406', 3, '2022', '2022-03-10 13:58:38'),
	('410', 3, '2022', '2022-03-10 13:55:38'),
	('411', 3, '2022', '2022-03-10 13:47:29'),
	('413', 2, '2022', '2022-03-10 13:49:05'),
	('419', 2, '2022', '2022-03-10 13:44:07'),
	('421', 3, '2022', '2022-03-10 14:04:14'),
	('423', 3, '2022', '2022-03-10 14:08:53'),
	('425', 3, '2022', '2022-03-10 13:46:28'),
	('427', 2, '2022', '2022-03-10 14:04:40'),
	('429', 3, '2022', '2022-03-10 13:57:30'),
	('437', 3, '2022', '2022-03-10 14:09:49'),
	('441', 2, '2022', '2022-03-10 14:00:53'),
	('443', 3, '2022', '2022-03-10 13:54:49'),
	('444', 3, '2022', '2022-03-10 13:55:29');

-- Volcando estructura para tabla bdt_personeros.usuarios
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` char(50) NOT NULL,
  `contrasena` char(150) NOT NULL,
  `nombre` char(255) DEFAULT NULL,
  `rol` char(255) DEFAULT NULL,
  `estado` char(150) DEFAULT NULL,
  `idInstitucion` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_usuarios_Institucion1_idx` (`idInstitucion`),
  CONSTRAINT `usu` FOREIGN KEY (`idInstitucion`) REFERENCES `institucion` (`idInstitucion`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bdt_personeros.usuarios: ~2 rows (aproximadamente)
DELETE FROM `usuarios`;
INSERT INTO `usuarios` (`id`, `contrasena`, `nombre`, `rol`, `estado`, `idInstitucion`) VALUES
	('Jose', '73429935', 'Jose Alfredo Tapia Arroyo', 'Administrador', 'Activo', 1),
	('Jurado', 'j123', 'JURADO', 'Jurado', 'Activo', 1);

-- Volcando estructura para procedimiento bdt_personeros.abstencion
DROP PROCEDURE IF EXISTS `abstencion`;
DELIMITER //
CREATE PROCEDURE `abstencion`()
BEGIN
SELECT al.`SEXO`,COUNT(al.estado) AS 'Votos' FROM estudiantes al WHERE (al.`estado`='No ha votado' or estado = 'Inactivo') AND sexo <> "" GROUP BY al.`SEXO` ORDER BY al.SEXO DESC;
END//
DELIMITER ;

-- Volcando estructura para procedimiento bdt_personeros.agregarCandidato
DROP PROCEDURE IF EXISTS `agregarCandidato`;
DELIMITER //
CREATE PROCEDURE `agregarCandidato`(
	IN `idEstudiante` VARCHAR(50),
	IN `foto` VARCHAR(150),
	IN `color` VARCHAR(50),
	IN `partido` VARCHAR(120)
)
BEGIN
	INSERT INTO  `candidatos` (`FOTO`, `alumnos_CODEST`,`color`,`partido`) VALUES (foto, idEstudiante, color,partido);
END//
DELIMITER ;

-- Volcando estructura para procedimiento bdt_personeros.agregarEstudiante
DROP PROCEDURE IF EXISTS `agregarEstudiante`;
DELIMITER //
CREATE PROCEDURE `agregarEstudiante`(
	IN `id` VARCHAR(50),
	IN `grado` INT,
	IN `grupo` INT,
	IN `apellido1` VARCHAR(50),
	IN `apellido2` VARCHAR(50),
	IN `nombre1` VARCHAR(50),
	IN `nombre2` VARCHAR(50),
	IN `sexo` INT
)
BEGIN
INSERT INTO estudiantes (`id`,`grado`,`grupo`,`apellido1`,`apellido2`,`nombre1`,`nombre2`,`sexo`) VALUES (id,grado,grupo,apellido1,apellido2,nombre1,nombre2,sexo);
END//
DELIMITER ;

-- Volcando estructura para procedimiento bdt_personeros.cargarEstudiante
DROP PROCEDURE IF EXISTS `cargarEstudiante`;
DELIMITER //
CREATE PROCEDURE `cargarEstudiante`(
	IN `idEstudiante` VARCHAR(50)
)
BEGIN
SELECT * FROM estudiantes WHERE id = idEstudiante;
END//
DELIMITER ;

-- Volcando estructura para procedimiento bdt_personeros.cargarUsuario
DROP PROCEDURE IF EXISTS `cargarUsuario`;
DELIMITER //
CREATE PROCEDURE `cargarUsuario`(in usuario varchar(30),in pass varchar(20))
BEGIN
	select est.id,concat(nombre1," ",nombre2," ",apellido1," ",apellido2) as nombre, est.rol, est.`estado`,est.`codInst` from estudiantes est WHERE est.id = usuario AND est.contrasena = pass union select us.id,us.nombre,us.rol,us.estado,us.idInstitucion from usuarios us where us.id = usuario and us.contrasena = pass;   
    END//
DELIMITER ;

-- Volcando estructura para procedimiento bdt_personeros.conteoVotosCandidato
DROP PROCEDURE IF EXISTS `conteoVotosCandidato`;
DELIMITER //
CREATE PROCEDURE `conteoVotosCandidato`(
	IN `candidato` int
)
BEGIN
	SELECT vt.Numero AS id, COUNT(vt.Numero) AS 'Votos' 
	FROM registrovotos vt
	WHERE vt.Numero = candidato GROUP BY vt.`Numero` ORDER BY 'Votos' DESC;
END//
DELIMITER ;

-- Volcando estructura para procedimiento bdt_personeros.eliminarEstudiante
DROP PROCEDURE IF EXISTS `eliminarEstudiante`;
DELIMITER //
CREATE PROCEDURE `eliminarEstudiante`(
	IN `id` VARCHAR(50)
)
BEGIN
DELETE FROM estudiantes WHERE `id`=id;
END//
DELIMITER ;

-- Volcando estructura para procedimiento bdt_personeros.listarCandidatos
DROP PROCEDURE IF EXISTS `listarCandidatos`;
DELIMITER //
CREATE PROCEDURE `listarCandidatos`()
BEGIN
	SELECT ca.*,est.* FROM candidatos ca INNER JOIN estudiantes est ON est.id = ca.alumnos_CODEST;
    END//
DELIMITER ;

-- Volcando estructura para procedimiento bdt_personeros.listarConteo
DROP PROCEDURE IF EXISTS `listarConteo`;
DELIMITER //
CREATE PROCEDURE `listarConteo`()
BEGIN
	SELECT vt.Numero AS id, COUNT(vt.Numero) AS 'Votos' 
	FROM registrovotos vt
	GROUP BY vt.`Numero` ORDER BY 'Votos' DESC;
END//
DELIMITER ;

-- Volcando estructura para procedimiento bdt_personeros.listarEstudiantes
DROP PROCEDURE IF EXISTS `listarEstudiantes`;
DELIMITER //
CREATE PROCEDURE `listarEstudiantes`()
BEGIN
SELECT * FROM estudiantes;
END//
DELIMITER ;

-- Volcando estructura para procedimiento bdt_personeros.listarGrados
DROP PROCEDURE IF EXISTS `listarGrados`;
DELIMITER //
CREATE PROCEDURE `listarGrados`()
BEGIN
	SELECT * FROM grados ORDER BY id ASC;
END//
DELIMITER ;

-- Volcando estructura para procedimiento bdt_personeros.modificarEstudiante
DROP PROCEDURE IF EXISTS `modificarEstudiante`;
DELIMITER //
CREATE PROCEDURE `modificarEstudiante`(
	IN `id` VARCHAR(50),
	IN `grado` INT,
	IN `grupo` INT,
	IN `apellido1` VARCHAR(60),
	IN `apellido2` VARCHAR(60),
	IN `nombre1` VARCHAR(60),
	IN `nombre2` VARCHAR(60),
	IN `sexo` VARCHAR(50)
)
BEGIN
UPDATE estudiantes SET `grado`=grado, `grupo`=grupo, `apellido1`=apellido1, `apellido2`=apellido2, `nombre1`=nombre1, `nombre2`=nombre2, `sexo`=sexo WHERE `id`=id;
END//
DELIMITER ;

-- Volcando estructura para procedimiento bdt_personeros.registrar_votos
DROP PROCEDURE IF EXISTS `registrar_votos`;
DELIMITER //
CREATE PROCEDURE `registrar_votos`(
	IN `idEst` VARCHAR(50),
	IN `candidato` INT,
	IN `anho` INT
)
BEGIN
	INSERT INTO registrovotos (idEstudiante,Numero, Anio) VALUES (idEst,candidato,anho);
	UPDATE estudiantes SET estado='Ya Votó' WHERE id = idEst;
END//
DELIMITER ;

-- Volcando estructura para procedimiento bdt_personeros.toogleVotacion
DROP PROCEDURE IF EXISTS `toogleVotacion`;
DELIMITER //
CREATE PROCEDURE `toogleVotacion`(
	IN `estado` VARCHAR(50)
)
BEGIN
UPDATE estudiantes SET estado = estado WHERE estado = 'Inactivo' OR estado = 'No ha votado';
END//
DELIMITER ;

-- Volcando estructura para procedimiento bdt_personeros.total_votantes
DROP PROCEDURE IF EXISTS `total_votantes`;
DELIMITER //
CREATE PROCEDURE `total_votantes`()
BEGIN
SELECT COUNT(estado) AS 'Votantes' FROM estudiantes WHERE SEXO <>"";
END//
DELIMITER ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
