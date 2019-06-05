-- MySQL dump 10.13  Distrib 5.5.27, for Win32 (x86)
--
-- Host: localhost    Database: southernairportdb
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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `AddressId` int(11) NOT NULL AUTO_INCREMENT,
  `Street` varchar(45) NOT NULL,
  `Suburb` varchar(45) DEFAULT NULL,
  `Postcode` varchar(45) NOT NULL,
  `State` varchar(45) DEFAULT NULL,
  `City` varchar(45) NOT NULL,
  `Country` varchar(45) NOT NULL,
  PRIMARY KEY (`AddressId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'Piazza Almerico Da Schio',NULL,'00054',NULL,'Fiumicino','Italy'),(2,'43C Lurline st.',NULL,'5031',NULL,'Mile End','Australia'),(3,'323 Halifax st.',NULL,'5000',NULL,'Adelaide','Australia'),(4,'8 Via Solferino',NULL,'20835',NULL,'Muggio','Italy');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aircraft`
--

DROP TABLE IF EXISTS `aircraft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aircraft` (
  `AircraftId` int(11) NOT NULL,
  `IATACode` varchar(2) NOT NULL,
  `ModelCode` varchar(4) DEFAULT NULL,
  `InternationalRegNo` varchar(6) DEFAULT NULL,
  `PassengerVariantCode` varchar(1) DEFAULT NULL,
  `CargoVariantCode` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`AircraftId`),
  KEY `fk_Aircraft_Airline1_idx` (`IATACode`),
  KEY `fk_Aircraft_PassengerVariant1_idx` (`PassengerVariantCode`),
  KEY `fk_Aircraft_CargoVariant1_idx` (`CargoVariantCode`),
  CONSTRAINT `fk_Aircraft_Airline1` FOREIGN KEY (`IATACode`) REFERENCES `airline` (`IATACode`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Aircraft_CargoVariant1` FOREIGN KEY (`CargoVariantCode`) REFERENCES `cargovariant` (`CargoVariantCode`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Aircraft_PassengerVariant1` FOREIGN KEY (`PassengerVariantCode`) REFERENCES `passengervariant` (`PassengerVariantCode`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aircraft`
--

LOCK TABLES `aircraft` WRITE;
/*!40000 ALTER TABLE `aircraft` DISABLE KEYS */;
INSERT INTO `aircraft` VALUES (1,'AZ','B177',NULL,NULL,NULL),(2,'AZ','B122',NULL,NULL,NULL);
/*!40000 ALTER TABLE `aircraft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aircrafttechnician`
--

DROP TABLE IF EXISTS `aircrafttechnician`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aircrafttechnician` (
  `AircraftId` int(11) NOT NULL,
  `EmployeeId` int(11) NOT NULL,
  PRIMARY KEY (`EmployeeId`,`AircraftId`),
  KEY `fk_AircraftTechnician_Technician1_idx` (`EmployeeId`),
  KEY `fk_AircraftTechnician_Aircraft1_idx` (`AircraftId`),
  CONSTRAINT `fk_AircraftTechnician_Aircraft1` FOREIGN KEY (`AircraftId`) REFERENCES `aircraft` (`AircraftId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_AircraftTechnician_Technician1` FOREIGN KEY (`EmployeeId`) REFERENCES `technician` (`EmployeeId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aircrafttechnician`
--

LOCK TABLES `aircrafttechnician` WRITE;
/*!40000 ALTER TABLE `aircrafttechnician` DISABLE KEYS */;
/*!40000 ALTER TABLE `aircrafttechnician` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airline`
--

DROP TABLE IF EXISTS `airline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `airline` (
  `IATACode` varchar(2) NOT NULL,
  `CountryCode` varchar(3) NOT NULL,
  `Website` varchar(80) DEFAULT NULL,
  `Phone` varchar(10) DEFAULT NULL,
  `Fax` varchar(10) DEFAULT NULL,
  `AddressId` int(11) NOT NULL,
  PRIMARY KEY (`IATACode`),
  KEY `fk_Airline_Country_idx` (`CountryCode`),
  KEY `fk_Airline_Address1_idx` (`AddressId`),
  CONSTRAINT `fk_Airline_Address1` FOREIGN KEY (`AddressId`) REFERENCES `address` (`AddressId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Airline_Country` FOREIGN KEY (`CountryCode`) REFERENCES `country` (`CountryCode`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airline`
--

LOCK TABLES `airline` WRITE;
/*!40000 ALTER TABLE `airline` DISABLE KEYS */;
INSERT INTO `airline` VALUES ('AZ','ITA',NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `airline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargovariant`
--

DROP TABLE IF EXISTS `cargovariant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cargovariant` (
  `MaxWeight` varchar(45) NOT NULL,
  `SubModelCode` varchar(8) NOT NULL,
  `CargoVariantCode` varchar(1) NOT NULL,
  PRIMARY KEY (`CargoVariantCode`),
  KEY `fk_Cargo_SubModel1` (`SubModelCode`),
  CONSTRAINT `fk_Cargo_SubModel1` FOREIGN KEY (`SubModelCode`) REFERENCES `submodel` (`SubModelCode`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargovariant`
--

LOCK TABLES `cargovariant` WRITE;
/*!40000 ALTER TABLE `cargovariant` DISABLE KEYS */;
/*!40000 ALTER TABLE `cargovariant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `CountryCode` varchar(8) NOT NULL,
  `CountryName` varchar(45) NOT NULL,
  PRIMARY KEY (`CountryCode`),
  UNIQUE KEY `CountryName_UNIQUE` (`CountryName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES ('ITA','Italy');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine`
--

DROP TABLE IF EXISTS `engine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine` (
  `EngineID` int(11) NOT NULL,
  `EngineModelCode` varchar(15) NOT NULL,
  `AircraftID` int(11) DEFAULT NULL,
  PRIMARY KEY (`EngineID`),
  KEY `fk_Engine_EngineModel1_idx` (`EngineModelCode`),
  KEY `fk_Engine_Aircraft1_idx` (`AircraftID`),
  CONSTRAINT `fk_Engine_Aircraft1` FOREIGN KEY (`AircraftID`) REFERENCES `aircraft` (`AircraftId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Engine_EngineModel1` FOREIGN KEY (`EngineModelCode`) REFERENCES `enginemodel` (`EngineModelCode`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `engine`
--

LOCK TABLES `engine` WRITE;
/*!40000 ALTER TABLE `engine` DISABLE KEYS */;
/*!40000 ALTER TABLE `engine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enginemodel`
--

DROP TABLE IF EXISTS `enginemodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enginemodel` (
  `EngineModelCode` varchar(15) NOT NULL,
  `EngineWeight` double NOT NULL,
  PRIMARY KEY (`EngineModelCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enginemodel`
--

LOCK TABLES `enginemodel` WRITE;
/*!40000 ALTER TABLE `enginemodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `enginemodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager` (
  `ManagerID` int(11) NOT NULL,
  `StartDate` date NOT NULL,
  PRIMARY KEY (`ManagerID`),
  CONSTRAINT `fk_Manager_Technician1` FOREIGN KEY (`ManagerID`) REFERENCES `technician` (`EmployeeId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (1,'0000-00-00');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model`
--

DROP TABLE IF EXISTS `model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model` (
  `ModelCode` varchar(4) NOT NULL,
  `Maker` varchar(10) NOT NULL,
  PRIMARY KEY (`ModelCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model`
--

LOCK TABLES `model` WRITE;
/*!40000 ALTER TABLE `model` DISABLE KEYS */;
/*!40000 ALTER TABLE `model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modeltechnician`
--

DROP TABLE IF EXISTS `modeltechnician`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modeltechnician` (
  `ModelCode` varchar(4) NOT NULL,
  `EmployeeID` int(11) NOT NULL,
  `QualifiedDate` date DEFAULT NULL,
  PRIMARY KEY (`ModelCode`,`EmployeeID`),
  KEY `fk_ModelTechnician_Technician1_idx` (`EmployeeID`),
  KEY `fk_ModelTechnician_Model1_idx` (`ModelCode`),
  CONSTRAINT `fk_ModelTechnician_Model1` FOREIGN KEY (`ModelCode`) REFERENCES `model` (`ModelCode`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ModelTechnician_Technician1` FOREIGN KEY (`EmployeeID`) REFERENCES `technician` (`EmployeeId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modeltechnician`
--

LOCK TABLES `modeltechnician` WRITE;
/*!40000 ALTER TABLE `modeltechnician` DISABLE KEYS */;
/*!40000 ALTER TABLE `modeltechnician` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passengervariant`
--

DROP TABLE IF EXISTS `passengervariant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passengervariant` (
  `MaxNoPassenger` varchar(45) NOT NULL,
  `SubModelCode` varchar(8) NOT NULL,
  `PassengerVariantCode` varchar(1) NOT NULL,
  PRIMARY KEY (`PassengerVariantCode`),
  KEY `fk_Passenger_SubModel1` (`SubModelCode`),
  CONSTRAINT `fk_Passenger_SubModel1` FOREIGN KEY (`SubModelCode`) REFERENCES `submodel` (`SubModelCode`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passengervariant`
--

LOCK TABLES `passengervariant` WRITE;
/*!40000 ALTER TABLE `passengervariant` DISABLE KEYS */;
/*!40000 ALTER TABLE `passengervariant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submodel`
--

DROP TABLE IF EXISTS `submodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submodel` (
  `SubModelCode` varchar(3) NOT NULL,
  `ModelCode` varchar(4) NOT NULL,
  `Width` double NOT NULL,
  `Length` double NOT NULL,
  `Height` double NOT NULL,
  `WingSpanArea` double NOT NULL,
  `MaxCruiseSpeed` double NOT NULL,
  `MaxRange` double NOT NULL,
  `TakeOffDist` double NOT NULL,
  `LandingDist` varchar(45) NOT NULL,
  PRIMARY KEY (`SubModelCode`),
  KEY `fk_SubModel_Model1_idx` (`ModelCode`),
  CONSTRAINT `fk_SubModel_Model1` FOREIGN KEY (`ModelCode`) REFERENCES `model` (`ModelCode`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submodel`
--

LOCK TABLES `submodel` WRITE;
/*!40000 ALTER TABLE `submodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `submodel` ENABLE KEYS */;
UNLOCK TABLES;

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
  CONSTRAINT `fk_SubModel_has_EngineModel_EngineModel1` FOREIGN KEY (`EngineModelCode`) REFERENCES `enginemodel` (`EngineModelCode`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_SubModel_has_EngineModel_SubModel1` FOREIGN KEY (`SubModelCode`) REFERENCES `submodel` (`SubModelCode`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submodel_has_enginemodel`
--

LOCK TABLES `submodel_has_enginemodel` WRITE;
/*!40000 ALTER TABLE `submodel_has_enginemodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `submodel_has_enginemodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `technician`
--

DROP TABLE IF EXISTS `technician`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `technician` (
  `EmployeeId` int(11) NOT NULL,
  `SupervisorId` int(11) DEFAULT NULL,
  `EmpFirstName` varbinary(255) NOT NULL,
  `EmpLastName` varbinary(255) NOT NULL,
  `Phone` varchar(45) DEFAULT NULL,
  `Salary` varchar(45) NOT NULL,
  `LoginName` varbinary(255) NOT NULL,
  `AddressId` int(11) NOT NULL,
  PRIMARY KEY (`EmployeeId`),
  KEY `fk_Technician_Technician1_idx` (`SupervisorId`),
  KEY `fk_Technician_Address1_idx` (`AddressId`),
  KEY `TechnicianFullNameIndex` (`EmpFirstName`,`EmpLastName`),
  CONSTRAINT `fk_Technician_Address1` FOREIGN KEY (`AddressId`) REFERENCES `address` (`AddressId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Technician_Technician1` FOREIGN KEY (`SupervisorId`) REFERENCES `technician` (`EmployeeId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technician`
--

LOCK TABLES `technician` WRITE;
/*!40000 ALTER TABLE `technician` DISABLE KEYS */;
INSERT INTO `technician` VALUES (1,NULL,'z“{ü~di¯¤æ2t¤¥','DiUI9Ag›ö’¾\"®#',NULL,'2000.00','•NDGº­0aÿ†Ú”)¾',2);
/*!40000 ALTER TABLE `technician` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `CASANo` int(11) NOT NULL,
  `Description` text NOT NULL,
  PRIMARY KEY (`CASANo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (1234,'This test is very important for a many of reasons');
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `testevent` VALUES (1,1,1234,NULL,'2019-05-18','2019-05-19','¢ÞûzÚjK$·Tóí,žV',NULL);
/*!40000 ALTER TABLE `testevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testitem`
--

DROP TABLE IF EXISTS `testitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testitem` (
  `ItemCode` int(11) NOT NULL,
  `CASANo` int(11) NOT NULL,
  `Description` text NOT NULL,
  PRIMARY KEY (`ItemCode`),
  KEY `fk_TestItem_Test1_idx` (`CASANo`),
  CONSTRAINT `fk_TestItem_Test1` FOREIGN KEY (`CASANo`) REFERENCES `test` (`CASANo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testitem`
--

LOCK TABLES `testitem` WRITE;
/*!40000 ALTER TABLE `testitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `testitem` ENABLE KEYS */;
UNLOCK TABLES;

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
  CONSTRAINT `fk_TestItem_has_TestEvent_Technician1` FOREIGN KEY (`EmployeeId`) REFERENCES `technician` (`EmployeeId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_TestItem_has_TestEvent_TestEvent1` FOREIGN KEY (`TestEventId`) REFERENCES `testevent` (`TestEventId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_TestItem_has_TestEvent_TestItem1` FOREIGN KEY (`TestItemId`) REFERENCES `testitem` (`ItemCode`) ON DELETE NO ACTION ON UPDATE NO ACTION
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

-- Dump completed on 2019-05-22 17:19:11
