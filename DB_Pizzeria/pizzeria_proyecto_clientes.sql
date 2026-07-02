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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre_cl` varchar(50) DEFAULT NULL,
  `apellido_cl` varchar(50) DEFAULT NULL,
  `correo_cl` varchar(50) DEFAULT NULL,
  `contraseña_cl` varchar(255) DEFAULT NULL,
  `telefono_cl` varchar(10) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'victor','toasa','victortoasa@gmail.com','scrypt:32768:8:1$kh2BsWnTjbD0CdS0$ae9418aacbd386e8fa77a93bfbe0402d7b8c42110e7a5e688899f0ba1c0fe1d19dde3d8798ae1f86f654492788424c149169c46e55f008b606662b9bf1e46f71','0987654321','quisapincha, calvario, sucre'),(2,'victor','toasa','victor@gmail.com','scrypt:32768:8:1$CiDy8OS3bj5rjcQ5$e591d98cb0b67acfbb75cd20c36d9b183fe60027a8f2e183c4fb516fd7d0002d679bdcb562f067847db8cf783569b89cb4d0520f4a03368f31b4d1b5551d2e60','0987654321','quisapincha'),(3,'jennifer','chalco ','jenni_ch@gmail.com','scrypt:32768:8:1$49kBWlEbvQySdBKK$90f5b6be268a65034c3635b9f317022882754853064d41948c5d2b100be760234751e8a462f136713729b9f5496a787feec58596d32bab5dcae62ae0c4ba0b21','0987654321','Ambato, Centro'),(4,'jennifer','chalco ','jenni_cha@gmail.com','scrypt:32768:8:1$16dg6jTqnfkX6J8e$14b87afe5c098011d76b3e905cdd35989b744df7ff6f7ee5cd0297192f7346e31ac8db457fb865a3b0a778f16d6f5d367ed002c300b1a2e8f3fcbcad7973db15','0987654321','Ambato, Centro'),(5,'jennifer','chalco ','jenni_cha@gmail.com','scrypt:32768:8:1$Iq9OeyXs7qGOQ6OI$58deeab3cb0216342eced014764c6954f8b891817cb90683f81c69f0e96168251cca3a9cc7e9f6fea0fd10659688e3338789766a838f75a3aa01e959bb177073','0987654321','Ambato, Centro'),(6,'arroz','con pollo ','arroz@gmail.com','scrypt:32768:8:1$8doTh3v1WbMRe6nH$b61a0a26698e86d54e70a6bf1ed750ba3eff2ab196fce6e6d9cd37c90ab9d60c8ba13171f253d07cf5656483defecf8c984c7b44d3fefab917a865447968fbfb','0987654321','cuenca'),(7,'v','t','vtg@gmail.com','scrypt:32768:8:1$AmySc4uMAM85g1Xx$0bfc4298450ce79c818fbc35536b390ffb110bd998205d4a3874821e79d8dcc70cdf637cd2c4938856e44cf5139872bdaf4d56ea887afa1fd8d992d2b9dd0221','0987654321','Quisapincha'),(8,'jenni','chalco','jenni@gmail.com','scrypt:32768:8:1$84cyyp9GHrMczSwQ$95040985ac3e31da55d660ba18aa2719ca5a6f27eafe7efee89fed4dde7b535edd1d771d873fcb71ae700120316d3899d98b80e8d5171114fd822fc3e624fbcd','0987654321','Condezan,Quizapincha'),(9,'arroz','pollo','arroz@gmail.com','scrypt:32768:8:1$KpCHo6DYsdK3d0XM$96214b85b2e3b0da62b45451118d56e9f805e4b05c4c6b21f6daa00ba04c384ae01266f31a28a74587d7e0cadf7c3341eb43a3b87bdb33644ca754deb4377880','0987654321','Ambato, Pinllo '),(10,'arroz','pollo','arrozp@gmail.com','scrypt:32768:8:1$BLyOMOapIv3rCwIg$e5b04f8edfec9735d8ffefd2964b1efc78083fb7091539add09ebefb075d066e818fb9f036dd75c7bc013c84971c0831529d23efc19d8996799009304aa695e2','0987654321','Ambato, Pinllo '),(11,'Dilon','Lagua','dilon@gmail.com','scrypt:32768:8:1$T3RBc4btbbEaoJZU$7efadd145c4dda497034dfb86809fd13567c9bd4c30b4d2812618b234c51e32f186735c41a9d111673bcbed48684e8eea1e40489fe1efd01b324b715132754cf','0999999999','Ambato, Ficoa'),(12,'GIOVANNI','Lagua','dilonL@gmail.com','scrypt:32768:8:1$Oqr7oTdxom7XNkeO$d660e9b541e6d189a68c111d554dec017895698e7e4a0115494c6e40d44852b13cffe175f4d58e89d5c6af5cd1db218b50a0c9181fd14dd37bc37d386d6b5eba','0999999999','HUHHU'),(13,'homero','simpson','homero@gmail.com','scrypt:32768:8:1$j3XDWj9gZkVPJb5O$7bef240f31df0a77fc930857e8b6925173c0ddfefd4d846c84f00111d655ecf220308b524ff36a8ed43e3da948a13ec93877ab7e9011b4cbea1ff4eb43964fc0','0987654321','Sprintfield'),(14,'homero','simpson','homero@gmail.com','scrypt:32768:8:1$uxKO8F0c1JXUenC6$879aff92f858c546bed09248a108511f5df32b5d0191830d4f7d3f9c1c47a553adea0c83348c13e4cd269931c5921d98dc6cbf2197abe39f601cc7aa6114ecd1','0987654321','Sprintfield'),(15,'homero','simpson','homero@gmail.com','scrypt:32768:8:1$9RMC7XhUHQ105uuz$4a5508723a81c9631fc3d308283a4290a03108e7135f8a4fee4d94b10610fe1f13ae00dadc1069f4c3b5f8251e81de8f804fe83d0900c95ebab3c87552ccf11e','0987654321','Sprintfield'),(16,'homero','simpson','homero@gmail.com','scrypt:32768:8:1$CMWCxGEYdIIDV1jY$13241250a58c9cde3a8e500a737ac07ee052ccdee12098629e3cfa721b391e1dda57c67e6f3f86e65d7f973cd24aa6c4d0a3d7f6e91b1bdfaff8507fee7edc32','0987654321','Sprintfield'),(17,'homero','simpson','homero@gmail.com','scrypt:32768:8:1$pRg9GoO4juQpboGd$6df15276b379d638153eda95794e39bf9bc8d44d5687c7da416526b305f6de3d77ec235676d74d93c77545289a083b1d02c69e2adef5f233910f3fbaf7338c2a','0987654321','Sprintfield'),(18,'homero','simpson','homero@gmail.com','scrypt:32768:8:1$gBpriydqfks533Nb$4a5c8664e97e30829206ad8ce878577b50d92c4cb114d0b1a2241db74f754af37174073e2d1a113be6412f8d3b762f887a3a169bb329181dbc6eb2bd7d616e42','0987654321','Sprintfield'),(19,'homero','simpson','homero@gmail.com','scrypt:32768:8:1$H9X7zLeCzxRG4P4l$fe99263f6e957794a7d46fb7eb627a6a040a417fafdb33a6eeec2fd4284e2045bbea18f43a6dec0eade568cf3c8059210c0757a06a06ed1af7d42ab661ae6dd5','0987654321','Sprintfield'),(20,'bart','simpson','bart@gmail.com','scrypt:32768:8:1$Dhc5NVeJ8V9fFO49$d19486b66165d11b1d417bdd33292b8629eeacce6774dcf8a55f86e3ddac0dc51aab2727808fe4922002dc1c574767c0813d578460194234edd98be2013f3405','0987654321','Sprinfield'),(21,'jose','jose','jose@gmail.com','scrypt:32768:8:1$v5Ssm91rMqrW35wL$29c840d411cf56ee69fdec532434e3954dfa1182c5ee12cfdeabb5f222d19924e85a05a5721a30a6c2d3971f6e54dcacd18515538f16caf4ccfba2da4f3b840a','0999999999','ambato'),(22,'lisa','simpson','lisa@gmail.com','scrypt:32768:8:1$g2sEff567jYPJIvi$bf2bdc6e033ce835e09d051177fa51648ef036df831fd2df72ec01c48e3f9658fcba42bc52cf039706444d9c744fb9cf0a8582df4701c90e92d30d471be1beae','0987654321','Sprinfield'),(23,'march','simpson','march@gmail.com','scrypt:32768:8:1$YoTz1A3H0BojQFYi$eea71988a366bbddf29730bc3883b94150a501e47fb1e75400f4c34c98605fc32c573d95044c5a5ad821d0f2c498e78b595f6cd575a6b3f741c25149b89bb3db','0987654321','Sprinfield'),(24,'magie','simpson','magie@gmail.com','scrypt:32768:8:1$i336oj1OfIqwh1Jb$e0853b12417f423bb79cb175172e3400d3fcfe57416de27053b0faab39ac9e576e251ed8e3db9dea14c7e73eb63a03e2559c8f258abf6863dd640efc28177259','0987654321','Sprinfield'),(25,'silvia','toasa','silvia@gmail.com','scrypt:32768:8:1$NyfCKrW0qI31vMRI$7c46f767406bdb5d0399f0bc655cb9999f97d25d4a889ccd111986a00ea06e7db644434b6045c77384fa93bdd91004dcc124fa897d6d20764a720f1578bdc76a','099999999','quisapincha'),(26,'victor','toasa','victort@gmail.om','scrypt:32768:8:1$GKAAtFi7kmdY0oV4$7ce3e8032b799bb9dd7cfdeaf9e39aeeda9af941697db70efbadd6d6b0d8f2cf7f3501fd955f1693f25f33126671869641278110512e5e49faa8459c8ba5e853','099999999','quisapincha'),(27,'sofia','toasa','sofiat@gmail.com','scrypt:32768:8:1$MesWbSVdSIpGgc2E$acb3bbbbf8dd45c0502f7995eb5d4dc9cdab830f3558bc5ee2dc374945039ebd00eb2c27865a4cb4a15b7ed8354e522a8912d4e4646bbd32c78a0eb548be2f82','0999999999','quisa'),(28,'victor','manuel','manuel@gmail.com','scrypt:32768:8:1$uCxPxWlDpDwpcabd$aa9ec8eb77a4165b38259a90926586c1442ff37f4d748dcb6ffcb591c73d7cdba31f39e8157d9396c6f5d82d0d3fc4e45c793c94b02ae025caa561f256204a12','0987654321','quisa'),(29,'gabriel','toasa','toasa@gmail.com','scrypt:32768:8:1$n5TTJg6qBAT6Lp0c$9b40b3d067809db7548f53d5e179a81dd9eff4fe68fab586bc39ef938adb2abe504dd13478df8d1c983a2046f266eac13a38275ca9d8fd5af9e5b227e0316076','0987654311','quisapincha'),(30,'martha','toasa','martha@gmail.com','scrypt:32768:8:1$N2fHwhfaF1wkMbPD$aeb8d0921c9907039ea6cf1ca40bc7197032db8730baf3c2dae29b6edb3b7cbf3971717a7a386b1d07cb4021d66079cb87575209f7e00707cee2c5900cb67ebd','0999999999','Pinllo'),(31,'german','garmendia','germang@gmail.com','scrypt:32768:8:1$7YjzkowmMlJrTur5$49c065e79c0d281e761612e6918b5a8ebc14931d710f23ddb2660588150d149d21d551649b5b6669dee41d56b71b637764d84dba4c4af8bd46e2615eba259f3c','0999999999','Alemania'),(32,'german','garmendia','germanga@gmail.com','scrypt:32768:8:1$CwptokTfFVffqC6x$03f6a82550d89bc96ab0df80391ba45617cd80d3b294288c46ac5a47da3c77f4a70d7db41874210e7819c23850bbd284434f85df311d6c3406a9458ce439051d','0999999999','Alemania');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
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
