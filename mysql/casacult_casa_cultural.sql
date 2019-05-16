-- MySQL dump 10.13  Distrib 5.6.40-84.0, for Linux (x86_64)
--
-- Host: localhost    Database: casacult_casa_cultural
-- ------------------------------------------------------
-- Server version	5.6.40-84.0-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Administrador`
--

DROP TABLE IF EXISTS `Administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Administrador` (
  `idAdministrador` int(11) NOT NULL AUTO_INCREMENT,
  `cedula_admin` int(11) DEFAULT NULL,
  `tipoAdministrador` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Super, Editor, Gestor',
  `estado` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'activo/inactivo',
  PRIMARY KEY (`idAdministrador`),
  KEY `fk_administrador_idx` (`cedula_admin`),
  CONSTRAINT `fk_administrador` FOREIGN KEY (`cedula_admin`) REFERENCES `Usuario` (`cedula`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Administrador`
--

LOCK TABLES `Administrador` WRITE;
/*!40000 ALTER TABLE `Administrador` DISABLE KEYS */;
INSERT INTO `Administrador` (`idAdministrador`, `cedula_admin`, `tipoAdministrador`, `estado`) VALUES (29,111111111,'Super','activo'),(30,111111112,'Super','activo'),(31,111111114,'Gestor','activo'),(32,111111115,'Editor','activo');
/*!40000 ALTER TABLE `Administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comprobante`
--

DROP TABLE IF EXISTS `Comprobante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comprobante` (
  `id` int(40) NOT NULL AUTO_INCREMENT COMMENT 'Número que se despliega en comprobante',
  `id_matricula` int(40) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_matricula` (`id_matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comprobante`
--

LOCK TABLES `Comprobante` WRITE;
/*!40000 ALTER TABLE `Comprobante` DISABLE KEYS */;
/*!40000 ALTER TABLE `Comprobante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Curso`
--

DROP TABLE IF EXISTS `Curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Curso` (
  `idCurso` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `cupo` int(11) NOT NULL,
  `horario` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `informacion` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`idCurso`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Curso`
--

LOCK TABLES `Curso` WRITE;
/*!40000 ALTER TABLE `Curso` DISABLE KEYS */;
INSERT INTO `Curso` (`idCurso`, `nombre`, `cupo`, `horario`, `informacion`) VALUES (4,'Dibujo basico',2,'Lunes 9:00 - 11:00','Cuaderno, lápiz, hojas.'),(20,'Dibujo Avanzado',22,'Martes 15:00 - 18:00','Curso para estudiantes avanzados de dibujo. ');
/*!40000 ALTER TABLE `Curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Curso_X_Periodo`
--

DROP TABLE IF EXISTS `Curso_X_Periodo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Curso_X_Periodo` (
  `id` int(40) NOT NULL AUTO_INCREMENT,
  `idCurso` int(40) NOT NULL,
  `idPeriodo` int(40) NOT NULL,
  `idProfesorAsignado` int(40) NOT NULL,
  `estado` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'disponible',
  `observaciones` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_curso_idx` (`idCurso`) USING BTREE,
  KEY `fk_id_periodo_idx` (`idPeriodo`) USING BTREE,
  KEY `fk_id_profesor_idx` (`idProfesorAsignado`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Curso_X_Periodo`
--

LOCK TABLES `Curso_X_Periodo` WRITE;
/*!40000 ALTER TABLE `Curso_X_Periodo` DISABLE KEYS */;
INSERT INTO `Curso_X_Periodo` (`id`, `idCurso`, `idPeriodo`, `idProfesorAsignado`, `estado`, `observaciones`) VALUES (13,15,22,26,'cerrado',''),(25,4,37,37,'disponible',''),(26,20,37,37,'disponible','');
/*!40000 ALTER TABLE `Curso_X_Periodo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Direccion`
--

DROP TABLE IF EXISTS `Direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Direccion` (
  `iddireccion` int(11) NOT NULL AUTO_INCREMENT,
  `provincia` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `canton` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `distrito` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `sennas` varchar(240) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `id_profesor` int(11) NOT NULL,
  PRIMARY KEY (`iddireccion`),
  UNIQUE KEY `iddireccion` (`iddireccion`),
  KEY `fk_id_profesor_idx` (`id_profesor`),
  CONSTRAINT `fk_id_profesor_direccion` FOREIGN KEY (`id_profesor`) REFERENCES `Profesor` (`idProfesor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Direccion`
--

LOCK TABLES `Direccion` WRITE;
/*!40000 ALTER TABLE `Direccion` DISABLE KEYS */;
INSERT INTO `Direccion` (`iddireccion`, `provincia`, `canton`, `distrito`, `sennas`, `id_profesor`) VALUES (18,'San José','San José','Carmen','De la Iglesia 50 m sur, casa amarrila de un piso.',37);
/*!40000 ALTER TABLE `Direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Facturacion`
--

DROP TABLE IF EXISTS `Facturacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Facturacion` (
  `idFacturacion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `identificacion` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `razon_social` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `estado_tributario` tinyint(4) DEFAULT NULL,
  `nombre_actividad` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `codigo_actividad` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `id_profesor` int(11) DEFAULT NULL,
  PRIMARY KEY (`idFacturacion`),
  UNIQUE KEY `idfacturacion` (`idFacturacion`),
  KEY `fk_id_profesor_idx` (`id_profesor`) USING BTREE,
  CONSTRAINT `fk_id_profesor_facturacion` FOREIGN KEY (`id_profesor`) REFERENCES `Profesor` (`idProfesor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Facturacion`
--

LOCK TABLES `Facturacion` WRITE;
/*!40000 ALTER TABLE `Facturacion` DISABLE KEYS */;
INSERT INTO `Facturacion` (`idFacturacion`, `nombre`, `identificacion`, `razon_social`, `estado_tributario`, `nombre_actividad`, `codigo_actividad`, `id_profesor`) VALUES (17,'Maria Jose Soto Vega','111111113','Servicios profesionales',0,'','',37);
/*!40000 ALTER TABLE `Facturacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Matricula`
--

DROP TABLE IF EXISTS `Matricula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Matricula` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cedula_estudiante` int(11) NOT NULL,
  `id_Curso_X_Periodo` int(11) NOT NULL,
  `numero_comprobante` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `comprobante` varchar(400) COLLATE utf8_unicode_ci NOT NULL,
  `comentario` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `numero_factura_electronica` int(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Matricula`
--

LOCK TABLES `Matricula` WRITE;
/*!40000 ALTER TABLE `Matricula` DISABLE KEYS */;
INSERT INTO `Matricula` (`id`, `estado`, `cedula_estudiante`, `id_Curso_X_Periodo`, `numero_comprobante`, `comprobante`, `comentario`, `numero_factura_electronica`) VALUES (63,'Aceptado',100004444,22,'6576','comprobantes/1541807638 = 2018-11-09 23:53:58comprobante de inscripcion de matricula pagado.jpg','Todo se encuentra en orden',0),(67,'Aceptado',111111114,25,'111','comprobantes/1554778083 = 2019-04-08 21:48:03comprobante.jpg','',111),(68,NULL,111111116,25,'112','comprobantes/1554823230 = 2019-04-09 10:20:30comprobante.jpg','',0),(73,NULL,111111116,25,'908','comprobantes/1555026705 = 2019-04-11 18:51:45photo_2019-04-11_16-14-54.jpg','',0);
/*!40000 ALTER TABLE `Matricula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Noticia`
--

DROP TABLE IF EXISTS `Noticia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Noticia` (
  `idNoticia` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `cuerpo` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `fecha` datetime NOT NULL,
  `id_administrador` int(11) NOT NULL,
  PRIMARY KEY (`idNoticia`),
  UNIQUE KEY `idNoticia_UNIQUE` (`idNoticia`),
  UNIQUE KEY `titulo_UNIQUE` (`titulo`),
  KEY `fk_id_administrador_idx` (`id_administrador`),
  CONSTRAINT `fk_id_administrador` FOREIGN KEY (`id_administrador`) REFERENCES `Administrador` (`idAdministrador`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Noticia`
--

LOCK TABLES `Noticia` WRITE;
/*!40000 ALTER TABLE `Noticia` DISABLE KEYS */;
/*!40000 ALTER TABLE `Noticia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Periodo`
--

DROP TABLE IF EXISTS `Periodo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Periodo` (
  `idPeriodo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_final` date NOT NULL,
  PRIMARY KEY (`idPeriodo`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Periodo`
--

LOCK TABLES `Periodo` WRITE;
/*!40000 ALTER TABLE `Periodo` DISABLE KEYS */;
INSERT INTO `Periodo` (`idPeriodo`, `nombre`, `fecha_inicio`, `fecha_final`) VALUES (1,'IV Cuatrimestre','2018-09-01','2018-11-03'),(37,'Periodo 2019','2019-04-01','2019-12-31'),(38,'I semestre 2018','1969-12-31','1969-12-31');
/*!40000 ALTER TABLE `Periodo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Profesor`
--

DROP TABLE IF EXISTS `Profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Profesor` (
  `idProfesor` int(11) NOT NULL AUTO_INCREMENT,
  `cedula_profesor` int(11) DEFAULT NULL,
  PRIMARY KEY (`idProfesor`),
  KEY `fk_cedula_idx` (`cedula_profesor`),
  CONSTRAINT `fk_cedula` FOREIGN KEY (`cedula_profesor`) REFERENCES `Usuario` (`cedula`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Profesor`
--

LOCK TABLES `Profesor` WRITE;
/*!40000 ALTER TABLE `Profesor` DISABLE KEYS */;
INSERT INTO `Profesor` (`idProfesor`, `cedula_profesor`) VALUES (37,111111113);
/*!40000 ALTER TABLE `Profesor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuario`
--

DROP TABLE IF EXISTS `Usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Usuario` (
  `cedula` int(11) NOT NULL,
  `nombre` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `primer_apellido` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `segundo_apellido` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `tipo_identificacion` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `telefono` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefono2` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `correo` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fecha_nacimiento` date NOT NULL,
  `pin` smallint(6) NOT NULL,
  PRIMARY KEY (`cedula`),
  UNIQUE KEY `cedula_UNIQUE` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario`
--

LOCK TABLES `Usuario` WRITE;
/*!40000 ALTER TABLE `Usuario` DISABLE KEYS */;
INSERT INTO `Usuario` (`cedula`, `nombre`, `primer_apellido`, `segundo_apellido`, `tipo_identificacion`, `telefono`, `telefono2`, `correo`, `fecha_nacimiento`, `pin`) VALUES (111111111,'Mariela','Ramírez','Hernández','Cédula Identidad','88888888','22222222','marielahernandez@itcr.ac.','2018-09-22',1234),(111111112,'Juan Pablo','Campos','','Cédula Identidad','88888889','22222223','jpcampos@itcr.ac.cr','2022-09-20',1234),(111111113,'Maria Jose','Soto','Vega','Cédula Identidad','88888881','22222224','mjsoto@gmail.com','1972-09-02',1234),(111111114,'Mary','Soto','Loria','Cédula Identidad','88888882','22222225','mloria@gmail.com','2019-04-26',1234),(111111115,'Roberto','Mejias','Calderon','Cédula Identidad','88888883','22222226','robertmc@gmail.com','2022-08-29',1234),(111111116,'Ricardo','Monestel','Mora','Cédula Indentidad','88888884','22222227','rm@gmail.com','1972-09-02',1234);
/*!40000 ALTER TABLE `Usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `Usuarios`
--

DROP TABLE IF EXISTS `Usuarios`;
/*!50001 DROP VIEW IF EXISTS `Usuarios`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `Usuarios` AS SELECT 
 1 AS `cedula`,
 1 AS `nombre`,
 1 AS `primer_apellido`,
 1 AS `segundo_apellido`,
 1 AS `correo`,
 1 AS `telefono`,
 1 AS `telefono2`,
 1 AS `fecha_nacimiento`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!50001 DROP VIEW IF EXISTS `usuarios`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `usuarios` AS SELECT 
 1 AS `cedula`,
 1 AS `nombre`,
 1 AS `primer_apellido`,
 1 AS `segundo_apellido`,
 1 AS `correo`,
 1 AS `telefono`,
 1 AS `telefono2`,
 1 AS `fecha_nacimiento`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'casacult_casa_cultural'
--

--
-- Dumping routines for database 'casacult_casa_cultural'
--
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_matricula` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`casacult`@`localhost` PROCEDURE `actualizar_matricula`(IN `id` INT, IN `estado` VARCHAR(50), IN `comentario` VARCHAR(1000))
    NO SQL
UPDATE `Matricula` SET `estado` = estado, `comentario` = comentario  WHERE `Matricula`.`id` = id ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_periodo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`casacult`@`localhost` PROCEDURE `actualizar_periodo`(IN `fecha` VARCHAR(40), IN `id` INT)
    NO SQL
UPDATE Periodo
SET fecha_final=fecha
WHERE idPeriodo=id ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `agregar_factura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`casacult`@`localhost` PROCEDURE `agregar_factura`(IN `in_id_matricula` INT(40), IN `in_num_factura` INT(50))
    NO SQL
UPDATE `Matricula` SET `numero_factura_electronica` = in_num_factura WHERE `Matricula`.`id` = in_id_matricula ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cerrar_curso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`casacult`@`localhost` PROCEDURE `cerrar_curso`(IN `idCurso_X_Periodo_in` INT(11))
    NO SQL
BEGIN

UPDATE Curso_X_Periodo

SET Curso_X_Periodo.estado = "cerrado" 
WHERE Curso_X_Periodo.id = idCurso_X_Periodo_in;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `desactivar_administrador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`casacult`@`localhost` PROCEDURE `desactivar_administrador`(IN `id_admin_in` INT(11))
    NO SQL
BEGIN

UPDATE Administrador

SET Administrador.estado = "inactivo" 
WHERE Administrador.idAdministrador = id_admin_in;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `editar_profesor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`casacult`@`localhost` PROCEDURE `editar_profesor`(IN `cedula_in` INT(10) UNSIGNED, IN `nombre_in` VARCHAR(45), IN `primer_apellido_in` VARCHAR(45), IN `segundo_apellido_in` VARCHAR(45), IN `telefono_in` VARCHAR(45), IN `telefono_2_in` VARCHAR(45), IN `correo_in` VARCHAR(45), IN `provincia_in` VARCHAR(45), IN `canton_in` VARCHAR(45), IN `distrito_in` VARCHAR(45), IN `sennas_in` VARCHAR(240), IN `identificacion_in` VARCHAR(12), IN `nombre_completo_in` VARCHAR(65), IN `razon_social_in` VARCHAR(45), IN `estado_tributario_in` TINYINT(1), IN `nombre_actividad_in` VARCHAR(45), IN `codigo_actividad_in` VARCHAR(45), IN `id_profesor_in` INT(10))
BEGIN

UPDATE Usuario 
SET nombre = nombre_in,
	primer_apellido = primer_apellido_in,
    segundo_apellido = segundo_apellido_in,
    telefono = telefono_in,
    telefono2 = telefono_2_in,
    correo = correo_in
WHERE cedula = cedula_in;

UPDATE Direccion
SET provincia = provincia_in,
	canton = canton_in,
    distrito = distrito_in,
    sennas = sennas_in
WHERE id_profesor = id_profesor_in;

UPDATE Facturacion
SET nombre = nombre_completo_in,
	codigo_actividad = codigo_actividad_in,
    estado_tributario = estado_tributario_in,
    razon_social = razon_social_in,
    nombre_actividad = nombre_actividad_in
WHERE id_profesor = id_profesor_in;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `editar_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`casacult`@`localhost` PROCEDURE `editar_usuario`(IN `cedula_in` INT(11), IN `nombre_in` VARCHAR(25), IN `primer_apellido_in` VARCHAR(45), IN `segundo_apellido_in` VARCHAR(45), IN `telefono_in` VARCHAR(45), IN `telefono2_in` VARCHAR(45), IN `correo_in` VARCHAR(45))
    NO SQL
    COMMENT 'Procedimiento para actualizar los datos de los usuarios'
BEGIN

	UPDATE Usuario
    
    SET nombre = nombre_in,
		primer_apellido = primer_apellido_in,
		segundo_apellido = segundo_apellido_in,
        telefono = telefono_in,
        telefono2 = telefono2_in,
        correo = correo_in

    WHERE cedula = cedula_in;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `matricular` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`casacult`@`localhost` PROCEDURE `matricular`(IN `input_cedula` INT, IN `input_curXper` INT, IN `input_num_compro` VARCHAR(50), IN `input_comprobante` VARCHAR(400))
    NO SQL
BEGIN
INSERT INTO Matricula(cedula_estudiante, id_Curso_X_Periodo, numero_comprobante, comprobante)
VALUES (input_cedula, input_curXper, input_num_compro, input_comprobante);

UPDATE Curso
SET Curso.cupo = Curso.cupo - 1
WHERE Curso.idCurso = (SELECT Curso_X_Periodo.idCurso FROM Curso_X_Periodo WHERE Curso_X_Periodo.id = input_curXper);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modificar_curso_matricula` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`casacult`@`localhost` PROCEDURE `modificar_curso_matricula`(IN `in_id_cursoxperiodo` INT(40), IN `in_id_matricula` INT(40))
    NO SQL
UPDATE `Matricula` SET `id_Curso_X_Periodo` = in_id_cursoxperiodo WHERE `Matricula`.`id` = in_id_matricula ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_administradores_activos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`casacult`@`localhost` PROCEDURE `obtener_administradores_activos`()
    NO SQL
BEGIN

SELECT Administrador.idAdministrador, Usuario.cedula, CONCAT(Usuario.nombre," ", Usuario.primer_apellido, " ", Usuario.segundo_apellido) AS nombre, Administrador.tipoAdministrador 
FROM Usuario 
INNER JOIN Administrador ON Usuario.cedula = Administrador.cedula_admin WHERE Administrador.estado = "activo";

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_correos_admins` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`casacult`@`localhost` PROCEDURE `obtener_correos_admins`()
    NO SQL
BEGIN
	SELECT DISTINCT Usuario.nombre, Usuario.primer_apellido, Usuario.segundo_apellido, Usuario.correo
    FROM Usuario
	INNER JOIN Administrador ON Administrador.cedula_admin = Usuario.cedula
    WHERE Usuario.nombre <>'' AND Usuario.primer_apellido <>''
    AND Usuario.segundo_apellido <>'' AND Usuario.correo <>''
    AND Administrador.estado = "activo";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_correos_matriculados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`casacult`@`localhost` PROCEDURE `obtener_correos_matriculados`()
    NO SQL
BEGIN
	SELECT DISTINCT Usuario.nombre, Usuario.primer_apellido, Usuario.segundo_apellido, Usuario.correo
    FROM Usuario
	LEFT JOIN Matricula ON Matricula.cedula_estudiante = Usuario.cedula
    WHERE Usuario.nombre <>'' AND Usuario.primer_apellido <>''
    AND Usuario.segundo_apellido <>'' AND Usuario.correo <>'';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_correos_profesores` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`casacult`@`localhost` PROCEDURE `obtener_correos_profesores`()
    NO SQL
BEGIN
	SELECT DISTINCT Usuario.nombre, Usuario.primer_apellido, Usuario.segundo_apellido, Usuario.correo
	FROM Usuario
	INNER JOIN Profesor ON Profesor.cedula_profesor = Usuario.cedula
    WHERE Usuario.nombre <>'' AND Usuario.primer_apellido <>''
    AND Usuario.segundo_apellido <>'' AND Usuario.correo <>'';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_correos_x_tipo_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`casacult`@`localhost` PROCEDURE `obtener_correos_x_tipo_usuario`(`tipo_in` INT(13))
    NO SQL
BEGIN
    IF tipo_in = 1 THEN
		CALL obtener_correos_admins();
	ELSEIF tipo_in = 2 THEN
		CALL obtener_correos_profesores();
	ELSEIF tipo_in = 3 THEN 
		CALL obtener_correos_matriculados();
	ELSEIF tipo_in = 4 THEN 
		CALL obtener_todos_correos_usuarios();
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_cursos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`casacult`@`localhost` PROCEDURE `obtener_cursos`()
    NO SQL
SELECT Curso_X_Periodo.id as idCurso,Curso.nombre as nombre,Curso.horario as horario FROM Curso, Curso_X_Periodo  WHERE Curso_X_Periodo.idCurso = Curso.idCurso and Curso.cupo>0 and Curso_X_Periodo.idPeriodo =(
 SELECT 
            MAX(Curso_X_Periodo.idPeriodo)
        FROM
            Curso_X_Periodo) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_cursos_x_periodo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`casacult`@`localhost` PROCEDURE `obtener_cursos_x_periodo`(IN `idPeriodo_in` INT(11))
    NO SQL
BEGIN

SELECT Curso.idCurso, Curso.nombre, Curso.cupo, Curso.horario, Curso.informacion, Curso_X_Periodo.id AS idCXP, Curso_X_Periodo.estado, Curso_X_Periodo.idPeriodo, CONCAT(Usuario.nombre," ", Usuario.primer_apellido, " ", Usuario.segundo_apellido) AS nombreProfesor  from Curso_X_Periodo

INNER JOIN Curso ON Curso.idCurso = Curso_X_Periodo.idCurso
INNER JOIN Profesor ON Profesor.idProfesor = Curso_X_Periodo.idProfesorAsignado
INNER JOIN Usuario ON Usuario.cedula = Profesor.cedula_profesor
WHERE Curso_X_Periodo.idPeriodo = idPeriodo_in
AND Curso_X_Periodo.estado = "disponible";

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_datos_curso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`casacult`@`localhost` PROCEDURE `obtener_datos_curso`(IN `idCursoXPeriodo_in` INT(5))
    NO SQL
SELECT nombre, horario
from Curso 
inner join Curso_X_Periodo on Curso_X_Periodo.idCurso = Curso.idCurso
where Curso_X_Periodo.id = idCursoXPeriodo_in ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_datos_matricula` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`casacult`@`localhost` PROCEDURE `obtener_datos_matricula`(IN `idMatricula_in` INT(10))
    NO SQL
SELECT Matricula.cedula_estudiante, Matricula.id_Curso_X_Periodo
FROM Matricula
WHERE Matricula.id = idMatricula_in ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_datos_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`casacult`@`localhost` PROCEDURE `obtener_datos_usuario`(IN `cedula_in` INT(11))
    NO SQL
Select Usuario.nombre, Usuario.correo
from Usuario
where Usuario.cedula = cedula_in ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_estudiantes_x_curso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`casacult`@`localhost` PROCEDURE `obtener_estudiantes_x_curso`(IN `idPeriodo_in` INT(11))
    NO SQL
    COMMENT 'Obtiene la lista de estudiantes matriculados en un curso '
SELECT * FROM Usuario usuarios
INNER JOIN Matricula matriculas ON matriculas.cedula_estudiante = usuarios.cedula
where matriculas.id_Curso_X_Periodo = idPeriodo_in ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_estudiantes_x_periodo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`casacult`@`localhost` PROCEDURE `obtener_estudiantes_x_periodo`(IN `in_id_periodo` INT(40))
    NO SQL
SELECT Matricula.id, Matricula.cedula_estudiante, Usuarios.nombre, Usuarios.primer_apellido, 
  Usuarios.segundo_apellido, Usuarios.correo, Matricula.numero_comprobante, Matricula.estado, 
  Matricula.comentario, Curso.nombre as 'Curso' FROM Matricula 
  LEFT JOIN Usuarios ON Matricula.cedula_estudiante = Usuarios.cedula 
  INNER JOIN Curso_X_Periodo ON Matricula.id_Curso_X_Periodo = Curso_X_Periodo.id 
  INNER JOIN Periodo ON Curso_X_Periodo.idPeriodo = Periodo.idPeriodo 
  LEFT JOIN Curso ON Curso_X_Periodo.idCurso = Curso.idCurso 
WHERE Periodo.idPeriodo = in_id_periodo ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_historial_x_estudiante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`casacult`@`localhost` PROCEDURE `obtener_historial_x_estudiante`(IN `input_cedula` VARCHAR(40))
    NO SQL
SELECT
  Matricula.id,
  Matricula.cedula_estudiante,
  Curso.nombre AS nombreCurso,
  Periodo.nombre AS nombrePeriodo,
  Usuario.nombre AS nombreProfesor,
  Usuario.primer_apellido,
  Curso.horario
FROM Curso_X_Periodo
       INNER JOIN Curso
         ON Curso_X_Periodo.idCurso = Curso.idCurso
       INNER JOIN Periodo
         ON Curso_X_Periodo.idPeriodo = Periodo.idPeriodo
       INNER JOIN Matricula
         ON Curso_X_Periodo.id = Matricula.id_Curso_X_Periodo,
     Profesor
       INNER JOIN Usuario
         ON Profesor.cedula_profesor = Usuario.cedula
WHERE Matricula.cedula_estudiante = input_cedula
AND Curso_X_Periodo.idProfesorAsignado = Profesor.idProfesor ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_listaPagos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`casacult`@`localhost` PROCEDURE `obtener_listaPagos`()
    NO SQL
SELECT `Periodo`.`fecha_inicio`, `Curso`.`nombre`, `Periodo`.`nombre`, `Usuario`.`nombre`, `Usuario`.`primer_apellido` FROM `Periodo`, `Curso`, `Usuario`, `Matricula`, `Curso_X_Periodo`  WHERE `Usuario`.`cedula` = `Matricula`.`cedula_estudiante` AND `Periodo`.`idPeriodo` = `Curso_X_Periodo`.`idPeriodo` AND `Matricula`.`id_Curso_X_Periodo` = `Curso_X_Periodo`.`id` AND `Curso`.`idCurso` = `Curso_X_Periodo`.`idCurso` AND `Matricula`.`estado` = "Aceptado" ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_listaPeriodos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`casacult`@`localhost` PROCEDURE `obtener_listaPeriodos`()
    NO SQL
SELECT nombre, idPeriodo From Periodo ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_lista_curso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`casacult`@`localhost` PROCEDURE `obtener_lista_curso`(IN `idPeriodo_in` INT(11))
    NO SQL
SELECT Usuario.cedula, CONCAT(Usuario.nombre," ", Usuario.primer_apellido, " ", Usuario.segundo_apellido) AS nombre, Usuario.correo, Usuario.telefono, Usuario.telefono2, Usuario.fecha_nacimiento, Matricula.estado, Matricula.numero_comprobante, Matricula.numero_factura_electronica, Matricula.comentario

FROM Usuario
INNER JOIN Matricula ON Matricula.cedula_estudiante = Usuario.cedula
where Matricula.id_Curso_X_Periodo = idPeriodo_in ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_matricula_x_estudiante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`casacult`@`localhost` PROCEDURE `obtener_matricula_x_estudiante`(IN `input_cedula` VARCHAR(40))
    NO SQL
SELECT
  Matricula.id,
  Matricula.cedula_estudiante,
  Curso.nombre AS nombreCurso,
  Periodo.nombre AS nombrePeriodo,
  Curso.horario,
  Matricula.estado,
  Matricula.comentario
FROM Curso_X_Periodo
       INNER JOIN Curso
         ON Curso_X_Periodo.idCurso = Curso.idCurso
       INNER JOIN Periodo
         ON Curso_X_Periodo.idPeriodo = Periodo.idPeriodo
       INNER JOIN Matricula
         ON Curso_X_Periodo.id = Matricula.id_Curso_X_Periodo,
     Profesor
       INNER JOIN Usuario
         ON Profesor.cedula_Profesor = Usuario.cedula
WHERE Matricula.cedula_estudiante = input_cedula
AND Curso_X_Periodo.idProfesorAsignado = Profesor.idProfesor ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_periodos_actuales` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`casacult`@`localhost` PROCEDURE `obtener_periodos_actuales`()
    NO SQL
BEGIN

SET @HOY = CURDATE();

SELECT Periodo.nombre, Periodo.idPeriodo from Periodo
WHERE Periodo.fecha_final > @HOY
ORDER BY Periodo.fecha_final ASC;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_periodos_fecha` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`casacult`@`localhost` PROCEDURE `obtener_periodos_fecha`()
    NO SQL
SELECT * FROM `Periodo` WHERE `fecha_final` >= CURDATE() ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_profesor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`casacult`@`localhost` PROCEDURE `obtener_profesor`(IN `id_matricula` INT)
    NO SQL
    COMMENT 'Utilizado para generar informe de matrícula'
SELECT Usuario.nombre, Usuario.primer_apellido, Usuario.segundo_apellido
FROM Usuario
  Inner join Profesor on Usuario.cedula = Profesor.cedula_profesor
  INNER JOIN Curso_X_Periodo ON Curso_X_Periodo.idProfesorAsignado = Profesor.idProfesor
  INNER JOIN Matricula ON Matricula.id_Curso_X_Periodo = Curso_X_Periodo.id
WHERE Matricula.id = id_matricula ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_profesor_x_cedula` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`casacult`@`localhost` PROCEDURE `obtener_profesor_x_cedula`(IN `cedula_in` INT(13))
    NO SQL
BEGIN

	SELECT Usuario.nombre, Usuario.primer_apellido, Usuario.segundo_apellido, 
    Usuario.telefono, Usuario.telefono2, Usuario.correo, Usuario.fecha_nacimiento,provincia, 
    canton, distrito, sennas, Facturacion.nombre as 'fnombre', identificacion, 
    razon_social, estado_tributario, nombre_actividad, 
    codigo_actividad, Profesor.idProfesor
    FROM Usuario
    INNER JOIN Profesor ON Profesor.cedula_profesor = Usuario.cedula
    LEFT JOIN Direccion ON Direccion.id_profesor = Profesor.idProfesor
    LEFT JOIN Facturacion ON Facturacion.id_profesor = Profesor.idProfesor
    WHERE Usuario.cedula = cedula_in ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_tipo_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`casacult`@`localhost` PROCEDURE `obtener_tipo_usuario`(IN `cedula` INT)
    NO SQL
SELECT `tipoAdministrador`, `estado` FROM `Administrador` WHERE `cedula_admin` = cedula ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_todos_correos_usuarios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`casacult`@`localhost` PROCEDURE `obtener_todos_correos_usuarios`()
    NO SQL
BEGIN
	SELECT DISTINCT Usuario.nombre, Usuario.primer_apellido, Usuario.segundo_apellido, Usuario.correo
    FROM Usuario
    WHERE Usuario.nombre <>'' AND Usuario.primer_apellido <>''
    AND Usuario.segundo_apellido <>'' AND Usuario.correo <>'';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_todos_cursos_x_periodo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`casacult`@`localhost` PROCEDURE `obtener_todos_cursos_x_periodo`(IN `idPeriodo_in` INT(11))
    NO SQL
SELECT Curso.idCurso, Curso.nombre, Curso.horario, CONCAT(Usuario.nombre," ", Usuario.primer_apellido, " ", Usuario.segundo_apellido) AS nombreProfesor, Curso.cupo,  Curso_X_Periodo.id AS idCXP, Curso_X_Periodo.estado, Curso_X_Periodo.observaciones, Curso_X_Periodo.idPeriodo, CONCAT((SELECT COUNT(*) from Matricula where Matricula.id_Curso_X_Periodo = Curso_X_Periodo.id), "/", Curso.cupo) as total

from Curso_X_Periodo

INNER JOIN Curso ON Curso.idCurso = Curso_X_Periodo.idCurso
INNER JOIN Profesor ON Profesor.idProfesor = Curso_X_Periodo.idProfesorAsignado
INNER JOIN Usuario ON Usuario.cedula = Profesor.cedula_profesor

WHERE Curso_X_Periodo.idPeriodo = idPeriodo_in ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`casacult`@`localhost` PROCEDURE `obtener_usuario`(IN `pUsuario` INT(45), IN `pPassword` INT(45))
BEGIN   
	select * from Usuario where
            cedula = pUsuario and pin = pPassword;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_usuariosMat` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`casacult`@`localhost` PROCEDURE `obtener_usuariosMat`(IN `identificador` INT(11))
    NO SQL
SELECT `Usuario`.`nombre`, `Usuario`.`primer_apellido`, `Usuario`.`cedula`, `Curso`.`nombre`, `Matricula`.`id`, `Matricula`.`numero_comprobante`, `Matricula`.`comprobante`  FROM `Usuario`, `Matricula`, `Curso`, `Curso_X_Periodo` WHERE `Usuario`.`cedula` = `Matricula`.`cedula_estudiante` AND `Curso`.`idCurso` = `Curso_X_Periodo`.`idCurso` AND `Matricula`.`id_Curso_X_Periodo` = `Curso_X_Periodo`.`id` AND `Matricula`.`estado` IS NULL AND `Matricula`.`id` = identificador ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_usuariosMatricula` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`casacult`@`localhost` PROCEDURE `obtener_usuariosMatricula`()
    NO SQL
SELECT `Usuario`.`nombre`, `Usuario`.`primer_apellido`, `Usuario`.`cedula`, `Curso`.`nombre`, `Matricula`.`id`, `Matricula`.`numero_comprobante` FROM `Usuario`, `Matricula`, `Curso`, `Curso_X_Periodo` WHERE `Usuario`.`cedula` = `Matricula`.`cedula_estudiante` AND `Curso`.`idCurso` = `Curso_X_Periodo`.`idCurso` AND `Matricula`.`id_Curso_X_Periodo` = `Curso_X_Periodo`.`id` AND `Matricula`.`estado` IS NULL ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `recuperar_contra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`casacult`@`localhost` PROCEDURE `recuperar_contra`(IN `pcorreo` VARCHAR(40))
    NO SQL
SELECT `cedula`, `pin`, `nombre`, `primer_apellido` FROM `Usuario` WHERE `correo` = pcorreo ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrar_administrador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`casacult`@`localhost` PROCEDURE `registrar_administrador`(IN `cedula_in` INT(10), IN `nombre_in` VARCHAR(40), IN `primer_apellido_in` VARCHAR(40), IN `segundo_apellido_in` VARCHAR(40), IN `tipo_identificacion_in` VARCHAR(20), IN `telefono_in` VARCHAR(10), IN `telefono2_in` VARCHAR(10), IN `correo_in` VARCHAR(25), IN `fecha_in` DATE, IN `clave_in` SMALLINT(5), IN `tipo_admin_in` VARCHAR(40))
    NO SQL
    COMMENT 'Proceso almacenado para registrar administrador'
BEGIN

DECLARE Cedula INT(8);

SET Cedula = 0;

SELECT Usuario.cedula INTO Cedula
FROM Usuario WHERE cedula_in = Usuario.cedula;

IF Cedula = 0 THEN

INSERT INTO Usuario
VALUES(cedula_in,nombre_in,primer_apellido_in,
       segundo_apellido_in,tipo_identificacion_in,
       telefono_in,telefono2_in,correo_in,fecha_in,clave_in);
       
END IF;

UPDATE Usuario
    
    SET nombre = nombre_in,
		primer_apellido = primer_apellido_in,
		segundo_apellido = segundo_apellido_in,
        telefono = telefono_in,
        telefono2 = telefono2_in,
        correo = correo_in

    WHERE cedula_in = Usuario.cedula;
    
INSERT INTO Administrador
VALUES (NULL, cedula_in, tipo_admin_in, "activo");

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrar_curso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`casacult`@`localhost` PROCEDURE `registrar_curso`(IN `in_nombre` VARCHAR(45), IN `in_cupo` INT(11), IN `in_horario` VARCHAR(45), IN `in_informacion` TEXT)
    NO SQL
    COMMENT 'Procedimiento para agregar un curso'
INSERT INTO Curso(nombre, cupo, horario, informacion)
VALUES (in_nombre, in_cupo, in_horario, in_informacion) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrar_curso_X_Periodo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`casacult`@`localhost` PROCEDURE `registrar_curso_X_Periodo`(IN `idCurso_in` INT, IN `idPeriodo_in` INT, IN `idProfesor_in` INT)
    NO SQL
INSERT INTO Curso_X_Periodo (idCurso, idPeriodo, idProfesorAsignado)
VALUES (idCurso_in,idPeriodo_in,idProfesor_in) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrar_periodo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`casacult`@`localhost` PROCEDURE `registrar_periodo`(IN `in_nombre` VARCHAR(40), IN `in_fecha_inicio` DATE, IN `in_fecha_final` DATE)
    NO SQL
INSERT INTO Periodo (nombre,fecha_inicio,fecha_final)
VALUES (in_nombre, in_fecha_inicio, in_fecha_final) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrar_profesor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`casacult`@`localhost` PROCEDURE `registrar_profesor`(IN `cedula_in` INT(10) UNSIGNED, IN `nombre_in` VARCHAR(45), IN `primer_apellido_in` VARCHAR(45), IN `segundo_apellido_in` VARCHAR(45), IN `telefono_in` VARCHAR(45), IN `telefono_2_in` VARCHAR(45), IN `correo_in` VARCHAR(45), IN `fecha_in` DATE, IN `pin_in` SMALLINT(6), IN `provincia_in` VARCHAR(45), IN `canton_in` VARCHAR(45), IN `distrito_in` VARCHAR(45), IN `sennas_in` VARCHAR(240), IN `identificacion_in` VARCHAR(12), IN `nombre_completo_in` VARCHAR(65), IN `razon_social_in` VARCHAR(45), IN `estado_tributario_in` TINYINT(1), IN `nombre_actividad_in` VARCHAR(45), IN `codigo_actividad_in` VARCHAR(45), IN `tipo_identificacion_in` VARCHAR(45))
BEGIN
INSERT INTO Usuario (cedula, nombre, primer_apellido, segundo_apellido, telefono,telefono2,correo,fecha_nacimiento,pin,tipo_identificacion)
VALUES(cedula_in,nombre_in,primer_apellido_in,segundo_apellido_in,telefono_in,telefono_2_in,correo_in,fecha_in,pin_in,tipo_identificacion_in);
       
INSERT INTO Profesor (cedula_profesor) VALUES (cedula_in);
SELECT @ULTIMO_ID := LAST_INSERT_ID();
INSERT INTO Direccion (id_profesor, provincia, canton, distrito, sennas) VALUES (@ULTIMO_ID, provincia_in, canton_in, distrito_in, sennas_in);
INSERT INTO Facturacion (id_profesor, nombre, identificacion, razon_social, estado_tributario, nombre_actividad, codigo_actividad) VALUES (@ULTIMO_ID, nombre_completo_in, identificacion_in, razon_social_in, estado_tributario_in, nombre_actividad_in, codigo_actividad_in);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrar_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`casacult`@`localhost` PROCEDURE `registrar_usuario`(IN `cedula_in` INT(10), IN `nombre_in` VARCHAR(70), IN `primer_apellido_in` VARCHAR(70), IN `segundo_apellido_in` VARCHAR(70), IN `tipo_identificacion_in` VARCHAR(20), IN `telefono_in` VARCHAR(15), IN `telefono2_in` VARCHAR(40), IN `correo_in` VARCHAR(50), IN `fecha_in` DATE, IN `clave_in` SMALLINT(5))
    NO SQL
    COMMENT 'Procedimiento para agregar un usuario común'
INSERT INTO Usuario
VALUES(cedula_in,nombre_in,primer_apellido_in,
       segundo_apellido_in,tipo_identificacion_in,
       telefono_in,telefono2_in,correo_in,fecha_in,clave_in) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `Usuarios`
--

/*!50001 DROP VIEW IF EXISTS `Usuarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`casacult`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Usuarios` AS select `Usuario`.`cedula` AS `cedula`,`Usuario`.`nombre` AS `nombre`,`Usuario`.`primer_apellido` AS `primer_apellido`,`Usuario`.`segundo_apellido` AS `segundo_apellido`,`Usuario`.`correo` AS `correo`,`Usuario`.`telefono` AS `telefono`,`Usuario`.`telefono2` AS `telefono2`,`Usuario`.`fecha_nacimiento` AS `fecha_nacimiento` from `Usuario` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `usuarios`
--

/*!50001 DROP VIEW IF EXISTS `usuarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`casacult`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `usuarios` AS select `Usuario`.`cedula` AS `cedula`,`Usuario`.`nombre` AS `nombre`,`Usuario`.`primer_apellido` AS `primer_apellido`,`Usuario`.`segundo_apellido` AS `segundo_apellido`,`Usuario`.`correo` AS `correo`,`Usuario`.`telefono` AS `telefono`,`Usuario`.`telefono2` AS `telefono2`,`Usuario`.`fecha_nacimiento` AS `fecha_nacimiento` from `Usuario` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-16 17:04:07
