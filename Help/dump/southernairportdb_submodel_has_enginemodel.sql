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
-- Table structure for table `submodel_has_enginemodel`
--

DROP TABLE IF EXISTS `submodel_has_enginemodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submodel_has_enginemodel` (
  `SubModelCode` varchar(8) NOT NULL,
  `EngineModelCode` varchar(15) NOT NULL,
  `AircraftNetWeight` double NOT NULL,
  `TakeOffWeight` double NOT NULL,
  PRIMARY KEY (`SubModelCode`,`EngineModelCode`),
  KEY `fk_SubModel_has_EngineModel_EngineModel1_idx` (`EngineModelCode`),
  KEY `fk_SubModel_has_EngineModel_SubModel1_idx` (`SubModelCode`),
  CONSTRAINT `fk_SubModel_has_EngineModel_SubModel1` FOREIGN KEY (`SubModelCode`) REFERENCES `submodel` (`SubModelCode`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_SubModel_has_EngineModel_EngineModel1` FOREIGN KEY (`EngineModelCode`) REFERENCES `enginemodel` (`EngineModelCode`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submodel_has_enginemodel`
--

LOCK TABLES `submodel_has_enginemodel` WRITE;
/*!40000 ALTER TABLE `submodel_has_enginemodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `submodel_has_enginemodel` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-19 21:24:44
