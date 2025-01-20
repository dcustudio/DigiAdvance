CREATE DATABASE  IF NOT EXISTS `alice_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `alice_db`;
-- MySQL dump 10.13  Distrib 8.0.26, for macos11 (x86_64)
--
-- Host: localhost    Database: alice_db
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `DepartmentCode` varchar(10) NOT NULL,
  `DepartmentName` varchar(200) NOT NULL,
  `Faculty` varchar(200) DEFAULT NULL,
  `Campus` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`DepartmentCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('D1','School of Computing',' Faculty of Engineering and Computing','Glasnevin Campus'),('D2','Physics','Faculty of Science & Health','Glasnevin Campus'),('D3','Business School','Business  School','Glasnevin Campus'),('D4','Psychology','Faculty of Science & Health','Glasnevin Campus'),('D5','School of Mechanical and Manufacturing Engineering',' Faculty of Engineering and Computing','Glasnevin Campus'),('D6','School of Electronic Engineering',' Faculty of Engineering and Computing','Glasnevin Campus'),('D7','School of History and Geography','Faculty of Humanities & Social Sciences','St Patrick\'s Campus');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hasJourney`
--

DROP TABLE IF EXISTS `hasJourney`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hasJourney` (
  `JourneyID` int NOT NULL AUTO_INCREMENT,
  `StudentCode` int DEFAULT NULL,
  `TransportCode` int DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Trip` varchar(20) DEFAULT NULL,
  `Distance` float DEFAULT NULL,
  `TotalEmission` float DEFAULT NULL,
  PRIMARY KEY (`JourneyID`),
  KEY `StudentCode` (`StudentCode`),
  KEY `TransportCode` (`TransportCode`),
  CONSTRAINT `hasjourney_ibfk_1` FOREIGN KEY (`StudentCode`) REFERENCES `student` (`studentCode`),
  CONSTRAINT `hasjourney_ibfk_2` FOREIGN KEY (`TransportCode`) REFERENCES `transport` (`TransportCode`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hasJourney`
--

LOCK TABLES `hasJourney` WRITE;
/*!40000 ALTER TABLE `hasJourney` DISABLE KEYS */;
INSERT INTO `hasJourney` VALUES (1,5,1,'2022-12-09','Round',200.67,21070.3),(2,6,10,'2022-10-25','Round',298.73,15235.2),(3,8,6,'2022-09-06','Round',32.66,3265.99),(4,8,9,'2022-09-09','Single',295.2,30405.6),(5,2,7,'2022-09-09','Round',251.89,0),(6,1,9,'2022-09-28','Single',54.45,5608.35),(7,5,3,'2022-10-21','Single',218.89,21889),(8,7,8,'2022-12-05','Single',52.07,8903.96),(9,8,10,'2022-10-25','Single',11.56,589.56),(10,7,7,'2022-10-19','Round',289.72,0),(11,2,1,'2022-10-12','Round',81.52,8559.59),(12,1,9,'2022-10-31','Single',191.07,19680.2),(13,7,9,'2022-09-09','Single',45.34,4670.02),(14,3,2,'2022-09-16','Round',148.63,6093.83),(15,1,9,'2022-09-28','Single',21.92,2257.76),(16,8,3,'2022-11-19','Round',206.31,20631),(17,1,3,'2022-09-21','Round',79.98,7998),(18,4,5,'2022-10-30','Round',48.05,0),(19,6,5,'2022-09-24','Single',272.09,0),(20,4,7,'2022-10-08','Single',33.29,0);
/*!40000 ALTER TABLE `hasJourney` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `studentCode` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `County` varchar(200) DEFAULT NULL,
  `City` varchar(200) DEFAULT NULL,
  `Year` int DEFAULT NULL,
  `DepartmentCode` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`studentCode`),
  KEY `DepartmentCode` (`DepartmentCode`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`DepartmentCode`) REFERENCES `department` (`DepartmentCode`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Clem','Challenor','Dublin','Balbrigan',3,'D1'),(2,'Diane-marie','Howling','Leitrim','Mohill',1,'D7'),(3,'Mellisent','Van Dijk','Leitrim','Carrigallen',4,'D6'),(4,'Paige','Glasman','Dublin','Blanchardstown',1,'D3'),(5,'Royall','Gruby','Mayo','Newport',1,'D5'),(6,'Mallissa','Altham','Sligo','Ballymote',4,'D1'),(7,'Lesley','Tibbotts','Offaly','Tullamore',4,'D2'),(8,'Ava','Layborn','Tipperary','Abbey',4,'D7'),(9,'Denny','Keming','Louth','Dundalk',1,'D5'),(10,'Esme','Whyard','Kilkenny','Kilkenny',3,'D6');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transport`
--

DROP TABLE IF EXISTS `transport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transport` (
  `TransportCode` int NOT NULL AUTO_INCREMENT,
  `Mode` varchar(50) NOT NULL,
  `EnergySource` varchar(50) DEFAULT NULL,
  `Emission` float DEFAULT NULL,
  PRIMARY KEY (`TransportCode`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transport`
--

LOCK TABLES `transport` WRITE;
/*!40000 ALTER TABLE `transport` DISABLE KEYS */;
INSERT INTO `transport` VALUES (1,'Bus','Petrol',105),(2,'Train','Petrol',41),(3,'MotorBike','Diesel',100),(4,'Car','Petrol',192),(5,'Bike',NULL,0),(6,'Scooter','Electric',100),(7,'Walk',NULL,0),(8,'Car','Diesel',171),(9,'MotorBike','Petrol',103),(10,'Bus','Solar',51);
/*!40000 ALTER TABLE `transport` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-07 15:03:23
