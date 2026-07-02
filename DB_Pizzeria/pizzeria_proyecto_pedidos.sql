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
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int DEFAULT NULL,
  `numero_mesa` int DEFAULT NULL,
  `fecha_p` datetime DEFAULT CURRENT_TIMESTAMP,
  `total_p` decimal(10,2) DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  `estado` enum('Pendiente','Cocinado','Listo','Entregado','Pagado','Cancelado') DEFAULT 'Pendiente',
  PRIMARY KEY (`id_pedido`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,NULL,4,'2026-05-27 08:44:59',31.00,1,'Pagado'),(3,NULL,4,'2026-05-27 08:47:45',37.00,1,'Pagado'),(4,NULL,4,'2026-05-27 08:48:11',18.50,1,'Pagado'),(5,2,NULL,'2026-06-01 23:52:30',15.50,1,'Entregado'),(6,2,NULL,'2026-06-02 07:51:50',15.50,1,'Entregado'),(7,2,NULL,'2026-06-02 08:25:18',15.50,1,'Entregado'),(8,2,NULL,'2026-06-02 09:17:49',15.50,1,'Entregado'),(9,2,NULL,'2026-06-02 11:52:42',15.50,1,'Entregado'),(10,2,NULL,'2026-06-02 20:40:40',15.50,1,'Entregado'),(11,2,NULL,'2026-06-02 22:14:25',15.50,1,'Entregado'),(12,2,NULL,'2026-06-02 22:39:14',15.50,1,'Entregado'),(13,2,NULL,'2026-06-03 08:43:22',64.00,1,'Entregado'),(14,2,NULL,'2026-06-03 08:51:14',15.50,1,'Pagado'),(15,2,NULL,'2026-06-09 12:32:47',37.00,1,'Entregado'),(16,2,NULL,'2026-06-09 18:40:01',15.50,1,'Pagado'),(17,2,NULL,'2026-06-09 19:45:57',20.50,1,'Entregado'),(18,2,NULL,'2026-06-09 19:46:17',20.50,1,'Entregado'),(19,2,NULL,'2026-06-09 19:46:32',1.00,1,'Entregado'),(20,2,NULL,'2026-06-09 22:20:31',16.50,1,'Entregado'),(21,NULL,4,'2026-06-10 09:58:51',20.50,1,'Pagado'),(22,NULL,4,'2026-06-10 09:59:16',15.50,1,'Pagado'),(23,NULL,4,'2026-06-10 09:59:26',20.50,1,'Pagado'),(24,2,NULL,'2026-06-16 10:39:45',20.50,1,'Entregado'),(25,2,NULL,'2026-06-16 10:41:11',1.00,1,'Entregado'),(26,NULL,4,'2026-06-16 10:42:04',21.50,1,'Pagado'),(27,2,NULL,'2026-06-16 11:04:40',20.50,1,'Entregado'),(28,2,NULL,'2026-06-16 11:32:06',15.50,1,'Entregado'),(29,2,NULL,'2026-06-16 11:38:32',15.50,1,'Entregado'),(30,NULL,4,'2026-06-16 11:39:13',15.50,1,'Pagado'),(31,2,NULL,'2026-06-16 14:07:03',37.00,1,'Entregado'),(32,NULL,4,'2026-06-16 14:09:58',1.00,1,'Pagado'),(33,NULL,4,'2026-06-16 17:57:50',1.00,1,'Pagado'),(34,2,NULL,'2026-06-16 22:59:55',20.50,1,'Entregado'),(35,2,NULL,'2026-06-16 23:13:55',20.50,1,'Entregado'),(36,2,NULL,'2026-06-16 23:28:52',20.50,1,'Entregado'),(37,2,NULL,'2026-06-17 07:14:34',15.50,1,'Pagado'),(38,2,NULL,'2026-06-17 07:28:07',15.50,1,'Entregado'),(39,2,NULL,'2026-06-21 21:37:29',15.50,1,'Entregado'),(40,2,NULL,'2026-06-21 21:38:25',15.50,1,'Entregado'),(41,2,NULL,'2026-06-21 21:56:39',20.50,1,'Entregado'),(42,2,NULL,'2026-06-21 21:56:46',15.50,1,'Pagado'),(43,2,NULL,'2026-06-21 22:02:27',15.50,1,'Entregado'),(44,2,NULL,'2026-06-21 22:03:10',15.50,1,'Pagado'),(45,2,NULL,'2026-06-22 00:53:49',20.50,1,'Pagado'),(46,NULL,4,'2026-06-22 07:37:17',20.50,1,'Pagado'),(47,10,NULL,'2026-06-22 22:10:42',15.50,1,'Pagado'),(48,10,NULL,'2026-06-22 22:11:06',20.50,1,'Pagado'),(49,2,NULL,'2026-06-22 22:15:36',15.50,1,'Pagado'),(50,2,NULL,'2026-06-22 22:30:44',15.50,1,'Pagado'),(51,2,NULL,'2026-06-22 22:57:20',15.50,1,'Pagado'),(52,2,NULL,'2026-06-22 22:57:47',1.00,1,'Entregado'),(53,2,NULL,'2026-06-22 23:05:54',15.50,1,'Pagado'),(54,2,NULL,'2026-06-22 23:09:13',15.50,NULL,'Pagado'),(55,2,NULL,'2026-06-22 23:14:58',15.50,1,'Entregado'),(56,2,NULL,'2026-06-22 23:22:37',20.50,NULL,'Entregado'),(57,10,NULL,'2026-06-22 23:23:14',5.98,NULL,'Entregado'),(58,10,NULL,'2026-06-22 23:24:37',20.50,NULL,'Entregado'),(59,10,NULL,'2026-06-22 23:25:45',41.00,NULL,'Entregado'),(60,10,NULL,'2026-06-22 23:27:13',20.50,NULL,'Entregado'),(61,10,NULL,'2026-06-22 23:35:38',20.50,NULL,'Pagado'),(62,NULL,4,'2026-06-23 07:10:51',31.00,1,'Pagado'),(63,10,NULL,'2026-06-23 08:15:27',15.50,NULL,'Pagado'),(64,10,NULL,'2026-06-23 08:16:19',15.50,NULL,'Pagado'),(65,10,NULL,'2026-06-23 08:17:59',20.50,NULL,'Pagado'),(66,10,NULL,'2026-06-23 08:26:24',1.00,NULL,'Pagado'),(67,10,NULL,'2026-06-23 08:27:05',15.50,NULL,'Pagado'),(68,10,NULL,'2026-06-23 08:45:46',15.50,NULL,'Pagado'),(69,10,NULL,'2026-06-23 08:53:33',15.50,NULL,'Entregado'),(70,2,NULL,'2026-06-23 08:55:09',15.50,NULL,'Entregado'),(71,NULL,5,'2026-06-23 08:56:52',19.49,1,'Pagado'),(72,11,NULL,'2026-06-23 11:19:06',15.50,NULL,'Entregado'),(73,2,NULL,'2026-06-23 11:44:26',15.50,NULL,'Entregado'),(74,12,NULL,'2026-06-23 11:47:55',334.50,NULL,'Entregado'),(75,2,NULL,'2026-06-29 23:22:41',20.50,NULL,'Entregado'),(76,32,NULL,'2026-06-29 23:24:31',15.50,NULL,'Entregado'),(77,32,NULL,'2026-06-29 23:32:16',15.50,NULL,'Entregado'),(78,32,NULL,'2026-06-29 23:33:18',15.50,NULL,'Entregado'),(79,2,NULL,'2026-06-29 23:33:38',20.50,NULL,'Entregado'),(80,2,NULL,'2026-06-30 13:15:26',15.50,NULL,'Entregado'),(81,2,NULL,'2026-06-30 13:16:05',20.50,NULL,'Entregado'),(82,2,NULL,'2026-06-30 13:19:02',15.50,NULL,'Pendiente'),(83,32,NULL,'2026-06-30 13:19:35',2.99,NULL,'Entregado'),(84,2,NULL,'2026-06-30 12:14:55',37.00,NULL,'Pendiente'),(85,NULL,5,'2026-06-30 17:50:41',15.50,1,'Pagado'),(86,NULL,5,'2026-06-30 17:51:12',1.00,1,'Pagado'),(87,NULL,5,'2026-06-30 17:53:19',15.50,1,'Pagado'),(88,NULL,5,'2026-06-30 18:21:18',31.00,1,'Pagado'),(89,NULL,5,'2026-06-30 18:21:42',1.00,1,'Pagado'),(90,NULL,5,'2026-06-30 18:24:35',1.00,1,'Pagado'),(91,NULL,5,'2026-06-30 18:24:58',2.99,1,'Pagado'),(92,NULL,5,'2026-06-30 18:25:06',3.00,1,'Pagado'),(93,2,NULL,'2026-06-30 18:33:46',36.00,NULL,'Pendiente'),(94,2,NULL,'2026-06-30 18:34:00',1.00,NULL,'Cancelado'),(95,32,NULL,'2026-06-30 19:48:02',37.00,NULL,'Pendiente'),(96,2,NULL,'2026-06-30 19:48:49',15.50,NULL,'Cocinado'),(97,NULL,5,'2026-06-30 19:58:14',36.00,1,'Pendiente'),(98,2,NULL,'2026-06-30 22:06:28',15.50,NULL,'Cancelado');
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-02  7:45:47
