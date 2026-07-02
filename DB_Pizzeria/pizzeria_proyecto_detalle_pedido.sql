-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pizzeria_proyecto
-- ------------------------------------------------------
-- Server version	8.4.3

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
-- Table structure for table `detalle_pedido`
--

DROP TABLE IF EXISTS `detalle_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_pedido` (
  `id_detallep` int NOT NULL AUTO_INCREMENT,
  `id_producto` int DEFAULT NULL,
  `id_pedido` int DEFAULT NULL,
  `cantidad_v` int DEFAULT NULL,
  `precio_unitario` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_detallep`),
  KEY `id_producto` (`id_producto`),
  KEY `id_pedido` (`id_pedido`),
  CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  CONSTRAINT `detalle_pedido_ibfk_2` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_pedido`
--

LOCK TABLES `detalle_pedido` WRITE;
/*!40000 ALTER TABLE `detalle_pedido` DISABLE KEYS */;
INSERT INTO `detalle_pedido` VALUES (1,1,1,2,15.50),(2,1,3,2,18.50),(3,1,4,1,18.50),(4,1,5,1,15.50),(5,1,6,1,15.50),(6,1,7,1,15.50),(7,1,8,1,15.50),(8,1,9,1,15.50),(9,1,10,1,15.50),(10,1,11,1,15.50),(11,1,12,1,15.50),(12,1,13,4,15.50),(13,5,13,2,1.00),(14,1,14,1,15.50),(15,1,15,1,15.50),(16,7,15,1,20.50),(17,5,15,1,1.00),(18,1,16,1,15.50),(19,7,17,1,20.50),(20,7,18,1,20.50),(21,5,19,1,1.00),(22,1,20,1,15.50),(23,5,20,1,1.00),(24,7,21,1,20.50),(25,1,22,1,15.50),(26,7,23,1,20.50),(27,7,24,1,20.50),(28,5,25,1,1.00),(29,5,26,1,1.00),(30,7,26,1,20.50),(31,7,27,1,20.50),(32,1,28,1,15.50),(33,1,29,1,15.50),(34,1,30,1,15.50),(35,1,31,1,15.50),(36,7,31,1,20.50),(37,5,31,1,1.00),(38,5,32,1,1.00),(39,5,33,1,1.00),(40,7,34,1,20.50),(41,7,35,1,20.50),(42,7,36,1,20.50),(43,1,37,1,15.50),(44,1,38,1,15.50),(45,1,39,1,15.50),(46,1,40,1,15.50),(47,7,41,1,20.50),(48,1,42,1,15.50),(49,1,43,1,15.50),(50,1,44,1,15.50),(51,7,45,1,20.50),(52,7,46,1,20.50),(53,1,47,1,15.50),(54,7,48,1,20.50),(55,1,49,1,15.50),(56,1,50,1,15.50),(57,1,51,1,15.50),(58,5,52,1,1.00),(59,1,53,1,15.50),(60,1,54,1,15.50),(61,1,55,1,15.50),(62,7,56,1,20.50),(63,8,57,2,2.99),(64,7,58,1,20.50),(65,7,59,2,20.50),(66,7,60,1,20.50),(67,7,61,1,20.50),(68,1,62,2,15.50),(69,1,63,1,15.50),(70,1,64,1,15.50),(71,7,65,1,20.50),(72,5,66,1,1.00),(73,1,67,1,15.50),(74,1,68,1,15.50),(75,1,69,1,15.50),(76,1,70,1,15.50),(77,1,71,1,15.50),(78,5,71,1,1.00),(79,8,71,1,2.99),(80,1,72,1,15.50),(81,1,73,1,15.50),(82,1,74,20,15.50),(83,7,74,1,20.50),(84,5,74,1,1.00),(85,9,74,1,3.00),(86,7,75,1,20.50),(87,1,76,1,15.50),(88,1,77,1,15.50),(89,1,78,1,15.50),(90,7,79,1,20.50),(91,1,80,1,15.50),(92,7,81,1,20.50),(93,1,82,1,15.50),(94,8,83,1,2.99),(95,1,84,1,15.50),(96,7,84,1,20.50),(97,5,84,1,1.00),(98,1,85,1,15.50),(99,5,86,1,1.00),(100,1,87,1,15.50),(101,1,88,2,15.50),(102,5,89,1,1.00),(103,5,90,1,1.00),(104,8,91,1,2.99),(105,9,92,1,3.00),(106,1,93,1,15.50),(107,7,93,1,20.50),(108,5,94,1,1.00),(109,1,95,1,15.50),(110,7,95,1,20.50),(111,5,95,1,1.00),(112,1,96,1,15.50),(113,1,97,1,15.50),(114,7,97,1,20.50),(115,1,98,1,15.50);
/*!40000 ALTER TABLE `detalle_pedido` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-01  4:33:49
