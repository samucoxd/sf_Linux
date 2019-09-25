CREATE DATABASE  IF NOT EXISTS `controlpedido` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `controlpedido`;
-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: controlpedido
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `despacho`
--

DROP TABLE IF EXISTS `despacho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `despacho` (
  `iddespacho` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `iddespachador` int(11) DEFAULT NULL,
  `idpedido` int(11) DEFAULT NULL,
  PRIMARY KEY (`iddespacho`),
  UNIQUE KEY `idpedido_UNIQUE` (`idpedido`),
  UNIQUE KEY `iddespachador_UNIQUE` (`iddespachador`),
  CONSTRAINT `fk_despacho_despachador` FOREIGN KEY (`iddespachador`) REFERENCES `despachador` (`iddespachador`),
  CONSTRAINT `fk_despacho_pedido` FOREIGN KEY (`idpedido`) REFERENCES `pedido` (`idpedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='registro de los despachos de los pedidos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `despacho`
--

LOCK TABLES `despacho` WRITE;
/*!40000 ALTER TABLE `despacho` DISABLE KEYS */;
/*!40000 ALTER TABLE `despacho` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-25 18:51:49
