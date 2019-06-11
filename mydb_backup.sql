-- MySQL dump 10.13  Distrib 5.5.36, for Win32 (x86)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	5.5.36

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
  `AirlineID` char(2) NOT NULL,
  `Street` varchar(45) NOT NULL,
  `Suburb` varchar(45) NOT NULL,
  `Postcode` varchar(45) NOT NULL,
  `State` varchar(45) NOT NULL,
  `CountryName` varchar(45) NOT NULL,
  PRIMARY KEY (`AirlineID`),
  CONSTRAINT `AirlineID1` FOREIGN KEY (`AirlineID`) REFERENCES `airline` (`AirlineID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aircraft`
--

DROP TABLE IF EXISTS `aircraft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aircraft` (
  `AircraftID` int(11) NOT NULL AUTO_INCREMENT,
  `RegNo` varchar(45) NOT NULL,
  `SubModelCode` varchar(45) NOT NULL,
  `PassengerAirlinerID` int(11) DEFAULT NULL,
  `CargoFreighterID` int(11) DEFAULT NULL,
  PRIMARY KEY (`AircraftID`),
  KEY `fk_Aircraft_Airline1_idx` (`RegNo`),
  KEY `fk_Aircraft_SubModel1_idx` (`SubModelCode`),
  KEY `PassengerAirlinerID1_idx` (`PassengerAirlinerID`),
  KEY `CargoFreighterID1_idx` (`CargoFreighterID`),
  CONSTRAINT `fk_Aircraft_Airline1` FOREIGN KEY (`RegNo`) REFERENCES `airline` (`AirlineID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Aircraft_SubModel1` FOREIGN KEY (`SubModelCode`) REFERENCES `submodel` (`SubModelCode`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `PassengerAirlinerID1` FOREIGN KEY (`PassengerAirlinerID`) REFERENCES `passengerairliner` (`PassengerAirlinerID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `CargoFreighterID1` FOREIGN KEY (`CargoFreighterID`) REFERENCES `cargofreighter` (`CargoFreighterID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aircraft`
--

LOCK TABLES `aircraft` WRITE;
/*!40000 ALTER TABLE `aircraft` DISABLE KEYS */;
/*!40000 ALTER TABLE `aircraft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airline`
--

DROP TABLE IF EXISTS `airline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `airline` (
  `AirlineID` char(2) NOT NULL,
  `CountryHome` varchar(4) NOT NULL,
  `Phone` varchar(45) NOT NULL,
  `Fax` varchar(45) DEFAULT NULL,
  `Website` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`AirlineID`),
  KEY `fk_Airline_Country_idx` (`CountryHome`),
  CONSTRAINT `fk_Airline_Country` FOREIGN KEY (`CountryHome`) REFERENCES `country` (`CountryCode`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airline`
--

LOCK TABLES `airline` WRITE;
/*!40000 ALTER TABLE `airline` DISABLE KEYS */;
/*!40000 ALTER TABLE `airline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargofreighter`
--

DROP TABLE IF EXISTS `cargofreighter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cargofreighter` (
  `CargoFreighterID` int(11) NOT NULL,
  `SubModelCode` varchar(45) NOT NULL,
  `MaxCargoWeight` varchar(45) NOT NULL,
  PRIMARY KEY (`CargoFreighterID`),
  KEY `fk_CargoFreighter_SubModel1_idx` (`SubModelCode`),
  CONSTRAINT `fk_CargoFreighter_SubModel1` FOREIGN KEY (`SubModelCode`) REFERENCES `submodel` (`SubModelCode`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargofreighter`
--

LOCK TABLES `cargofreighter` WRITE;
/*!40000 ALTER TABLE `cargofreighter` DISABLE KEYS */;
/*!40000 ALTER TABLE `cargofreighter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `CountryCode` varchar(4) NOT NULL,
  `CountryName` varchar(45) NOT NULL,
  PRIMARY KEY (`CountryCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `engine`
--

DROP TABLE IF EXISTS `engine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `engine` (
  `EngineModel` varchar(45) NOT NULL,
  `AircraftID` int(11) NOT NULL,
  `EngineModelID` int(11) NOT NULL,
  PRIMARY KEY (`EngineModel`),
  KEY `AircraftID2_idx` (`AircraftID`),
  KEY `EngineModelID1_idx` (`EngineModelID`),
  CONSTRAINT `AircraftID2` FOREIGN KEY (`AircraftID`) REFERENCES `aircraft` (`AircraftID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `EngineModelID1` FOREIGN KEY (`EngineModelID`) REFERENCES `enginemodel` (`EngineModelID`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `EngineModelID` int(11) NOT NULL,
  `SubModelCode` varchar(45) NOT NULL,
  PRIMARY KEY (`EngineModelID`),
  KEY `SubModelID2_idx` (`SubModelCode`),
  CONSTRAINT `SubModelID2` FOREIGN KEY (`SubModelCode`) REFERENCES `submodel` (`SubModelCode`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `EmployeeID` int(11) NOT NULL,
  `TeamName` varchar(45) DEFAULT NULL,
  `DateStart` datetime NOT NULL,
  PRIMARY KEY (`EmployeeID`),
  KEY `TechnicianID1_idx` (`EmployeeID`),
  CONSTRAINT `TechnicianID1` FOREIGN KEY (`EmployeeID`) REFERENCES `technician` (`EmployeeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (1,'Cheese Toasty','0000-00-00 00:00:00');
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
-- Table structure for table `model_has_technician`
--

DROP TABLE IF EXISTS `model_has_technician`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_has_technician` (
  `Model_ModelCode` varchar(4) NOT NULL,
  `EmployeeID` int(11) NOT NULL,
  `QualifiedDate` date DEFAULT NULL,
  PRIMARY KEY (`Model_ModelCode`,`EmployeeID`),
  KEY `fk_Model_has_Technician_Technician1_idx` (`EmployeeID`),
  KEY `fk_Model_has_Technician_Model1_idx` (`Model_ModelCode`),
  CONSTRAINT `fk_Model_has_Technician_Model1` FOREIGN KEY (`Model_ModelCode`) REFERENCES `model` (`ModelCode`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Model_has_Technician_Technician1` FOREIGN KEY (`EmployeeID`) REFERENCES `technician` (`EmployeeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_technician`
--

LOCK TABLES `model_has_technician` WRITE;
/*!40000 ALTER TABLE `model_has_technician` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_technician` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passengerairliner`
--

DROP TABLE IF EXISTS `passengerairliner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passengerairliner` (
  `PassengerAirlinerID` int(11) NOT NULL,
  `SubModelCode` varchar(45) NOT NULL,
  `MaxPassengers` varchar(45) NOT NULL,
  PRIMARY KEY (`PassengerAirlinerID`),
  KEY `fk_PassengerAirliner_SubModel1_idx` (`SubModelCode`),
  CONSTRAINT `fk_PassengerAirliner_SubModel1` FOREIGN KEY (`SubModelCode`) REFERENCES `submodel` (`SubModelCode`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passengerairliner`
--

LOCK TABLES `passengerairliner` WRITE;
/*!40000 ALTER TABLE `passengerairliner` DISABLE KEYS */;
/*!40000 ALTER TABLE `passengerairliner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submodel`
--

DROP TABLE IF EXISTS `submodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submodel` (
  `SubModelCode` varchar(45) NOT NULL,
  `ModelCode` varchar(4) NOT NULL,
  PRIMARY KEY (`SubModelCode`),
  KEY `fk_Sub-Model_Model1_idx` (`ModelCode`),
  CONSTRAINT `fk_Sub-Model_Model1` FOREIGN KEY (`ModelCode`) REFERENCES `model` (`ModelCode`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
-- Table structure for table `submodelattributes`
--

DROP TABLE IF EXISTS `submodelattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submodelattributes` (
  `SubModelCode` varchar(45) NOT NULL,
  `Width` varchar(45) NOT NULL,
  `Length` varchar(45) NOT NULL,
  `Height` varchar(45) NOT NULL,
  `WingSpan` varchar(45) NOT NULL,
  `NetWeight` varchar(45) NOT NULL,
  `MaxSpeed` varchar(45) NOT NULL,
  `MaxRange` varchar(45) NOT NULL,
  `TakeOffDistance` varchar(45) NOT NULL,
  `LandingDistance` varchar(45) NOT NULL,
  PRIMARY KEY (`SubModelCode`),
  CONSTRAINT `SubModelID1` FOREIGN KEY (`SubModelCode`) REFERENCES `submodel` (`SubModelCode`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submodelattributes`
--

LOCK TABLES `submodelattributes` WRITE;
/*!40000 ALTER TABLE `submodelattributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `submodelattributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `technician`
--

DROP TABLE IF EXISTS `technician`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `technician` (
  `EmployeeID` int(11) NOT NULL AUTO_INCREMENT,
  `SupervisorID` int(11) NOT NULL,
  `FirstName` varbinary(250) NOT NULL,
  `LastName` varbinary(250) NOT NULL,
  `Phone` varbinary(250) NOT NULL,
  `Salary` varchar(45) NOT NULL,
  `LoginName` varbinary(250) NOT NULL,
  PRIMARY KEY (`EmployeeID`),
  KEY `TechnicianID2_idx` (`SupervisorID`),
  CONSTRAINT `TechnicianID2` FOREIGN KEY (`SupervisorID`) REFERENCES `technician` (`EmployeeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technician`
--

LOCK TABLES `technician` WRITE;
/*!40000 ALTER TABLE `technician` DISABLE KEYS */;
INSERT INTO `technician` VALUES (1,1,'James','Bond','0455555555','30','JB'),(2,1,'Timmy','Timer','0466666666','35','TT');
/*!40000 ALTER TABLE `technician` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `technicianaddress`
--

DROP TABLE IF EXISTS `technicianaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `technicianaddress` (
  `EmployeeID` int(11) NOT NULL,
  `Street` varchar(45) NOT NULL,
  `Suburb` varchar(45) NOT NULL,
  `Postcode` varchar(45) NOT NULL,
  PRIMARY KEY (`EmployeeID`),
  CONSTRAINT `TechnicianID3` FOREIGN KEY (`EmployeeID`) REFERENCES `technician` (`EmployeeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technicianaddress`
--

LOCK TABLES `technicianaddress` WRITE;
/*!40000 ALTER TABLE `technicianaddress` DISABLE KEYS */;
/*!40000 ALTER TABLE `technicianaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `CASA_No` int(11) NOT NULL,
  PRIMARY KEY (`CASA_No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testevent`
--

DROP TABLE IF EXISTS `testevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testevent` (
  `TestEventNo` int(11) NOT NULL AUTO_INCREMENT,
  `AircraftID` int(11) DEFAULT NULL,
  `CASA_No` int(11) NOT NULL,
  `PreviousTestEventID` int(11) DEFAULT NULL,
  `TestDesc` varchar(45) NOT NULL,
  `StartDateTime` date NOT NULL,
  `EndDateTime` date DEFAULT NULL,
  `HoursSpentOnTesting` int(11) DEFAULT NULL,
  `TestResult` varbinary(250) DEFAULT NULL,
  `ResultComments` varchar(45) DEFAULT NULL,
  `EmployeeID` int(11) NOT NULL,
  PRIMARY KEY (`TestEventNo`),
  KEY `AircraftID1_idx` (`AircraftID`),
  KEY `TestID1_idx` (`CASA_No`),
  KEY `TestEventID1_idx` (`PreviousTestEventID`),
  KEY `TechnicianID4_idx` (`EmployeeID`),
  CONSTRAINT `AircraftID1` FOREIGN KEY (`AircraftID`) REFERENCES `aircraft` (`AircraftID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TestID1` FOREIGN KEY (`CASA_No`) REFERENCES `test` (`CASA_No`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TestEventID1` FOREIGN KEY (`PreviousTestEventID`) REFERENCES `testevent` (`TestEventNo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TechnicianID4` FOREIGN KEY (`EmployeeID`) REFERENCES `technician` (`EmployeeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testevent`
--

LOCK TABLES `testevent` WRITE;
/*!40000 ALTER TABLE `testevent` DISABLE KEYS */;
/*!40000 ALTER TABLE `testevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testevent_has_testitem`
--

DROP TABLE IF EXISTS `testevent_has_testitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testevent_has_testitem` (
  `TestEventNo` int(11) NOT NULL,
  `Code` int(11) NOT NULL,
  PRIMARY KEY (`TestEventNo`,`Code`),
  KEY `TestItemID1_idx` (`Code`),
  KEY `TestEventID2_idx` (`TestEventNo`),
  CONSTRAINT `TestEventID2` FOREIGN KEY (`TestEventNo`) REFERENCES `testevent` (`TestEventNo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TestItemID1` FOREIGN KEY (`Code`) REFERENCES `testitem` (`TestItemCode`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testevent_has_testitem`
--

LOCK TABLES `testevent_has_testitem` WRITE;
/*!40000 ALTER TABLE `testevent_has_testitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `testevent_has_testitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testitem`
--

DROP TABLE IF EXISTS `testitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testitem` (
  `TestItemCode` int(11) NOT NULL,
  `CASA_No` int(11) NOT NULL,
  `ItemDesc` varchar(45) NOT NULL,
  PRIMARY KEY (`TestItemCode`),
  KEY `TestID2_idx` (`CASA_No`),
  CONSTRAINT `TestID2` FOREIGN KEY (`CASA_No`) REFERENCES `test` (`CASA_No`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testitem`
--

LOCK TABLES `testitem` WRITE;
/*!40000 ALTER TABLE `testitem` DISABLE KEYS */;
/*!40000 ALTER TABLE `testitem` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-11 17:04:50
