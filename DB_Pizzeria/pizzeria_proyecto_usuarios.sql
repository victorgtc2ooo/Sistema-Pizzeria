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
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre_u` varchar(50) DEFAULT NULL,
  `apellido_u` varchar(50) DEFAULT NULL,
  `correo_u` varchar(50) DEFAULT NULL,
  `contraseña_u` varchar(255) DEFAULT NULL,
  `telefono_u` varchar(10) DEFAULT NULL,
  `rol` enum('Administrador','Cocina','Mesero','Cajero') DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Víctor','Toasa','victor@pizzeria.com','scrypt:32768:8:1$ydn5jxu0lvU66hqy$c9150dd91b63165ba5214831fcd2003347cc3178fe30f73a6a970845dfcdde09d270291943a1408ac5a249835ec258f6c0d757b409f98423bfa1dcf56648bd45','0999999999','Cocina'),(2,'Carlos','Perez','carlos@pizzeria.com','scrypt:32768:8:1$P6nCOZ8G78NmWuVB$a55d5d952e8c22bf28946df1bc3bf0596a584c54746bf3857161801ed60fa060c96f08ff9fa82b8ad1b2420108ec4aa9d9dfcb3f43260e009206586d301a06ea','0987654321',NULL),(3,'victor','toasa','victorgtc@gmail.com','scrypt:32768:8:1$fL60ajPcpGfN80RB$439faefe3180af0232c742ddaa649b7db64e316802d0b03cd4ee70a3b3af2eeb249c7310ba1fd6e8cab1a13e52d91b925ff7af651b67162af7bba341ccd42cbb','0987654321','Administrador'),(4,'sofia','toasa','sofia@gmail.com','scrypt:32768:8:1$7LWBfDoCzAooR13K$3c674f6428cab2479d8693ffd188558ca21a141f9313c88c2980f5371849193aa93c63bbb50c33490c32b0990d61e90c787fb4b73883bb2d69250d8e8000578d','0987654321','Administrador'),(5,'braulio','silva','braulio@gmail.com','scrypt:32768:8:1$5BgCN2TT7FYeLboa$da64c69c7e951feff94105b52fdb01d3cdafb3de649bc29f5e297d2b1b97f724104c8b66f0d182fa571f9e77355d5956f7b349a43e8e23fcc2258422092c35bd','0987654321','Cocina'),(6,'esteban','ruiz','esteban@gmail.com','scrypt:32768:8:1$MGvImebC5H2XGNg2$dd912a0d4c3d97686337077c068bef5ec55642bbe9c2f8ad912f9fc4829089a8352b96ac48a47c98852acdd6b76f6d0f461dc29ec49fa0c94cf0ef90b3f0b735','0987654321','Cocina'),(7,'Richard','Herkt','richard@gmail.com','scrypt:32768:8:1$RKgs4vJYCYbWbEyT$dad7ccc47e67041a296881b1b1e672dae3448c9d845247188aac7f1431cddd71f8343ed90b3094f476cd22b291ae3baca717899199ce89be040ace5ad559a267','0999999999','Cajero'),(8,'Víctor','Toasa','victor@pizzeria.com','scrypt:32768:8:1$rtYwk7X43GVJDBHT$76b766c430aa8c2f95d3d0bf84fe71ed0ea02791de74910f8a194c9cc8bb9e835bca1b5aa779f8b7bbe1f80611b7f58ac4ec5a8ecb85140dc100185e04ecc52d','0999999999','Administrador'),(9,'Carlos','Perez','victor@pizzeria.com','scrypt:32768:8:1$5qcgVkfOYghQQwgq$510f1fe75927e5a0341ff17c66481504f674e873268ae287c759e48c1701ca226f04f1f75ab62e7ceda8fc1891e51b18617d8ab763cf523f95bf0a8aab552738','0987654321','Administrador'),(10,'Víctor','Prueba1','victor@pizzeria.com','scrypt:32768:8:1$G7gJbcAdMnXyusqV$21b09c5b3ef1d132235e6cc33822502eaa637e06c94ee7a3d866aa833b73451dfe3a9fe8d71a49aab2695a20703fa015dfb02c6041778416aebca81f6b28e0bf','0999999999','Administrador'),(11,'Javier','Palacios','javier@gmail.com','scrypt:32768:8:1$6CQ3DwZ6IgNuHxne$f71ea169966cadc311317a9e0bce6d6417ab147ecf0fc589fd1bf0fdd34429d25cbe650f6e9951dcbb831194225c41a7e5063a7cef0e82c93f9b6bd1db29f294','0987654321','Cajero'),(13,'german','garmendia','german@gmail.com','scrypt:32768:8:1$Kb6xEwasja82cpdQ$000fa344fc8d6608473d2dcd8c6df1f00790da948356414b5f433f20a75672b13fc56932f15367f584d5f3b77151ab06c17f4dcdd00f35d02643f7244096a7a6','0999999999','Cocina');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
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
