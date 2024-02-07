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
-- Table structure for table `trainees`
--

DROP TABLE IF EXISTS `trainees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainees` (
  `Trainee_Id` int NOT NULL AUTO_INCREMENT,
  `Trainee_Name` varchar(255) DEFAULT NULL,
  `Trainee_Email` varchar(255) DEFAULT NULL,
  `AWS_Username` varchar(255) DEFAULT NULL,
  `AWS_Credits` float DEFAULT NULL,
  `Azure_Username` varchar(255) DEFAULT NULL,
  `Azure_Credits` float DEFAULT NULL,
  `IIHT_Score` int DEFAULT NULL,
  `Assignments_Submitted` int DEFAULT NULL,
  `Yet_to_Submit` int DEFAULT NULL,
  `Feedback_For_Trainer` text,
  `Rating_For_Trainer` int DEFAULT NULL,
  `Created_At` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Password` varchar(255) DEFAULT NULL,
  `Client_Name` varchar(255) DEFAULT NULL,
  `Joining_Date` date DEFAULT NULL,
  PRIMARY KEY (`Trainee_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainees`
--

LOCK TABLES `trainees` WRITE;
/*!40000 ALTER TABLE `trainees` DISABLE KEYS */;
INSERT INTO `trainees` VALUES (1,'Aaryaman Kumar','aaryaman.kumar@in.ey.com','awsuser1895@mml.local',100,'azuser833@mml.local',28.01,930,18,29,'Good',4,'2024-01-26 09:53:10','12345','EY India','2023-11-06'),(2,'Abhinandan M B','Abhinandan.B@in.ey.com','awsuser1898@mml.local',10.81,'azuser834@mml.local',23.45,6065,45,2,'Good',4,'2024-01-26 09:53:10','12345','EY India','2023-11-06'),(3,'Adarsh N Rai','adarsh.rai1@in.ey.com','awsuser1897@mml.local',14.49,'azuser835@mml.local',35.88,2726,33,14,'Good',4,'2024-01-26 09:53:10','12345','EY India','2023-11-06'),(4,'Ankita Banerjee','ankita.banerjee@in.ey.com','awsuser1877@mml.local',100,'azuser836@mml.local',53.86,5478,45,2,'Excellent',5,'2024-01-26 09:53:10','12345','EY India','2023-11-06'),(5,'Arjun A','Arjun.a2@in.ey.com','awsuser1899@mml.local',6.85,'azuser837@mml.local',20.79,2955,45,2,'Good',4,'2024-01-26 09:53:10','12345','EY India','2023-11-06'),(6,'Bharat K Naik','Bharat.Naik@in.ey.com','awsuser1878@mml.local',39.11,'azuser838@mml.local',38.38,3286,45,2,'Excellent',5,'2024-01-26 09:53:10','12345','EY India','2023-11-06'),(7,'Devprakash Bisoi','Devprakash.Bisoi@in.ey.com','awsuser1879@mml.local',85.04,'azuser839@mml.local',33.74,6097,44,3,'Excellent',5,'2024-01-26 09:53:10','12345','EY India','2023-11-06'),(8,'Dhananjay Panwar','Dhananjay.Panwar@in.ey.com','awsuser1880@mml.local',32.27,'azuser840@mml.local',46.14,4165,45,2,'Excellent',5,'2024-01-26 09:53:10','12345','EY India','2023-11-06'),(9,'Dipangshu Mandal','Dipangshu.Mandal@in.ey.com','awsuser1881@mml.local',100,'azuser841@mml.local',49.46,3812,45,2,'Excellent',5,'2024-01-26 09:53:10','12345','EY India','2023-11-06'),(10,'Guruprasad Hegde','Guruprasad.Hegde@in.ey.com','awsuser1882@mml.local',100,'azuser842@mml.local',61.44,4478,45,2,'Excellent',5,'2024-01-26 09:53:10','12345','EY India','2023-11-06'),(11,'Hrutik R','Hrutik.R@in.ey.com','awsuser1883@mml.local',100,'azuser843@mml.local',21.36,3620,45,2,'Excellent',5,'2024-01-26 09:53:10','12345','EY India','2023-11-06'),(12,'Md Ata Alam','md.alam5@in.ey.com','awsuser1884@mml.local',97.36,'azuser844@mml.local',18.01,6877,45,2,'Excellent',5,'2024-01-26 09:53:10','12345','EY India','2023-11-06'),(13,'Pavan V Chakrasali','pavan.chakrasali@in.ey.com','awsuser1885@mml.local',150,'azuser845@mml.local',86.94,3793,45,2,'Excellent',5,'2024-01-26 09:53:10','12345','EY India','2023-11-06'),(14,'Prithvi Jayachandra M','Prithvi.M@in.ey.com','awsuser1900@mml.local',60.06,'azuser846@mml.local',34.19,3067,45,2,'Excellent',5,'2024-01-26 09:53:10','12345','EY India','2023-11-06'),(15,'Pruthvi S kiran','Pruthvi.Kiran@in.ey.com','awsuser1886@mml.local',100,'azuser847@mml.local',40.92,3203,38,9,'Excellent',5,'2024-01-26 09:53:10','12345','EY India','2023-11-06'),(16,'Ritesh','Ritesh.1@in.ey.com','awsuser1888@mml.local',98.04,'azuser848@mml.local',45.35,7550,45,2,'Good',4,'2024-01-26 09:53:10','12345','EY India','2023-11-06'),(17,'Sai D V','sai.v@in.ey.com','awsuser1894@mml.local',14.92,'azuser849@mml.local',3.68,3982,45,2,'Excellent',5,'2024-01-26 09:53:10','12345','EY India','2023-11-06'),(18,'Sayan Halder','sayan.halder@in.ey.com','awsuser1889@mml.local',8.79,'azuser850@mml.local',23,2856,44,3,'Excellent',5,'2024-01-26 09:53:10','12345','EY India','2023-11-06'),(19,'Sujay A. Paragave','Sujay.Paragave@in.ey.com','awsuser1887@mml.local',150,'azuser852@mml.local',41.25,3095,37,10,'Excellent',5,'2024-01-26 09:53:10','12345','EY India','2023-11-06'),(20,'Swapneel Sahu','swapneel.sahu@in.ey.com','awsuser1890@mml.local',12.33,'azuser853@mml.local',18.1,3728,45,2,'Excellent',5,'2024-01-26 09:53:10','12345','EY India','2023-11-06'),(21,'Tyagaraj Naik','Tyagaraj.Naik@in.ey.com','awsuser1891@mml.local',100,'azuser854@mml.local',26.23,4436,45,2,'Excellent',5,'2024-01-26 09:53:10','12345','EY India','2023-11-06'),(22,'Vansh Mishra','Vansh.Mishra@in.ey.com','awsuser1892@mml.local',100,'azuser855@mml.local',35.25,4002,45,2,'Good',4,'2024-01-26 09:53:10','12345','EY India','2023-11-06'),(23,'Yamunakrishnan','Yamunakrishnan.1@in.ey.com','awsuser1901@mml.local',93.74,'azuser856@mml.local',22.46,7536,45,2,'Excellent',5,'2024-01-26 09:53:10','12345','EY India','2023-11-06'),(24,'testing','user@example.com',NULL,11111,NULL,7878790,1111,111,NULL,NULL,NULL,'2024-02-03 16:22:47','12345','ey','2024-02-01');
/*!40000 ALTER TABLE `trainees` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-07  0:21:33
