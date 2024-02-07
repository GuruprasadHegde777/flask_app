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
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects` (
  `Project_Id` int NOT NULL AUTO_INCREMENT,
  `Trainee_Id` int DEFAULT NULL,
  `Skill` text NOT NULL,
  `Project_Name` text NOT NULL,
  `Trainee_Name` text NOT NULL,
  `Created_At` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Project_Id`),
  KEY `Trainee_Id` (`Trainee_Id`),
  CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`Trainee_Id`) REFERENCES `trainees` (`Trainee_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,13,'Powerapps','Canvas app for analytics bootcamp','Pavan V Chakrasali','2024-01-26 09:53:10'),(2,13,'PowerBI','Dashboard for analytics bootcamp','Pavan V Chakrasali','2024-01-26 09:53:10'),(3,17,'Azure OpenAI','Fullstack application Web Chatbot','Sai D V','2024-01-26 09:53:10'),(4,14,'Azure OpenAI','Fullstack application Web Chatbot','Prithvi Jayachandra M','2024-01-26 09:53:10'),(5,15,'Azure OpenAI','Fullstack application Web Chatbot','Pruthvi S kiran','2024-01-26 09:53:10'),(6,19,'Azure + Front End','Fullstack application For Training Management','Sujay A. Paragave','2024-01-26 09:53:10'),(7,10,'Azure + Front End','Fullstack application For Training Management','Guruprasad Hegde','2024-01-26 09:53:10'),(8,7,'Azure + Front End','Fullstack application For Training Management','Devprakash Bisoi','2024-01-26 09:53:10'),(9,10,'SQL','testing','Guruprasad Hegde','2024-02-04 12:30:15');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-07  0:21:44
