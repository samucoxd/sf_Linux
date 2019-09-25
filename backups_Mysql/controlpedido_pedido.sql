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
) ENGINE=InnoDB AUTO_INCREMENT=470 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='tabla principal';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (7,87419,6434,'0000-00-00',3037,53),(23,87437,6452,'0000-00-00',3363,232),(27,87441,6456,'0000-00-00',3149,206),(42,87456,6471,'0000-00-00',3517,231),(142,87416,6431,'1970-01-01',4327,186),(147,87421,6436,'1970-01-01',3178,236),(151,87425,6440,'1970-01-01',4171,1606),(171,87447,6462,'1970-01-01',4356,196),(235,87417,6432,'1970-01-01',4471,232),(236,87418,6433,'1970-01-01',4183,186),(238,87420,6435,'1970-01-01',4667,232),(240,87422,6437,'1970-01-01',3623,231),(241,87423,6438,'1970-01-01',4284,53),(242,87424,6439,'1970-01-01',3221,53),(246,87428,6443,'1970-01-01',4658,53),(249,87432,6447,'1970-01-01',3111,53),(250,87434,6449,'1970-01-01',3600,206),(251,87435,6450,'1970-01-01',4024,232),(252,87436,6451,'1970-01-01',3646,232),(254,87438,6453,'1970-01-01',3270,53),(255,87439,6454,'1970-01-01',3336,53),(256,87440,6455,'1970-01-01',3045,53),(258,87442,6457,'1970-01-01',3121,206),(260,87444,6459,'1970-01-01',3391,206),(261,87445,6460,'1970-01-01',3299,53),(264,87448,6463,'1970-01-01',3786,196),(265,87449,6464,'1970-01-01',3652,196),(266,87450,6465,'1970-01-01',4350,196),(267,87451,6466,'1970-01-01',3661,196),(268,87452,6467,'1970-01-01',3003,232),(273,87457,6472,'1970-01-01',4226,232),(274,87458,6473,'1970-01-01',3999,232),(275,87459,6474,'1970-01-01',4651,196),(276,87460,6475,'1970-01-01',3723,196),(277,87461,6476,'1970-01-01',3477,232),(278,87462,6477,'1970-01-01',3727,196),(291,87427,6442,'1970-01-01',4171,1606),(305,87443,6458,'1970-01-01',3149,206),(308,87446,6461,'1970-01-01',3299,53),(316,87454,6469,'1970-01-01',3661,196);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ingresarNota` AFTER INSERT ON `pedido` FOR EACH ROW BEGIN
  INSERT INTO preparacion (fecha, hora, picking, revision, fallo, idpedido) VALUES(NULL,NULL,NULL,NULL,NULL,NEW.idnota);
  INSERT INTO despacho (fecha, hora, iddespachador, idpedido) VALUES(NULL,NULL,NULL,NEW.idnota);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-25 18:51:47
