-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: service_info_db
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `login_tbl`
--

DROP TABLE IF EXISTS `login_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_tbl` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `provider_provider_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_s6w6sosewt2qeey0ddluqkxxw` (`provider_provider_id`),
  CONSTRAINT `FKiog6iai154ysl567bfj594k04` FOREIGN KEY (`provider_provider_id`) REFERENCES `provider_tbl` (`provider_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_tbl`
--

LOCK TABLES `login_tbl` WRITE;
/*!40000 ALTER TABLE `login_tbl` DISABLE KEYS */;
INSERT INTO `login_tbl` VALUES (1,'ashish','ashish','P_a_1'),(2,'sai','sai','P_s_1');
/*!40000 ALTER TABLE `login_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_tbl`
--

DROP TABLE IF EXISTS `member_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_tbl` (
  `member_id` varchar(255) NOT NULL,
  `member_name` varchar(255) NOT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_tbl`
--

LOCK TABLES `member_tbl` WRITE;
/*!40000 ALTER TABLE `member_tbl` DISABLE KEYS */;
INSERT INTO `member_tbl` VALUES ('M_b_1','Bishal'),('M_d_1','dinesh'),('M_d_2','Dipesh'),('M_d_3','demo'),('M_k_1','khan'),('M_r_1','Ram'),('M_r_2','Radha'),('M_s_1','Shyam');
/*!40000 ALTER TABLE `member_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider_tbl`
--

DROP TABLE IF EXISTS `provider_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provider_tbl` (
  `provider_id` varchar(255) NOT NULL,
  `provider_name` varchar(255) NOT NULL,
  PRIMARY KEY (`provider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider_tbl`
--

LOCK TABLES `provider_tbl` WRITE;
/*!40000 ALTER TABLE `provider_tbl` DISABLE KEYS */;
INSERT INTO `provider_tbl` VALUES ('P_a_1','Ashish'),('P_s_1','Sai');
/*!40000 ALTER TABLE `provider_tbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_tbl`
--

DROP TABLE IF EXISTS `service_tbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_tbl` (
  `id` int NOT NULL AUTO_INCREMENT,
  `d1` varchar(5) DEFAULT NULL,
  `d10` varchar(5) DEFAULT NULL,
  `d11` varchar(5) DEFAULT NULL,
  `d12` varchar(5) DEFAULT NULL,
  `d13` varchar(5) DEFAULT NULL,
  `d14` varchar(5) DEFAULT NULL,
  `d15` varchar(5) DEFAULT NULL,
  `d16` varchar(5) DEFAULT NULL,
  `d17` varchar(5) DEFAULT NULL,
  `d18` varchar(5) DEFAULT NULL,
  `d19` varchar(5) DEFAULT NULL,
  `d2` varchar(5) DEFAULT NULL,
  `d20` varchar(5) DEFAULT NULL,
  `d21` varchar(5) DEFAULT NULL,
  `d22` varchar(5) DEFAULT NULL,
  `d23` varchar(5) DEFAULT NULL,
  `d24` varchar(5) DEFAULT NULL,
  `d25` varchar(5) DEFAULT NULL,
  `d26` varchar(5) DEFAULT NULL,
  `d27` varchar(5) DEFAULT NULL,
  `d28` varchar(5) DEFAULT NULL,
  `d29` varchar(5) DEFAULT NULL,
  `d3` varchar(5) DEFAULT NULL,
  `d30` varchar(5) DEFAULT NULL,
  `d31` varchar(5) DEFAULT NULL,
  `d4` varchar(5) DEFAULT NULL,
  `d5` varchar(5) DEFAULT NULL,
  `d6` varchar(5) DEFAULT NULL,
  `d7` varchar(5) DEFAULT NULL,
  `d8` varchar(5) DEFAULT NULL,
  `d9` varchar(5) DEFAULT NULL,
  `month` varchar(5) DEFAULT NULL,
  `member_member_id` varchar(255) NOT NULL,
  `provider_provider_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK89odi5kmyoxklnqmwq4xfqefr` (`member_member_id`),
  KEY `FK1pap2k4h4ng9b9ynefhe3m30b` (`provider_provider_id`),
  CONSTRAINT `FK1pap2k4h4ng9b9ynefhe3m30b` FOREIGN KEY (`provider_provider_id`) REFERENCES `provider_tbl` (`provider_id`),
  CONSTRAINT `FK89odi5kmyoxklnqmwq4xfqefr` FOREIGN KEY (`member_member_id`) REFERENCES `member_tbl` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_tbl`
--

LOCK TABLES `service_tbl` WRITE;
/*!40000 ALTER TABLE `service_tbl` DISABLE KEYS */;
INSERT INTO `service_tbl` VALUES (15,'a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'May','M_r_1','P_a_1'),(16,NULL,'b',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'May','M_r_2','P_a_1'),(17,'a','n','c','','','','','','','','','c','','','','','','','','','','','d','','','','','','','','','May','M_b_1','P_a_1'),(18,'a','','','d','r','','','','','','','b','','','','','','','','','','','d','','','d','','','','','','Feb','M_r_1','P_a_1'),(19,NULL,NULL,NULL,NULL,'e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'May','M_s_1','P_a_1'),(20,NULL,NULL,NULL,NULL,NULL,'f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'d',NULL,NULL,NULL,NULL,NULL,NULL,'May','M_r_1','P_s_1'),(21,'','','d','','','','','','','','','d','','','','','','','','','','','','','','a','','','','','','Feb','M_r_1','P_s_1'),(23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Jun','M_r_1','P_a_1'),(24,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Jun','M_r_2','P_a_1'),(25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Jun','M_b_1','P_a_1'),(26,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Jun','M_s_1','P_a_1'),(27,'a','d','','','','d','','','','','','b','','','r','p','e','','','','','','c','t','','','','','','','','May','M_k_1','P_a_1'),(28,'','','','','','d','','','','','','','','e','','','','','','','','','','','','','','','a','','','Jul','M_b_1','P_a_1'),(29,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Jul','M_r_1','P_a_1'),(30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Jul','M_r_2','P_a_1'),(31,'a','','','','','','','','','','','d','','','','','','','','','','','e','','','','','','','','','May','M_d_1','P_a_1'),(32,'a','','','','','e','','','','','','d','','','','','','','','','','','','','','','','','','','','May','M_d_2','P_a_1'),(33,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Aug','M_b_1','P_a_1'),(34,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Aug','M_d_2','P_a_1'),(35,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Aug','M_k_1','P_a_1'),(36,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Aug','M_r_1','P_a_1'),(37,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'May','M_d_3','P_a_1'),(38,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Oct','M_b_1','P_a_1'),(39,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Oct','M_d_1','P_a_1'),(40,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Oct','M_d_2','P_a_1'),(41,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Oct','M_d_3','P_a_1');
/*!40000 ALTER TABLE `service_tbl` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-19 14:28:01
