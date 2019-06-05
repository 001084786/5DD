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
-- Table structure for table `testitem_has_testevent`
--

DROP TABLE IF EXISTS `testitem_has_testevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testitem_has_testevent` (
  `TestItemId` int(11) NOT NULL,
  `TestEventId` int(11) NOT NULL,
  `EmployeeId` int(11) NOT NULL,
  `SupervisorID` int(11) NOT NULL,
  `TestItemTestEvent_Result` varchar(45) NOT NULL,
  `TestItemTestEvent_Comment` varchar(45) NOT NULL,
  PRIMARY KEY (`TestItemId`,`TestEventId`),
  KEY `fk_TestItem_has_TestEvent_TestEvent1_idx` (`TestEventId`),
  KEY `fk_TestItem_has_TestEvent_TestItem1_idx` (`TestItemId`),
  KEY `fk_TestItem_has_TestEvent_Technician1_idx` (`EmployeeId`,`SupervisorID`),
  CONSTRAINT `fk_TestItem_has_TestEvent_TestItem1` FOREIGN KEY (`TestItemId`) REFERENCES `testitem` (`ItemCode`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_TestItem_has_TestEvent_TestEvent1` FOREIGN KEY (`TestEventId`) REFERENCES `testevent` (`TestEventId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_TestItem_has_TestEvent_Technician1` FOREIGN KEY (`EmployeeId`) REFERENCES `technician` (`EmployeeId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testitem_has_testevent`
--

LOCK TABLES `testitem_has_testevent` WRITE;
/*!40000 ALTER TABLE `testitem_has_testevent` DISABLE KEYS */;
/*!40000 ALTER TABLE `testitem_has_testevent` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-19 21:24:42
