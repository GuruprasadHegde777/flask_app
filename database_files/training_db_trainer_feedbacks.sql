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
-- Table structure for table `trainer_feedbacks`
--

DROP TABLE IF EXISTS `trainer_feedbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainer_feedbacks` (
  `Feedback_Id` int NOT NULL AUTO_INCREMENT,
  `Trainee_Id` int DEFAULT NULL,
  `Trainee_Name` varchar(255) DEFAULT NULL,
  `Trainer_Id` int DEFAULT NULL,
  `Feedback_For_Trainer` text,
  `Rating_For_Trainer` int DEFAULT NULL,
  `Created_At` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Trainer_Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Feedback_Id`),
  KEY `Trainee_Id` (`Trainee_Id`),
  KEY `Trainer_Id` (`Trainer_Id`),
  CONSTRAINT `trainer_feedbacks_ibfk_1` FOREIGN KEY (`Trainee_Id`) REFERENCES `trainees` (`Trainee_Id`),
  CONSTRAINT `trainer_feedbacks_ibfk_2` FOREIGN KEY (`Trainer_Id`) REFERENCES `trainers` (`Trainer_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainer_feedbacks`
--

LOCK TABLES `trainer_feedbacks` WRITE;
/*!40000 ALTER TABLE `trainer_feedbacks` DISABLE KEYS */;
INSERT INTO `trainer_feedbacks` VALUES (1,1,'Aaryaman Kumar',1,'Excellent',5,'2024-01-26 07:26:49','Nitesh Sharma'),(2,2,'Abhinandan M B',1,'Excellent',5,'2024-01-26 07:26:49','Nitesh Sharma'),(3,3,'Adarsh N Rai',1,'Excellent',5,'2024-01-26 07:26:49','Nitesh Sharma'),(4,4,'Ankita Banerjee',1,'Excellent',5,'2024-01-26 07:26:49','Nitesh Sharma'),(5,5,'Arjun A',1,'Excellent',5,'2024-01-26 07:26:49','Nitesh Sharma'),(6,6,'Bharat K Naik',1,'Excellent',5,'2024-01-26 07:26:49','Nitesh Sharma'),(7,7,'Devprakash Bisoi',1,'Excellent',5,'2024-01-26 07:26:49','Nitesh Sharma'),(8,8,'Dhananjay Panwar',1,'Excellent',5,'2024-01-26 07:26:49','Nitesh Sharma'),(9,9,'Dipangshu Mandal',1,'Excellent',5,'2024-01-26 07:26:49','Nitesh Sharma'),(10,10,'Guruprasad Hegde',1,'Excellent',5,'2024-01-26 07:26:49','Nitesh Sharma'),(11,11,'Hrutik R',1,'Excellent',5,'2024-01-26 07:26:49','Nitesh Sharma'),(12,12,'Md Ata Alam',1,'Excellent',5,'2024-01-26 07:26:49','Nitesh Sharma'),(13,13,'Pavan V Chakrasali',1,'Excellent',5,'2024-01-26 07:26:50','Nitesh Sharma'),(14,14,'Prithvi Jayachandra M',1,'Excellent',5,'2024-01-26 07:26:50','Nitesh Sharma'),(15,15,'Pruthvi S kiran',1,'Excellent',5,'2024-01-26 07:26:50','Nitesh Sharma'),(16,16,'Ritesh',1,'Excellent',5,'2024-01-26 07:26:50','Nitesh Sharma'),(17,17,'Sai D V',1,'Excellent',5,'2024-01-26 07:26:50','Nitesh Sharma'),(18,18,'Sayan Halder',1,'Excellent',5,'2024-01-26 07:26:50','Nitesh Sharma'),(19,19,'Sujay A. Paragave',1,'Excellent',5,'2024-01-26 07:26:50','Nitesh Sharma'),(20,20,'Swapneel Sahu',1,'Excellent',5,'2024-01-26 07:26:50','Nitesh Sharma'),(21,21,'Tyagaraj Naik',1,'Excellent',5,'2024-01-26 07:26:50','Nitesh Sharma'),(22,22,'Vansh Mishra',1,'Excellent',5,'2024-01-26 07:26:50','Nitesh Sharma'),(23,23,'Yamunakrishnan',1,'Excellent',5,'2024-01-26 07:26:50','Nitesh Sharma'),(24,10,'Guruprasad Hegde',2,'testingggggggggggggggggggggggggggggggggggggggggggggg',4,'2024-02-04 13:00:53','testing');
/*!40000 ALTER TABLE `trainer_feedbacks` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-07  0:21:51
