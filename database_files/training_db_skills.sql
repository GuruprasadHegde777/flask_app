-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: training_db
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skills` (
  `Skill_Id` int NOT NULL AUTO_INCREMENT,
  `Skill_Name` varchar(255) DEFAULT NULL,
  `Trainer_Id` int DEFAULT NULL,
  `Trainer_Name` varchar(255) DEFAULT NULL,
  `Client_Name` varchar(255) DEFAULT NULL,
  `Client_Id` int DEFAULT NULL,
  `Created_At` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Skill_Id`),
  KEY `Trainer_Id` (`Trainer_Id`),
  KEY `Client_Id` (`Client_Id`),
  CONSTRAINT `skills_ibfk_1` FOREIGN KEY (`Trainer_Id`) REFERENCES `trainers` (`Trainer_Id`),
  CONSTRAINT `skills_ibfk_2` FOREIGN KEY (`Client_Id`) REFERENCES `clients` (`Client_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT INTO `skills` VALUES (1,'SQL',1,'Nitesh Sharma','EY India',1,'2024-02-03 16:38:03'),(2,'python',1,'Nitesh Sharma','EY India',1,'2024-02-03 16:38:03'),(3,'Azure',1,'Nitesh Sharma','EY India',1,'2024-02-03 16:38:03'),(4,'postman',1,'Nitesh Sharma','EY India',1,'2024-02-03 16:38:03'),(5,'pyspark',1,'Nitesh Sharma','EY India',1,'2024-02-03 16:38:03'),(6,'AWS',1,'Nitesh Sharma','EY India',1,'2024-02-03 16:38:03'),(7,'PowerBI',1,'Nitesh Sharma','EY India',1,'2024-02-03 16:38:03'),(8,'PowerAPPS',1,'Nitesh Sharma','EY India',1,'2024-02-03 16:38:03'),(9,'ML',1,'Nitesh Sharma','EY India',1,'2024-02-03 16:38:03'),(10,'Deep Learning',1,'Nitesh Sharma','EY India',1,'2024-02-03 16:38:03'),(11,'MLops',1,'Nitesh Sharma','EY India',1,'2024-02-03 16:38:03'),(12,'testing',1,'Nitesh Sharma','EY India',1,'2024-02-03 16:38:03'),(13,'bbbbbb',1,'Nitesh Sharma','EY India',1,'2024-02-03 16:38:03'),(16,'testing',1,'Nitesh Sharma','EY India',1,'2024-02-03 17:25:36');
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-07  0:20:53
