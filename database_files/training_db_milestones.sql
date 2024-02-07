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
-- Table structure for table `milestones`
--

DROP TABLE IF EXISTS `milestones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `milestones` (
  `Milestone_Id` int NOT NULL AUTO_INCREMENT,
  `Milestone_Name` varchar(255) DEFAULT NULL,
  `Trainee_Id` int NOT NULL,
  `Trainee_Name` varchar(255) DEFAULT NULL,
  `Marks` int DEFAULT NULL,
  `Created_At` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Milestone_Id`,`Trainee_Id`),
  KEY `Trainee_Id` (`Trainee_Id`),
  CONSTRAINT `milestones_ibfk_1` FOREIGN KEY (`Trainee_Id`) REFERENCES `trainees` (`Trainee_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `milestones`
--

LOCK TABLES `milestones` WRITE;
/*!40000 ALTER TABLE `milestones` DISABLE KEYS */;
INSERT INTO `milestones` VALUES (1,'Milestone Assessment - 1',1,'Aaryaman Kumar',90,'2024-01-26 09:53:10'),(2,'Milestone Assessment - 2',1,'Aaryaman Kumar',90,'2024-01-26 09:53:10'),(3,'Milestone Assessment - 3',1,'Aaryaman Kumar',0,'2024-01-26 09:53:10'),(4,'Milestone Assessment - 4',1,'Aaryaman Kumar',0,'2024-01-26 09:53:10'),(5,'Milestone Assessment - 1',2,'Abhinandan M B',100,'2024-01-26 09:53:10'),(6,'Milestone Assessment - 2',2,'Abhinandan M B',90,'2024-01-26 09:53:10'),(7,'Milestone Assessment - 3',2,'Abhinandan M B',100,'2024-01-26 09:53:10'),(8,'Milestone Assessment - 4',2,'Abhinandan M B',100,'2024-01-26 09:53:10'),(9,'Milestone Assessment - 1',3,'Adarsh N Rai',90,'2024-01-26 09:53:10'),(10,'Milestone Assessment - 2',3,'Adarsh N Rai',60,'2024-01-26 09:53:10'),(11,'Milestone Assessment - 3',3,'Adarsh N Rai',100,'2024-01-26 09:53:10'),(12,'Milestone Assessment - 4',3,'Adarsh N Rai',95,'2024-01-26 09:53:10'),(13,'Milestone Assessment - 1',4,'Ankita Banerjee',90,'2024-01-26 09:53:10'),(14,'Milestone Assessment - 2',4,'Ankita Banerjee',95,'2024-01-26 09:53:10'),(15,'Milestone Assessment - 3',4,'Ankita Banerjee',100,'2024-01-26 09:53:10'),(16,'Milestone Assessment - 4',4,'Ankita Banerjee',100,'2024-01-26 09:53:10'),(17,'Milestone Assessment - 1',5,'Arjun A',70,'2024-01-26 09:53:10'),(18,'Milestone Assessment - 2',5,'Arjun A',100,'2024-01-26 09:53:10'),(19,'Milestone Assessment - 3',5,'Arjun A',100,'2024-01-26 09:53:10'),(20,'Milestone Assessment - 4',5,'Arjun A',85,'2024-01-26 09:53:10'),(21,'Milestone Assessment - 1',6,'Bharat K Naik',90,'2024-01-26 09:53:10'),(22,'Milestone Assessment - 2',6,'Bharat K Naik',100,'2024-01-26 09:53:10'),(23,'Milestone Assessment - 3',6,'Bharat K Naik',95,'2024-01-26 09:53:10'),(24,'Milestone Assessment - 4',6,'Bharat K Naik',100,'2024-01-26 09:53:10'),(25,'Milestone Assessment - 1',7,'Devprakash Bisoi',70,'2024-01-26 09:53:10'),(26,'Milestone Assessment - 2',7,'Devprakash Bisoi',50,'2024-01-26 09:53:10'),(27,'Milestone Assessment - 3',7,'Devprakash Bisoi',100,'2024-01-26 09:53:10'),(28,'Milestone Assessment - 4',7,'Devprakash Bisoi',95,'2024-01-26 09:53:10'),(29,'Milestone Assessment - 1',8,'Dhananjay Panwar',90,'2024-01-26 09:53:10'),(30,'Milestone Assessment - 2',8,'Dhananjay Panwar',90,'2024-01-26 09:53:10'),(31,'Milestone Assessment - 3',8,'Dhananjay Panwar',100,'2024-01-26 09:53:10'),(32,'Milestone Assessment - 4',8,'Dhananjay Panwar',95,'2024-01-26 09:53:10'),(33,'Milestone Assessment - 1',9,'Dipangshu Mandal',95,'2024-01-26 09:53:10'),(34,'Milestone Assessment - 2',9,'Dipangshu Mandal',95,'2024-01-26 09:53:10'),(35,'Milestone Assessment - 3',9,'Dipangshu Mandal',95,'2024-01-26 09:53:10'),(36,'Milestone Assessment - 4',9,'Dipangshu Mandal',94,'2024-01-26 09:53:10'),(37,'Milestone Assessment - 1',10,'Guruprasad Hegde',100,'2024-01-26 09:53:10'),(38,'Milestone Assessment - 2',10,'Guruprasad Hegde',100,'2024-01-26 09:53:10'),(39,'Milestone Assessment - 3',10,'Guruprasad Hegde',100,'2024-01-26 09:53:10'),(40,'Milestone Assessment - 4',10,'Guruprasad Hegde',100,'2024-01-26 09:53:10'),(41,'Milestone Assessment - 1',11,'Hrutik R',80,'2024-01-26 09:53:10'),(42,'Milestone Assessment - 2',11,'Hrutik R',100,'2024-01-26 09:53:10'),(43,'Milestone Assessment - 3',11,'Hrutik R',90,'2024-01-26 09:53:10'),(44,'Milestone Assessment - 4',11,'Hrutik R',95,'2024-01-26 09:53:10'),(45,'Milestone Assessment - 1',12,'Md Ata Alam',90,'2024-01-26 09:53:10'),(46,'Milestone Assessment - 2',12,'Md Ata Alam',100,'2024-01-26 09:53:10'),(47,'Milestone Assessment - 3',12,'Md Ata Alam',95,'2024-01-26 09:53:10'),(48,'Milestone Assessment - 4',12,'Md Ata Alam',100,'2024-01-26 09:53:10'),(49,'Milestone Assessment - 1',13,'Pavan V Chakrasali',90,'2024-01-26 09:53:10'),(50,'Milestone Assessment - 2',13,'Pavan V Chakrasali',100,'2024-01-26 09:53:10'),(51,'Milestone Assessment - 3',13,'Pavan V Chakrasali',100,'2024-01-26 09:53:10'),(52,'Milestone Assessment - 4',13,'Pavan V Chakrasali',100,'2024-01-26 09:53:10'),(53,'Milestone Assessment - 1',14,'Prithvi Jayachandra M',50,'2024-01-26 09:53:10'),(54,'Milestone Assessment - 2',14,'Prithvi Jayachandra M',100,'2024-01-26 09:53:10'),(55,'Milestone Assessment - 3',14,'Prithvi Jayachandra M',100,'2024-01-26 09:53:10'),(56,'Milestone Assessment - 4',14,'Prithvi Jayachandra M',100,'2024-01-26 09:53:10'),(57,'Milestone Assessment - 1',15,'Pruthvi S kiran',90,'2024-01-26 09:53:10'),(58,'Milestone Assessment - 2',15,'Pruthvi S kiran',0,'2024-01-26 09:53:10'),(59,'Milestone Assessment - 3',15,'Pruthvi S kiran',100,'2024-01-26 09:53:10'),(60,'Milestone Assessment - 4',15,'Pruthvi S kiran',100,'2024-01-26 09:53:10'),(61,'Milestone Assessment - 1',16,'Ritesh',100,'2024-01-26 09:53:10'),(62,'Milestone Assessment - 2',16,'Ritesh',100,'2024-01-26 09:53:10'),(63,'Milestone Assessment - 3',16,'Ritesh',100,'2024-01-26 09:53:10'),(64,'Milestone Assessment - 4',16,'Ritesh',95,'2024-01-26 09:53:10'),(65,'Milestone Assessment - 1',17,'Sai D V',80,'2024-01-26 09:53:10'),(66,'Milestone Assessment - 2',17,'Sai D V',100,'2024-01-26 09:53:10'),(67,'Milestone Assessment - 3',17,'Sai D V',80,'2024-01-26 09:53:10'),(68,'Milestone Assessment - 4',17,'Sai D V',100,'2024-01-26 09:53:10'),(69,'Milestone Assessment - 1',18,'Sayan Halder',90,'2024-01-26 09:53:10'),(70,'Milestone Assessment - 2',18,'Sayan Halder',80,'2024-01-26 09:53:10'),(71,'Milestone Assessment - 3',18,'Sayan Halder',100,'2024-01-26 09:53:10'),(72,'Milestone Assessment - 4',18,'Sayan Halder',85,'2024-01-26 09:53:10'),(73,'Milestone Assessment - 1',19,'Sujay A. Paragave',100,'2024-01-26 09:53:10'),(74,'Milestone Assessment - 2',19,'Sujay A. Paragave',100,'2024-01-26 09:53:10'),(75,'Milestone Assessment - 3',19,'Sujay A. Paragave',100,'2024-01-26 09:53:10'),(76,'Milestone Assessment - 4',19,'Sujay A. Paragave',95,'2024-01-26 09:53:10'),(77,'Milestone Assessment - 1',20,'Swapneel Sahu',100,'2024-01-26 09:53:10'),(78,'Milestone Assessment - 2',20,'Swapneel Sahu',100,'2024-01-26 09:53:10'),(79,'Milestone Assessment - 3',20,'Swapneel Sahu',100,'2024-01-26 09:53:10'),(80,'Milestone Assessment - 4',20,'Swapneel Sahu',100,'2024-01-26 09:53:10'),(81,'Milestone Assessment - 1',21,'Tyagaraj Naik',95,'2024-01-26 09:53:10'),(82,'Milestone Assessment - 2',21,'Tyagaraj Naik',100,'2024-01-26 09:53:10'),(83,'Milestone Assessment - 3',21,'Tyagaraj Naik',90,'2024-01-26 09:53:10'),(84,'Milestone Assessment - 4',21,'Tyagaraj Naik',100,'2024-01-26 09:53:10'),(85,'Milestone Assessment - 1',22,'Vansh Mishra',90,'2024-01-26 09:53:10'),(86,'Milestone Assessment - 2',22,'Vansh Mishra',90,'2024-01-26 09:53:10'),(87,'Milestone Assessment - 3',22,'Vansh Mishra',100,'2024-01-26 09:53:10'),(88,'Milestone Assessment - 4',22,'Vansh Mishra',90,'2024-01-26 09:53:10'),(89,'Milestone Assessment - 1',23,'Yamunakrishnan',100,'2024-01-26 09:53:10'),(90,'Milestone Assessment - 2',23,'Yamunakrishnan',80,'2024-01-26 09:53:10'),(91,'Milestone Assessment - 3',23,'Yamunakrishnan',100,'2024-01-26 09:53:10'),(92,'Milestone Assessment - 4',23,'Yamunakrishnan',90,'2024-01-26 09:53:10'),(93,'Milestone Assesment - 10',7,'Devprakash Bisoi',4,'2024-02-03 17:56:54'),(94,'Milestone Assesment - 10',1,'Aaryaman Kumar',0,'2024-02-03 17:58:03'),(95,'Milestone Assessment - 13',1,'Aaryaman Kumar',4,'2024-02-03 18:00:21');
/*!40000 ALTER TABLE `milestones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-07  0:21:00
