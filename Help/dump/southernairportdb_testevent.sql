CREATE DATABASE  IF NOT EXISTS `southernairportdb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `southernairportdb`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: southernairportdb
-- ------------------------------------------------------
-- Server version	5.5.27

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
-- Table structure for table `testevent`
--

DROP TABLE IF EXISTS `testevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testevent` (
  `TestEventId` int(11) NOT NULL AUTO_INCREMENT,
  `AircraftId` int(11) NOT NULL,
  `CASANo` int(11) NOT NULL,
  `PreviousTestEventId` int(11) DEFAULT NULL,
  `TestStartTime` date NOT NULL,
  `TestEndTime` date NOT NULL,
  `TestResult` varbinary(255) NOT NULL,
  `Comment` varbinary(255) DEFAULT NULL,
  PRIMARY KEY (`TestEventId`),
  KEY `fk_TestEvent_Aircraft1_idx` (`AircraftId`),
  KEY `fk_TestEvent_Test1_idx` (`CASANo`),
  KEY `fk_TestEvent_TestEvent1_idx` (`PreviousTestEventId`),
  CONSTRAINT `fk_TestEvent_Aircraft1` FOREIGN KEY (`AircraftId`) REFERENCES `aircraft` (`AircraftId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_TestEvent_Test1` FOREIGN KEY (`CASANo`) REFERENCES `test` (`CASANo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_TestEvent_TestEvent1` FOREIGN KEY (`PreviousTestEventId`) REFERENCES `testevent` (`TestEventId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testevent`
--

LOCK TABLES `testevent` WRITE;
/*!40000 ALTER TABLE `testevent` DISABLE KEYS */;
INSERT INTO `testevent` VALUES (1,1,1234,NULL,'2019-05-18','2019-05-19','¢\Þûz\ÚjK$·Tó\í,žV',NULL);
/*!40000 ALTER TABLE `testevent` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-19 21:24:39
