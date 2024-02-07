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
-- Table structure for table `feedbacks`
--

DROP TABLE IF EXISTS `feedbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedbacks` (
  `Feedback_Id` int NOT NULL AUTO_INCREMENT,
  `Trainee_Id` int DEFAULT NULL,
  `Trainee_Name` text NOT NULL,
  `Week` text NOT NULL,
  `Feedback` text NOT NULL,
  `Ratings` int NOT NULL,
  `Created_At` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Trainer_Id` int DEFAULT NULL,
  `Trainer_Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Feedback_Id`),
  KEY `Trainee_Id` (`Trainee_Id`),
  KEY `fk_tr_id` (`Trainer_Id`),
  CONSTRAINT `feedbacks_ibfk_1` FOREIGN KEY (`Trainee_Id`) REFERENCES `trainees` (`Trainee_Id`),
  CONSTRAINT `fk_tr_id` FOREIGN KEY (`Trainer_Id`) REFERENCES `trainers` (`Trainer_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedbacks`
--

LOCK TABLES `feedbacks` WRITE;
/*!40000 ALTER TABLE `feedbacks` DISABLE KEYS */;
INSERT INTO `feedbacks` VALUES (1,1,'Aaryaman Kumar','week1','Excelent Resource, Very active',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(2,1,'Aaryaman Kumar','week2','Very good Candidate, learn things very quickly',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(3,1,'Aaryaman Kumar','week3','Excellent Resource and very active on completing task',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(4,2,'Abhinandan M B','week1','Need to practice more on sql',4,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(5,2,'Abhinandan M B','week2','Attended through MS Teams , hence not commented',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(6,2,'Abhinandan M B','week3','Good resource, Need more practice to come on excellent level',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(7,3,'Adarsh N Rai','week1','Good resource, but from mechnical background so need to practice more',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(8,3,'Adarsh N Rai','week2','Good candidate, he needs to practice more',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(9,3,'Adarsh N Rai','week3','Good resource, Need more practice to come on excellent level',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(10,4,'Ankita Banerjee','week1','Very good Candidate, learn things very quickly, need to practice more',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(11,4,'Ankita Banerjee','week2','Very good Candidate, learn things very quickly',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(12,4,'Ankita Banerjee','week3','Very good Listener, Active on task- Need to practice more on all topics',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(13,5,'Arjun A','week1','Good resource but need to practise more on sql and python',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(14,5,'Arjun A','week2','Attended through MS Teams , hence not commented',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(15,5,'Arjun A','week3','Good resource, Need more practice to come on excellent level',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(16,6,'Bharat K Naik','week1','Excellent Resource, Very active and answer thing properly',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(17,6,'Bharat K Naik','week2','Excellent Resource',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(18,6,'Bharat K Naik','week3','Excellent resource, Complete the task very quickly',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(19,7,'Devprakash Bisoi','week1','Learning thing properly, Good in answering',4,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(20,7,'Devprakash Bisoi','week2','Learning things properly',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(21,7,'Devprakash Bisoi','week3','Good in completing task, should practice more on all topics',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(22,8,'Dhananjay Panwar','week1','Learning thing properly, Good in answering and getting things properly',4,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(23,8,'Dhananjay Panwar','week2','Very good Candidate, learn things very quickly',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(24,8,'Dhananjay Panwar','week3','Excellent Resource, Have a analytic mind',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(25,9,'Dipangshu Mandal','week1','Excelent Resource, Very active the work and answering',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(26,9,'Dipangshu Mandal','week2','Good candidate, he needs to practice more',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(27,9,'Dipangshu Mandal','week3','Excellent Resource, Complete the task very quickly',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(28,10,'Guruprasad Hegde','week1','Excelent Resource- so far all good with him and he get things very quickly',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(29,10,'Guruprasad Hegde','week2','Excellent Resource',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(30,10,'Guruprasad Hegde','week3','Excellent Resource, Very active in task and help others to complete',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(31,11,'Hrutik R','week1','Good resource, Getting command day by day and very active',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(32,11,'Hrutik R','week2','Excellent Resource',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(33,11,'Hrutik R','week3','Good in completing task, Takes time in completing task but if he practice more then can come to level 1',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(34,12,'Md Ata Alam','week1','Good resource but takes time to understand so he need to practice more',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(35,12,'Md Ata Alam','week2','Good candidate, he needs to practice more',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(36,12,'Md Ata Alam','week3','Good in completing task, He also take time to complete but If he practicr more than can come to level 1',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(37,13,'Pavan V Chakrasali','week1','Good resource, Getting command day by day and very active in answering',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(38,13,'Pavan V Chakrasali','week2','Good candidate, he needs to practice more',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(39,13,'Pavan V Chakrasali','week3','Excellent Resource, He created even proper document for the task I have covered',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(40,14,'Prithvi Jayachandra M','week1','Good resource but need to practise more on sql and python',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(41,14,'Prithvi Jayachandra M','week2','Attended through MS Teams , hence not commented',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(42,14,'Prithvi Jayachandra M','week3','Good resource, Need more practice on all topics',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(43,15,'Pruthvi S kiran','week1','Good resource, Getting command day by day but need to practice',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(44,15,'Pruthvi S kiran','week2','Very good Candidate, learn things very quickly',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(45,15,'Pruthvi S kiran','week3','Good in completing task, Need more practice to come on Excellent Level',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(46,16,'Ritesh','week1','Good resource, Getting command day by day and very active the class',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(47,16,'Ritesh','week2','Good candidate, he needs to practice more',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(48,16,'Ritesh','week3','Good in competing task, Need more practice to come on excellent level',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(49,17,'Sai D V','week1','Excelent Resource- so far all good with him and he get things very quickly',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(50,17,'Sai D V','week2','Excellent Resource',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(51,17,'Sai D V','week3','Excellent Resource, Super active',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(52,18,'Sayan Halder','week1','Good resource, Getting command day by day, Need to practice to get one excellent level',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(53,18,'Sayan Halder','week2','Learning things properly',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(54,18,'Sayan Halder','week3','Good in completing task, Need more practice to come on Excellent Level',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(55,19,'Sujay A. Paragave','week1','Good resource, Getting command day by day and very active in the class',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(56,19,'Sujay A. Paragave','week2','Excellent Resource',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(57,19,'Sujay A. Paragave','week3','Execelent Resource, Very active on completing task and ready to work extra on that',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(58,20,'Swapneel Sahu','week1','Good resource, Getting command day by day, He need to practice more to get one excellent level',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(59,20,'Swapneel Sahu','week2','Good candidate, he needs to practice more',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(60,20,'Swapneel Sahu','week3','Good in completing task, Need more practice to come on Excellent Level',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(61,21,'Tyagaraj Naik','week1','Good resource, Getting command day by day and very active',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(62,21,'Tyagaraj Naik','week2','Good candidate, he needs to practice more',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(63,21,'Tyagaraj Naik','week3','Good in completing task, Need more practice to come on Excellent Level',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(64,22,'Vansh Mishra','week1','Good resource, He need to practise more on SQL and python',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(65,22,'Vansh Mishra','week2','Good candidate, he needs to practice more',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(66,22,'Vansh Mishra','week3','Good in completing task but takes time to complete the task',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(67,23,'Yamunakrishnan','week1','Good resource but need to practise more on sql and python',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(68,23,'Yamunakrishnan','week2','Attended through MS Teams , hence not commented',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(69,23,'Yamunakrishnan','week3','Good resource, Need more practice on all topics',5,'2024-01-26 09:53:10',1,'Nitesh Sharma'),(70,7,'Devprakash Bisoi','5','all good all ok',1,'2024-02-03 10:24:54',1,'Nitesh Sharma'),(71,7,'Devprakash Bisoi','week5','all good all ok',1,'2024-02-03 10:26:21',1,'Nitesh Sharma');
/*!40000 ALTER TABLE `feedbacks` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-07  0:20:49
