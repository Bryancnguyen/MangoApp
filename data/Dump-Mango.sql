CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 5.7.16, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	5.7.16-0ubuntu0.16.10.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Matching_criteria`
--

DROP TABLE IF EXISTS `Matching_criteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Matching_criteria` (
  `idMatching_criteria` int(11) NOT NULL,
  `Alchohol` int(11) DEFAULT NULL,
  `number_of_people` int(11) DEFAULT NULL,
  `indoors` int(11) DEFAULT NULL,
  `idSlices` int(11) DEFAULT NULL,
  PRIMARY KEY (`idMatching_criteria`),
  KEY `fk_Matching_criteria_1_idx` (`idSlices`),
  CONSTRAINT `fk_Matching_criteria_1` FOREIGN KEY (`idSlices`) REFERENCES `Slices` (`idSlices`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Matching_criteria`
--

LOCK TABLES `Matching_criteria` WRITE;
/*!40000 ALTER TABLE `Matching_criteria` DISABLE KEYS */;
INSERT INTO `Matching_criteria` VALUES (1,0,2,1,NULL),(2,1,10,0,NULL),(3,1,50,0,NULL),(4,0,5,1,NULL),(5,0,1,1,NULL),(6,0,2,1,NULL);
/*!40000 ALTER TABLE `Matching_criteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reviews`
--

DROP TABLE IF EXISTS `Reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Reviews` (
  `idReviews` int(11) NOT NULL,
  `Rating` varchar(45) DEFAULT NULL,
  `Summary` varchar(45) DEFAULT NULL,
  `idSlices` int(11) DEFAULT NULL,
  `idUsers` int(11) DEFAULT NULL,
  PRIMARY KEY (`idReviews`),
  KEY `fk_Reviews_1_idx` (`idSlices`),
  KEY `fk_Reviews_2_idx` (`idUsers`),
  CONSTRAINT `fk_Reviews_1` FOREIGN KEY (`idSlices`) REFERENCES `Slices` (`idSlices`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reviews_2` FOREIGN KEY (`idUsers`) REFERENCES `Users` (`idUsers`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reviews`
--

LOCK TABLES `Reviews` WRITE;
/*!40000 ALTER TABLE `Reviews` DISABLE KEYS */;
INSERT INTO `Reviews` VALUES (1,'1','A terrible location',3,11),(2,'3','An alright location',4,12),(3,'4','A good location',2,5),(4,'4','A good location',3,7),(5,'5','A good location',1,4),(6,'5','A good location',6,1);
/*!40000 ALTER TABLE `Reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Slices`
--

DROP TABLE IF EXISTS `Slices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Slices` (
  `idSlices` int(11) NOT NULL,
  `Location` varchar(45) DEFAULT NULL,
  `Tourist` tinyint(1) DEFAULT NULL,
  `primary_criteria` int(11) DEFAULT NULL,
  `secondary_criteria` int(11) DEFAULT NULL,
  PRIMARY KEY (`idSlices`),
  KEY `fk_Slices_1_idx` (`primary_criteria`),
  KEY `fk_Slices_2_idx` (`secondary_criteria`),
  CONSTRAINT `fk_Slices_1` FOREIGN KEY (`primary_criteria`) REFERENCES `Matching_criteria` (`idMatching_criteria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Slices_2` FOREIGN KEY (`secondary_criteria`) REFERENCES `Matching_criteria` (`idMatching_criteria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Slices`
--

LOCK TABLES `Slices` WRITE;
/*!40000 ALTER TABLE `Slices` DISABLE KEYS */;
INSERT INTO `Slices` VALUES (0,'San Jose',0,1,3),(1,'Great America',0,2,3),(2,'Tech Museum',1,1,4),(3,'San Jose Bar of Drinking Responsibly',1,1,4),(4,'Computer Science Museum',0,1,3),(5,'Silicon Valley Company Campus Tour',0,4,5),(6,'San Jose Night',0,4,6);
/*!40000 ALTER TABLE `Slices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `idUsers` int(11) NOT NULL,
  `Username` varchar(45) DEFAULT NULL,
  `Password` blob,
  `Email` varchar(45) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `favorite_criteria` int(11) DEFAULT NULL,
  PRIMARY KEY (`idUsers`),
  KEY `fk_Users_1_idx` (`favorite_criteria`),
  CONSTRAINT `fk_Users_1` FOREIGN KEY (`favorite_criteria`) REFERENCES `Matching_criteria` (`idMatching_criteria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'test',NULL,'test@gmail.com',NULL,NULL),(2,'test2',NULL,'test2@gmail.com',NULL,NULL),(3,'test3',NULL,'test3@gmail.com',NULL,NULL),(4,'test4',NULL,'test4@gmail.com',NULL,NULL),(5,'test5',NULL,'test5@gmail.com',NULL,NULL),(6,'test6',NULL,'test6@gmail.com',NULL,NULL),(7,'test7',NULL,'test7@gmail.com',NULL,NULL),(8,'test8',NULL,'test8@gmail.com',NULL,NULL),(9,'test9',NULL,'test9@gmail.com',NULL,NULL),(10,'test10',NULL,'test10@gmail.com',NULL,NULL),(11,'test11',NULL,'test11@gmail.com',NULL,NULL),(12,'test12',NULL,'test12@gmail.com',NULL,NULL);
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-04 19:41:47
