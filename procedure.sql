-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: controlpedido
-- ------------------------------------------------------
-- Server version	5.7.28-0ubuntu0.18.04.4

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL,
  `nombre` varchar(200) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `zona` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`idcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='listado de clientes de SF';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `despachador`
--

DROP TABLE IF EXISTS `despachador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `despachador` (
  `iddespachador` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`iddespachador`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='responsables de la entrega del pedido al cliente';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `despacho`
--

DROP TABLE IF EXISTS `despacho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `despacho` (
  `iddespacho` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `iddespachador` int(11) DEFAULT NULL,
  `idpedido` int(11) DEFAULT NULL,
  `estado` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`iddespacho`),
  UNIQUE KEY `index2` (`iddespachador`,`idpedido`),
  KEY `fk_despacho_pedido_idx` (`idpedido`),
  CONSTRAINT `fk_despacho_pedido` FOREIGN KEY (`idpedido`) REFERENCES `pedido` (`idnota`)
) ENGINE=InnoDB AUTO_INCREMENT=979 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='registro de los despachos de los pedidos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `destino`
--

DROP TABLE IF EXISTS `destino`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `destino` (
  `iddestino` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `ciudad` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`iddestino`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='listado de destinos, distribuidores, cadenas de farmacias, etc';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `envios`
--

DROP TABLE IF EXISTS `envios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `envios` (
  `idenvios` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `transporte` int(11) DEFAULT NULL,
  `destino` int(11) DEFAULT NULL,
  `guia` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `idpedido` int(11) DEFAULT NULL,
  PRIMARY KEY (`idenvios`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='detalle de envios nacionales, locales, etc';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fallo`
--

DROP TABLE IF EXISTS `fallo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fallo` (
  `idfallo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`idfallo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='listado de tipo de fallos en la preparacion';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nulos`
--

DROP TABLE IF EXISTS `nulos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nulos` (
  `idnulos` int(11) NOT NULL AUTO_INCREMENT,
  `idpedido` int(11) NOT NULL,
  `motivo` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `obs` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `modificacion` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idnulos`),
  UNIQUE KEY `idpedido_UNIQUE` (`idpedido`),
  CONSTRAINT `idpedido_idnulo` FOREIGN KEY (`idpedido`) REFERENCES `pedido` (`idnota`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='tabla para registrar facturacion nula, poir X motivos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `idpedido` int(11) NOT NULL AUTO_INCREMENT,
  `idnota` int(11) DEFAULT NULL,
  `idfac` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `cliente` int(11) DEFAULT NULL,
  `vendedor` int(11) DEFAULT NULL,
  PRIMARY KEY (`idpedido`),
  UNIQUE KEY `index2` (`idnota`,`cliente`,`vendedor`),
  KEY `fk_pedido_vendedor_idx` (`vendedor`),
  KEY `fk_pedido_cliente_idx` (`cliente`),
  CONSTRAINT `fk_pedido_cliente` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`idcliente`),
  CONSTRAINT `fk_pedido_vendedor` FOREIGN KEY (`vendedor`) REFERENCES `vendedor` (`idvendedor`)
) ENGINE=InnoDB AUTO_INCREMENT=3096 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='tabla principal';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `pedido_preparacion_pendiente`
--

DROP TABLE IF EXISTS `pedido_preparacion_pendiente`;
/*!50001 DROP VIEW IF EXISTS `pedido_preparacion_pendiente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pedido_preparacion_pendiente` AS SELECT 
 1 AS `Nota`,
 1 AS `Factura`,
 1 AS `Fecha`,
 1 AS `Cliente`,
 1 AS `Vendedor`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `personalalmacen`
--

DROP TABLE IF EXISTS `personalalmacen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personalalmacen` (
  `idpersonalalmacen` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`idpersonalalmacen`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='personal de almacen encargados de la preparacion';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `preparacion`
--

DROP TABLE IF EXISTS `preparacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preparacion` (
  `idpreparacion` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `picking` int(11) DEFAULT NULL,
  `revision` int(11) DEFAULT NULL,
  `embalaje` int(11) DEFAULT NULL,
  `fallo` int(11) DEFAULT NULL,
  `idpedido` int(11) DEFAULT NULL,
  `estado` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`idpreparacion`),
  UNIQUE KEY `index2` (`picking`,`revision`,`fallo`,`idpedido`),
  KEY `fk_preparacion_pedido_idx` (`idpedido`),
  CONSTRAINT `fk_preparacion_pedido` FOREIGN KEY (`idpedido`) REFERENCES `pedido` (`idnota`)
) ENGINE=InnoDB AUTO_INCREMENT=984 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='tabla de pedidos preparados';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transporte`
--

DROP TABLE IF EXISTS `transporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transporte` (
  `idtransporte` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`idtransporte`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='listado de transporte para envios de pedidos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedor` (
  `idvendedor` int(11) NOT NULL,
  `nombre` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`idvendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='lista de vendedores San Fernando';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'controlpedido'
--
/*!50003 DROP PROCEDURE IF EXISTS `buscarporcliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscarporcliente`(
in valor varchar(50),
in limite int
)
begin
declare nom varchar(50);
declare id int;
declare limits int;
set nom = valor;
set limits = limite;
select idcliente into id from cliente where nombre like concat("%",nom,"%");

	select 
pedido.fecha as fecha,
pedido.idnota as nota,
pedido.idfac as factura,
cliente.nombre as cliente,
vendedor.nombre as vendedor,
preparacion.fecha as fechapreparacion,
preparacion.hora as horapreparacion,
(select personalalmacen.nombre from preparacion 
left join personalalmacen on preparacion.picking=personalalmacen.idpersonalalmacen
where preparacion.picking=personalalmacen.idpersonalalmacen and preparacion.idpedido=pedido.idnota limit 1) as preparador,
(select personalalmacen.nombre from preparacion 
left join personalalmacen on preparacion.revision=personalalmacen.idpersonalalmacen
where preparacion.revision=personalalmacen.idpersonalalmacen and preparacion.idpedido=pedido.idnota limit 1) as revisor,
(select personalalmacen.nombre from preparacion 
left join personalalmacen on preparacion.embalaje=personalalmacen.idpersonalalmacen
where preparacion.embalaje=personalalmacen.idpersonalalmacen and preparacion.idpedido=pedido.idnota limit 1) as embalador,
preparacion.fallo as fallo,
preparacion.estado as estadopreparacion,
despacho.fecha as fechadespacho,
despacho.hora as horadespacho,
despacho.estado as estadodespacho,
despachador.nombre as despachador,
envios.fecha as fechaenvio,
envios.hora as horaenvio,
envios.guia as guia,
transporte.nombre as transporte,
destino.nombre as destino,
destino.ciudad as ciudad
from pedido
left join cliente on pedido.cliente=cliente.idcliente
left join vendedor on pedido.vendedor=vendedor.idvendedor
left join preparacion on pedido.idnota=preparacion.idpedido
left join despacho on pedido.idnota=despacho.idpedido
left join despachador on despacho.iddespachador=despachador.iddespachador
left join envios on pedido.idnota=envios.idpedido
left join transporte on envios.transporte=transporte.idtransporte
left join destino on envios.destino=destino.iddestino
where pedido.cliente=id order by pedido.fecha desc limit limits;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `buscarporcobrador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscarporcobrador`(
in valor varchar(50),
in limite int
)
begin
declare nom varchar(50);
declare id int;
declare limits int;
set nom = valor;
set limits = limite;
select despachador.iddespachador into id from despachador where despachador.nombre like concat("%",nom,"%");

	select 
pedido.fecha as fecha,
pedido.idnota as nota,
pedido.idfac as factura,
cliente.nombre as cliente,
vendedor.nombre as vendedor,
preparacion.fecha as fechapreparacion,
preparacion.hora as horapreparacion,
(select personalalmacen.nombre from preparacion 
left join personalalmacen on preparacion.picking=personalalmacen.idpersonalalmacen
where preparacion.picking=personalalmacen.idpersonalalmacen and preparacion.idpedido=pedido.idnota limit 1) as preparador,
(select personalalmacen.nombre from preparacion 
left join personalalmacen on preparacion.revision=personalalmacen.idpersonalalmacen
where preparacion.revision=personalalmacen.idpersonalalmacen and preparacion.idpedido=pedido.idnota limit 1) as revisor,
(select personalalmacen.nombre from preparacion 
left join personalalmacen on preparacion.embalaje=personalalmacen.idpersonalalmacen
where preparacion.embalaje=personalalmacen.idpersonalalmacen and preparacion.idpedido=pedido.idnota limit 1) as embalador,
preparacion.fallo as fallo,
preparacion.estado as estadopreparacion,
despacho.fecha as fechadespacho,
despacho.hora as horadespacho,
despacho.estado as estadodespacho,
despachador.nombre as despachador,
envios.fecha as fechaenvio,
envios.hora as horaenvio,
envios.guia as guia,
transporte.nombre as transporte,
destino.nombre as destino,
destino.ciudad as ciudad
from pedido
left join cliente on pedido.cliente=cliente.idcliente
left join vendedor on pedido.vendedor=vendedor.idvendedor
left join preparacion on pedido.idnota=preparacion.idpedido
left join despacho on pedido.idnota=despacho.idpedido
left join despachador on despacho.iddespachador=despachador.iddespachador
left join envios on pedido.idnota=envios.idpedido
left join transporte on envios.transporte=transporte.idtransporte
left join destino on envios.destino=destino.iddestino
where despachador.iddespachador=id order by pedido.fecha desc limit limits;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `buscarporfactura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscarporfactura`(
in valor varchar(50),
in limite int
)
begin
declare nom varchar(50);
declare id int;
declare limits int;
set nom = valor;
set limits = limite;
select pedido.idfac into id from pedido where pedido.idfac like concat("%",nom,"%");

	select 
pedido.fecha as fecha,
pedido.idnota as nota,
pedido.idfac as factura,
cliente.nombre as cliente,
vendedor.nombre as vendedor,
preparacion.fecha as fechapreparacion,
preparacion.hora as horapreparacion,
(select personalalmacen.nombre from preparacion 
left join personalalmacen on preparacion.picking=personalalmacen.idpersonalalmacen
where preparacion.picking=personalalmacen.idpersonalalmacen and preparacion.idpedido=pedido.idnota limit 1) as preparador,
(select personalalmacen.nombre from preparacion 
left join personalalmacen on preparacion.revision=personalalmacen.idpersonalalmacen
where preparacion.revision=personalalmacen.idpersonalalmacen and preparacion.idpedido=pedido.idnota limit 1) as revisor,
(select personalalmacen.nombre from preparacion 
left join personalalmacen on preparacion.embalaje=personalalmacen.idpersonalalmacen
where preparacion.embalaje=personalalmacen.idpersonalalmacen and preparacion.idpedido=pedido.idnota limit 1) as embalador,
preparacion.fallo as fallo,
preparacion.estado as estadopreparacion,
despacho.fecha as fechadespacho,
despacho.hora as horadespacho,
despacho.estado as estadodespacho,
despachador.nombre as despachador,
envios.fecha as fechaenvio,
envios.hora as horaenvio,
envios.guia as guia,
transporte.nombre as transporte,
destino.nombre as destino,
destino.ciudad as ciudad
from pedido
left join cliente on pedido.cliente=cliente.idcliente
left join vendedor on pedido.vendedor=vendedor.idvendedor
left join preparacion on pedido.idnota=preparacion.idpedido
left join despacho on pedido.idnota=despacho.idpedido
left join despachador on despacho.iddespachador=despachador.iddespachador
left join envios on pedido.idnota=envios.idpedido
left join transporte on envios.transporte=transporte.idtransporte
left join destino on envios.destino=destino.iddestino
where pedido.idfac=id order by pedido.fecha desc limit limits;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `buscarpornota` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscarpornota`(
in valor int(50),
in limite int
)
begin
declare nom int;
declare id int;
declare limits int;
set nom = valor;
set limits = limite;
select pedido.idnota into id from pedido where pedido.idnota like concat("%",nom,"%");

	select 
pedido.fecha as fecha,
pedido.idnota as nota,
pedido.idfac as factura,
cliente.nombre as cliente,
vendedor.nombre as vendedor,
preparacion.fecha as fechapreparacion,
preparacion.hora as horapreparacion,
(select personalalmacen.nombre from preparacion 
left join personalalmacen on preparacion.picking=personalalmacen.idpersonalalmacen
where preparacion.picking=personalalmacen.idpersonalalmacen and preparacion.idpedido=pedido.idnota limit 1) as preparador,
(select personalalmacen.nombre from preparacion 
left join personalalmacen on preparacion.revision=personalalmacen.idpersonalalmacen
where preparacion.revision=personalalmacen.idpersonalalmacen and preparacion.idpedido=pedido.idnota limit 1) as revisor,
(select personalalmacen.nombre from preparacion 
left join personalalmacen on preparacion.embalaje=personalalmacen.idpersonalalmacen
where preparacion.embalaje=personalalmacen.idpersonalalmacen and preparacion.idpedido=pedido.idnota limit 1) as embalador,
preparacion.fallo as fallo,
preparacion.estado as estadopreparacion,
despacho.fecha as fechadespacho,
despacho.hora as horadespacho,
despacho.estado as estadodespacho,
despachador.nombre as despachador,
envios.fecha as fechaenvio,
envios.hora as horaenvio,
envios.guia as guia,
transporte.nombre as transporte,
destino.nombre as destino,
destino.ciudad as ciudad
from pedido
left join cliente on pedido.cliente=cliente.idcliente
left join vendedor on pedido.vendedor=vendedor.idvendedor
left join preparacion on pedido.idnota=preparacion.idpedido
left join despacho on pedido.idnota=despacho.idpedido
left join despachador on despacho.iddespachador=despachador.iddespachador
left join envios on pedido.idnota=envios.idpedido
left join transporte on envios.transporte=transporte.idtransporte
left join destino on envios.destino=destino.iddestino
where pedido.idnota=id order by pedido.fecha desc limit limits;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `buscarporvendedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscarporvendedor`(
in valor varchar(50),
in limite int
)
begin
declare nom varchar(50);
declare id int;
declare limits int;
set nom = valor;
set limits = limite;
select idvendedor into id from vendedor where nombre like concat("%",nom,"%");

	select 
pedido.fecha as fecha,
pedido.idnota as nota,
pedido.idfac as factura,
cliente.nombre as cliente,
vendedor.nombre as vendedor,
preparacion.fecha as fechapreparacion,
preparacion.hora as horapreparacion,
(select personalalmacen.nombre from preparacion 
left join personalalmacen on preparacion.picking=personalalmacen.idpersonalalmacen
where preparacion.picking=personalalmacen.idpersonalalmacen and preparacion.idpedido=pedido.idnota limit 1) as preparador,
(select personalalmacen.nombre from preparacion 
left join personalalmacen on preparacion.revision=personalalmacen.idpersonalalmacen
where preparacion.revision=personalalmacen.idpersonalalmacen and preparacion.idpedido=pedido.idnota limit 1) as revisor,
(select personalalmacen.nombre from preparacion 
left join personalalmacen on preparacion.embalaje=personalalmacen.idpersonalalmacen
where preparacion.embalaje=personalalmacen.idpersonalalmacen and preparacion.idpedido=pedido.idnota limit 1) as embalador,
preparacion.fallo as fallo,
preparacion.estado as estadopreparacion,
despacho.fecha as fechadespacho,
despacho.hora as horadespacho,
despacho.estado as estadodespacho,
despachador.nombre as despachador,
envios.fecha as fechaenvio,
envios.hora as horaenvio,
envios.guia as guia,
transporte.nombre as transporte,
destino.nombre as destino,
destino.ciudad as ciudad
from pedido
left join cliente on pedido.cliente=cliente.idcliente
left join vendedor on pedido.vendedor=vendedor.idvendedor
left join preparacion on pedido.idnota=preparacion.idpedido
left join despacho on pedido.idnota=despacho.idpedido
left join despachador on despacho.iddespachador=despachador.iddespachador
left join envios on pedido.idnota=envios.idpedido
left join transporte on envios.transporte=transporte.idtransporte
left join destino on envios.destino=destino.iddestino
where pedido.vendedor=id order by pedido.fecha desc limit limits;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `buscar_despacho_x_nota` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_despacho_x_nota`(
in nota int
)
select idnota from pedido where idnota=nota ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cantidadError` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cantidadError`()
select fallo.nombre,count(fallo) as cantidad from preparacion
inner join fallo on preparacion.fallo=fallo.idfallo
 group by fallo ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `countdespacho` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `countdespacho`()
select count(*) total from pedido
left join despacho on pedido.idnota=despacho.idpedido where despacho.estado="ABIERTO" ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `countpreparacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `countpreparacion`()
select count(*) total from pedido
left join preparacion on pedido.idnota=preparacion.idpedido where preparacion.estado="ABIERTO" ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `despachoxid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `despachoxid`(
in nronota int
)
select pedido.idnota as Nota,pedido.idfac as Factura,pedido.fecha as Fecha,despacho.estado from pedido
inner join despacho on despacho.idpedido=pedido.idnota where despacho.idpedido=nronota ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `lista_destino` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `lista_destino`()
select * from destino ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `lista_fallo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `lista_fallo`()
select * from fallo ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `lista_personal_almacen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `lista_personal_almacen`()
select * from personalalmacen ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `lista_personal_despacho` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `lista_personal_despacho`()
select * from despachador ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `lista_transporte` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `lista_transporte`()
select * from transporte ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pedido_despacho_pendiente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pedido_despacho_pendiente`()
select pedido.idnota as Nota,pedido.idfac as Factura,pedido.fecha as Fecha from pedido
inner join despacho on despacho.idpedido=pedido.idnota where despacho.estado='ABIERTO' and despacho.idpedido>0 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pedido_preparacion_pendiente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pedido_preparacion_pendiente`()
select pedido.idnota as Nota,pedido.idfac as Factura,pedido.fecha as Fecha from pedido
inner join preparacion on preparacion.idpedido=pedido.idnota where preparacion.estado='ABIERTO' and preparacion.idpedido>0 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pendientedespacho` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pendientedespacho`()
select pedido.idnota as Nota,pedido.idfac as Factura,pedido.fecha as Fecha,cliente.nombre as Cliente,vendedor.nombre as Vendedor from pedido
inner join cliente on cliente.idcliente=pedido.cliente
inner join vendedor on vendedor.idvendedor=pedido.vendedor
inner join preparacion on preparacion.idpedido=pedido.idnota
inner join despacho on despacho.idpedido=pedido.idnota where despacho.estado='ABIERTO' ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pendientepreparacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pendientepreparacion`()
select pedido.idnota as Nota,pedido.idfac as Factura,pedido.fecha as Fecha,cliente.nombre as Cliente,vendedor.nombre as Vendedor from pedido
inner join cliente on cliente.idcliente=pedido.cliente
inner join vendedor on vendedor.idvendedor=pedido.vendedor
inner join preparacion on preparacion.idpedido=pedido.idnota
inner join despacho on despacho.idpedido=pedido.idnota where preparacion.estado='ABIERTO' ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `preparacionxid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `preparacionxid`(
in nronota int
)
select pedido.idnota as Nota,pedido.idfac as Factura,pedido.fecha as Fecha,preparacion.estado from pedido
inner join preparacion on preparacion.idpedido=pedido.idnota where preparacion.idpedido=nronota ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrar_envio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_envio`(
in fecha date,
in hora time,
in transporte int,
in destino int,
in guia varchar(45),
in idpedido int
)
insert into envios (fecha,hora,transporte,destino,guia,idpedido) values(fecha,hora,transporte,destino,guia,idpedido) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrar_nulo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_nulo`(
in _nota int,
in _motivo varchar(45),
in _obs varchar(45)
)
begin
	insert into nulos(idpedido,motivo,obs) values(_nota,_motivo,_obs);
    update preparacion set estado = "CERRADO" where idpedido=_nota;
    update despacho set estado = "CERRADO" where idpedido=_nota;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrar_pedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrar_pedido`(
in idnota int,
in idfac int,
in fecha date,
in cliente int,
in vendedor int
)
BEGIN
	 DECLARE errno INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
    GET CURRENT DIAGNOSTICS CONDITION 1 errno = MYSQL_ERRNO;
    SELECT errno AS MYSQL_ERROR;
    ROLLBACK;
    END;
    START TRANSACTION;
INSERT INTO pedido (idnota, idfac, fecha, cliente, vendedor)
        VALUES (idnota,idfac,fecha,cliente,vendedor);
COMMIT WORK;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registro_despacho` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registro_despacho`(
in fecha date,
in hora time,
in despachador int,
in id int
)
BEGIN
	 DECLARE errno INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
    GET CURRENT DIAGNOSTICS CONDITION 1 errno = MYSQL_ERRNO;
    SELECT errno AS MYSQL_ERROR;
    ROLLBACK;
    END;

    START TRANSACTION;
update despacho set 
fecha = fecha,
hora = hora,
iddespachador = despachador,
estado = 'CERRADO'
where idpedido = id;
COMMIT WORK;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registro_preparacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registro_preparacion`(
in _fecha date,
in _hora time,
in _picking int,
in _revision int,
in _embalaje int,
in _fallo int,
in _id int
)
BEGIN
	 DECLARE errno INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
    GET CURRENT DIAGNOSTICS CONDITION 1 errno = MYSQL_ERRNO;
    SELECT errno AS MYSQL_ERROR;
    ROLLBACK;
    END;

    START TRANSACTION;
update preparacion set 
fecha = _fecha,
hora = _hora,
picking = _picking,
revision = _revision,
embalaje = _embalaje,
fallo = _fallo,
estado = 'CERRADO'
where idpedido = _id;
COMMIT WORK;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `resumendetallado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `resumendetallado`(
in nronota int
)
select 
pedido.fecha as fecha,
pedido.idnota as nota,
pedido.idfac as factura,
cliente.nombre as cliente,
vendedor.nombre as vendedor,
preparacion.fecha as fechapreparacion,
preparacion.hora as horapreparacion,
(select personalalmacen.nombre from preparacion 
left join personalalmacen on preparacion.picking=personalalmacen.idpersonalalmacen
where preparacion.picking=personalalmacen.idpersonalalmacen and preparacion.idpedido=nronota limit 1) as preparador,
(select personalalmacen.nombre from preparacion 
left join personalalmacen on preparacion.revision=personalalmacen.idpersonalalmacen
where preparacion.revision=personalalmacen.idpersonalalmacen and preparacion.idpedido=nronota limit 1) as revisor,
(select personalalmacen.nombre from preparacion 
left join personalalmacen on preparacion.embalaje=personalalmacen.idpersonalalmacen
where preparacion.embalaje=personalalmacen.idpersonalalmacen and preparacion.idpedido=nronota limit 1) as embalador,
preparacion.fallo as fallo,
preparacion.estado as estadopreparacion,
despacho.fecha as fechadespacho,
despacho.hora as horadespacho,
despacho.estado as estadodespacho,
despachador.nombre as despachador,
envios.fecha as fechaenvio,
envios.hora as horaenvio,
envios.guia as guia,
transporte.nombre as transporte,
destino.nombre as destino,
destino.ciudad as ciudad
from pedido
left join cliente on pedido.cliente=cliente.idcliente
left join vendedor on pedido.vendedor=vendedor.idvendedor
left join preparacion on pedido.idnota=preparacion.idpedido
left join despacho on pedido.idnota=despacho.idpedido
left join despachador on despacho.iddespachador=despachador.iddespachador
left join envios on pedido.idnota=envios.idpedido
left join transporte on envios.transporte=transporte.idtransporte
left join destino on envios.destino=destino.iddestino
where pedido.idnota=nronota or pedido.idfac=nronota limit 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `resumenrapido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `resumenrapido`(
in nronota int
)
select 
pedido.idnota as nota,
pedido.idfac as factura,
pedido.fecha as fecha,
cliente.nombre as cliente,
vendedor.nombre as vendedor,
despachador.nombre as despachador,
despacho.fecha as fechadespacho
 from pedido
left join preparacion on preparacion.idpedido=pedido.idnota
left join cliente on cliente.idcliente=pedido.cliente
left join vendedor on vendedor.idvendedor=pedido.vendedor
left join despacho on pedido.idnota=despacho.idpedido
left join despachador on despacho.iddespachador=despachador.iddespachador
where pedido.idnota=nronota or pedido.idfac=nronota limit 1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `resumen_pedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `resumen_pedido`(
fecha date
)
select pedido.idnota as Nota,pedido.idfac as Factura,pedido.fecha as Fecha,cliente.nombre as Cliente,vendedor.nombre as Vendedor from pedido
inner join cliente on cliente.idcliente=pedido.cliente
inner join vendedor on vendedor.idvendedor=pedido.vendedor
inner join preparacion on preparacion.idpedido=pedido.idnota
inner join despacho on despacho.idpedido=pedido.idnota where pedido.fecha>=fecha and preparacion.estado='ABIERTO' and despacho.estado='ABIERTO' ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `subirExcelCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `subirExcelCliente`(IN COD INT, IN NOMBRE varchar(45), IN ZONA varchar(45))
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
		SELECT 'An error has occurred, operation rollbacked and the stored procedure was terminated';
	END;
	START TRANSACTION;
		INSERT INTO cliente (idcliente, nombre, zona) values(COD,NOMBRE,ZONA);
        COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `subirExcelPedido` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `subirExcelPedido`(IN nota INT, IN fac INT, IN fecha DATE, IN cliente INT, IN vendedor INT)
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
		SELECT 'An error has occurred, operation rollbacked and the stored procedure was terminated';
	END;
	START TRANSACTION;
		INSERT INTO pedido (idnota, idfac, fecha, cliente, vendedor) values(nota, fac, fecha, cliente, vendedor);
        COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `pedido_preparacion_pendiente`
--

/*!50001 DROP VIEW IF EXISTS `pedido_preparacion_pendiente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pedido_preparacion_pendiente` AS select `pedido`.`idnota` AS `Nota`,`pedido`.`idfac` AS `Factura`,`pedido`.`fecha` AS `Fecha`,`cliente`.`nombre` AS `Cliente`,`vendedor`.`nombre` AS `Vendedor` from ((((`pedido` join `cliente` on((`cliente`.`idcliente` = `pedido`.`cliente`))) join `vendedor` on((`vendedor`.`idvendedor` = `pedido`.`vendedor`))) join `preparacion` on((`preparacion`.`idpedido` = `pedido`.`idnota`))) join `despacho` on((`despacho`.`idpedido` = `pedido`.`idnota`))) where (`preparacion`.`estado` = 'PENDIENTE') */;
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

-- Dump completed on 2019-11-29 18:28:12
