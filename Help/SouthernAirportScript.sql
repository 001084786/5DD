-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema southernairportdb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema southernairportdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `southernairportdb` DEFAULT CHARACTER SET utf8 ;
USE `southernairportdb` ;

-- -----------------------------------------------------
-- Table `southernairportdb`.`address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `southernairportdb`.`address` ;

CREATE TABLE IF NOT EXISTS `southernairportdb`.`address` (
  `AddressId` INT(11) NOT NULL AUTO_INCREMENT,
  `Street` VARCHAR(45) NOT NULL,
  `Suburb` VARCHAR(45) NULL DEFAULT NULL,
  `Postcode` VARCHAR(45) NOT NULL,
  `State` VARCHAR(45) NULL DEFAULT NULL,
  `City` VARCHAR(45) NOT NULL,
  `Country` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`AddressId`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `southernairportdb`.`country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `southernairportdb`.`country` ;

CREATE TABLE IF NOT EXISTS `southernairportdb`.`country` (
  `CountryCode` VARCHAR(8) NOT NULL,
  `CountryName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CountryCode`),
  UNIQUE INDEX `CountryName_UNIQUE` (`CountryName` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `southernairportdb`.`airline`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `southernairportdb`.`airline` ;

CREATE TABLE IF NOT EXISTS `southernairportdb`.`airline` (
  `IATACode` VARCHAR(2) NOT NULL,
  `CountryCode` VARCHAR(3) NOT NULL,
  `Website` VARCHAR(80) NULL DEFAULT NULL,
  `Phone` VARCHAR(10) NULL DEFAULT NULL,
  `Fax` VARCHAR(10) NULL DEFAULT NULL,
  `AddressId` INT(11) NOT NULL,
  PRIMARY KEY (`IATACode`),
  INDEX `fk_Airline_Country_idx` (`CountryCode` ASC),
  INDEX `fk_Airline_Address1_idx` (`AddressId` ASC),
  CONSTRAINT `fk_Airline_Country`
    FOREIGN KEY (`CountryCode`)
    REFERENCES `southernairportdb`.`country` (`CountryCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Airline_Address1`
    FOREIGN KEY (`AddressId`)
    REFERENCES `southernairportdb`.`address` (`AddressId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `southernairportdb`.`model`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `southernairportdb`.`model` ;

CREATE TABLE IF NOT EXISTS `southernairportdb`.`model` (
  `ModelCode` VARCHAR(4) NOT NULL,
  `Maker` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`ModelCode`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `southernairportdb`.`submodel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `southernairportdb`.`submodel` ;

CREATE TABLE IF NOT EXISTS `southernairportdb`.`submodel` (
  `SubModelCode` VARCHAR(3) NOT NULL,
  `ModelCode` VARCHAR(4) NOT NULL,
  `Width` DOUBLE NOT NULL,
  `Length` DOUBLE NOT NULL,
  `Height` DOUBLE NOT NULL,
  `WingSpanArea` DOUBLE NOT NULL,
  `MaxCruiseSpeed` DOUBLE NOT NULL,
  `MaxRange` DOUBLE NOT NULL,
  `TakeOffDist` DOUBLE NOT NULL,
  `LandingDist` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`SubModelCode`),
  INDEX `fk_SubModel_Model1_idx` (`ModelCode` ASC),
  CONSTRAINT `fk_SubModel_Model1`
    FOREIGN KEY (`ModelCode`)
    REFERENCES `southernairportdb`.`model` (`ModelCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `southernairportdb`.`passengervariant`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `southernairportdb`.`passengervariant` ;

CREATE TABLE IF NOT EXISTS `southernairportdb`.`passengervariant` (
  `MaxNoPassenger` VARCHAR(45) NOT NULL,
  `SubModelCode` VARCHAR(8) NOT NULL,
  `PassengerVariantCode` VARCHAR(1) NOT NULL,
  PRIMARY KEY (`PassengerVariantCode`),
  INDEX `fk_Passenger_SubModel1` (`SubModelCode` ASC),
  CONSTRAINT `fk_Passenger_SubModel1`
    FOREIGN KEY (`SubModelCode`)
    REFERENCES `southernairportdb`.`submodel` (`SubModelCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `southernairportdb`.`cargovariant`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `southernairportdb`.`cargovariant` ;

CREATE TABLE IF NOT EXISTS `southernairportdb`.`cargovariant` (
  `MaxWeight` VARCHAR(45) NOT NULL,
  `SubModelCode` VARCHAR(8) NOT NULL,
  `CargoVariantCode` VARCHAR(1) NOT NULL,
  PRIMARY KEY (`CargoVariantCode`),
  INDEX `fk_Cargo_SubModel1` (`SubModelCode` ASC),
  CONSTRAINT `fk_Cargo_SubModel1`
    FOREIGN KEY (`SubModelCode`)
    REFERENCES `southernairportdb`.`submodel` (`SubModelCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `southernairportdb`.`aircraft`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `southernairportdb`.`aircraft` ;

CREATE TABLE IF NOT EXISTS `southernairportdb`.`aircraft` (
  `AircraftId` INT(11) NOT NULL,
  `IATACode` VARCHAR(2) NOT NULL,
  `ModelCode` VARCHAR(4) NULL DEFAULT NULL,
  `InternationalRegNo` VARCHAR(6) NULL DEFAULT NULL,
  `PassengerVariantCode` VARCHAR(1) NULL DEFAULT NULL,
  `CargoVariantCode` VARCHAR(1) NULL DEFAULT NULL,
  PRIMARY KEY (`AircraftId`),
  INDEX `fk_Aircraft_Airline1_idx` (`IATACode` ASC),
  INDEX `fk_Aircraft_PassengerVariant1_idx` (`PassengerVariantCode` ASC),
  INDEX `fk_Aircraft_CargoVariant1_idx` (`CargoVariantCode` ASC),
  CONSTRAINT `fk_Aircraft_Airline1`
    FOREIGN KEY (`IATACode`)
    REFERENCES `southernairportdb`.`airline` (`IATACode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Aircraft_PassengerVariant1`
    FOREIGN KEY (`PassengerVariantCode`)
    REFERENCES `southernairportdb`.`passengervariant` (`PassengerVariantCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Aircraft_CargoVariant1`
    FOREIGN KEY (`CargoVariantCode`)
    REFERENCES `southernairportdb`.`cargovariant` (`CargoVariantCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `southernairportdb`.`technician`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `southernairportdb`.`technician` ;

CREATE TABLE IF NOT EXISTS `southernairportdb`.`technician` (
  `EmployeeId` INT(11) NOT NULL,
  `SupervisorId` INT(11) NULL DEFAULT NULL,
  `EmpFirstName` VARBINARY(255) NOT NULL,
  `EmpLastName` VARBINARY(255) NOT NULL,
  `Phone` VARCHAR(45) NULL DEFAULT NULL,
  `Salary` VARCHAR(45) NOT NULL,
  `LoginName` VARBINARY(255) NOT NULL,
  `AddressId` INT(11) NOT NULL,
  PRIMARY KEY (`EmployeeId`),
  INDEX `fk_Technician_Technician1_idx` (`SupervisorId` ASC),
  INDEX `fk_Technician_Address1_idx` (`AddressId` ASC),
  INDEX `TechnicianFullNameIndex` (`EmpFirstName` ASC, `EmpLastName` ASC),
  CONSTRAINT `fk_Technician_Technician1`
    FOREIGN KEY (`SupervisorId`)
    REFERENCES `southernairportdb`.`technician` (`EmployeeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Technician_Address1`
    FOREIGN KEY (`AddressId`)
    REFERENCES `southernairportdb`.`address` (`AddressId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `southernairportdb`.`aircrafttechnician`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `southernairportdb`.`aircrafttechnician` ;

CREATE TABLE IF NOT EXISTS `southernairportdb`.`aircrafttechnician` (
  `AircraftId` INT(11) NOT NULL,
  `EmployeeId` INT(11) NOT NULL,
  PRIMARY KEY (`EmployeeId`, `AircraftId`),
  INDEX `fk_AircraftTechnician_Technician1_idx` (`EmployeeId` ASC),
  INDEX `fk_AircraftTechnician_Aircraft1_idx` (`AircraftId` ASC),
  CONSTRAINT `fk_AircraftTechnician_Aircraft1`
    FOREIGN KEY (`AircraftId`)
    REFERENCES `southernairportdb`.`aircraft` (`AircraftId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AircraftTechnician_Technician1`
    FOREIGN KEY (`EmployeeId`)
    REFERENCES `southernairportdb`.`technician` (`EmployeeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `southernairportdb`.`enginemodel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `southernairportdb`.`enginemodel` ;

CREATE TABLE IF NOT EXISTS `southernairportdb`.`enginemodel` (
  `EngineModelCode` VARCHAR(15) NOT NULL,
  `EngineWeight` DOUBLE NOT NULL,
  PRIMARY KEY (`EngineModelCode`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `southernairportdb`.`engine`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `southernairportdb`.`engine` ;

CREATE TABLE IF NOT EXISTS `southernairportdb`.`engine` (
  `EngineID` INT(11) NOT NULL,
  `EngineModelCode` VARCHAR(15) NOT NULL,
  `AircraftID` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`EngineID`),
  INDEX `fk_Engine_EngineModel1_idx` (`EngineModelCode` ASC),
  INDEX `fk_Engine_Aircraft1_idx` (`AircraftID` ASC),
  CONSTRAINT `fk_Engine_EngineModel1`
    FOREIGN KEY (`EngineModelCode`)
    REFERENCES `southernairportdb`.`enginemodel` (`EngineModelCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Engine_Aircraft1`
    FOREIGN KEY (`AircraftID`)
    REFERENCES `southernairportdb`.`aircraft` (`AircraftId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `southernairportdb`.`manager`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `southernairportdb`.`manager` ;

CREATE TABLE IF NOT EXISTS `southernairportdb`.`manager` (
  `ManagerID` INT(11) NOT NULL,
  `StartDate` DATE NOT NULL,
  PRIMARY KEY (`ManagerID`),
  CONSTRAINT `fk_Manager_Technician1`
    FOREIGN KEY (`ManagerID`)
    REFERENCES `southernairportdb`.`technician` (`EmployeeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `southernairportdb`.`modeltechnician`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `southernairportdb`.`modeltechnician` ;

CREATE TABLE IF NOT EXISTS `southernairportdb`.`modeltechnician` (
  `ModelCode` VARCHAR(4) NOT NULL,
  `EmployeeID` INT(11) NOT NULL,
  `QualifiedDate` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`ModelCode`, `EmployeeID`),
  INDEX `fk_ModelTechnician_Technician1_idx` (`EmployeeID` ASC),
  INDEX `fk_ModelTechnician_Model1_idx` (`ModelCode` ASC),
  CONSTRAINT `fk_ModelTechnician_Model1`
    FOREIGN KEY (`ModelCode`)
    REFERENCES `southernairportdb`.`model` (`ModelCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ModelTechnician_Technician1`
    FOREIGN KEY (`EmployeeID`)
    REFERENCES `southernairportdb`.`technician` (`EmployeeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `southernairportdb`.`submodel_has_enginemodel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `southernairportdb`.`submodel_has_enginemodel` ;

CREATE TABLE IF NOT EXISTS `southernairportdb`.`submodel_has_enginemodel` (
  `SubModelCode` VARCHAR(8) NOT NULL,
  `EngineModelCode` VARCHAR(15) NOT NULL,
  `AircraftNetWeight` DOUBLE NOT NULL,
  `TakeOffWeight` DOUBLE NOT NULL,
  PRIMARY KEY (`SubModelCode`, `EngineModelCode`),
  INDEX `fk_SubModel_has_EngineModel_EngineModel1_idx` (`EngineModelCode` ASC),
  INDEX `fk_SubModel_has_EngineModel_SubModel1_idx` (`SubModelCode` ASC),
  CONSTRAINT `fk_SubModel_has_EngineModel_SubModel1`
    FOREIGN KEY (`SubModelCode`)
    REFERENCES `southernairportdb`.`submodel` (`SubModelCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SubModel_has_EngineModel_EngineModel1`
    FOREIGN KEY (`EngineModelCode`)
    REFERENCES `southernairportdb`.`enginemodel` (`EngineModelCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `southernairportdb`.`test`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `southernairportdb`.`test` ;

CREATE TABLE IF NOT EXISTS `southernairportdb`.`test` (
  `CASANo` INT(11) NOT NULL,
  `Description` TEXT NOT NULL,
  PRIMARY KEY (`CASANo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `southernairportdb`.`testevent`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `southernairportdb`.`testevent` ;

CREATE TABLE IF NOT EXISTS `southernairportdb`.`testevent` (
  `TestEventId` INT(11) NOT NULL AUTO_INCREMENT,
  `AircraftId` INT(11) NOT NULL,
  `CASANo` INT(11) NOT NULL,
  `PreviousTestEventId` INT(11) NULL DEFAULT NULL,
  `TestStartTime` DATE NOT NULL,
  `TestEndTime` DATE NOT NULL,
  `TestResult` VARBINARY(255) NOT NULL,
  `Comment` VARBINARY(255) NULL DEFAULT NULL,
  PRIMARY KEY (`TestEventId`),
  INDEX `fk_TestEvent_Aircraft1_idx` (`AircraftId` ASC),
  INDEX `fk_TestEvent_Test1_idx` (`CASANo` ASC),
  INDEX `fk_TestEvent_TestEvent1_idx` (`PreviousTestEventId` ASC),
  CONSTRAINT `fk_TestEvent_Aircraft1`
    FOREIGN KEY (`AircraftId`)
    REFERENCES `southernairportdb`.`aircraft` (`AircraftId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TestEvent_Test1`
    FOREIGN KEY (`CASANo`)
    REFERENCES `southernairportdb`.`test` (`CASANo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TestEvent_TestEvent1`
    FOREIGN KEY (`PreviousTestEventId`)
    REFERENCES `southernairportdb`.`testevent` (`TestEventId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `southernairportdb`.`testitem`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `southernairportdb`.`testitem` ;

CREATE TABLE IF NOT EXISTS `southernairportdb`.`testitem` (
  `ItemCode` INT(11) NOT NULL,
  `CASANo` INT(11) NOT NULL,
  `Description` TEXT NOT NULL,
  PRIMARY KEY (`ItemCode`),
  INDEX `fk_TestItem_Test1_idx` (`CASANo` ASC),
  CONSTRAINT `fk_TestItem_Test1`
    FOREIGN KEY (`CASANo`)
    REFERENCES `southernairportdb`.`test` (`CASANo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `southernairportdb`.`testitem_has_testevent`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `southernairportdb`.`testitem_has_testevent` ;

CREATE TABLE IF NOT EXISTS `southernairportdb`.`testitem_has_testevent` (
  `TestItemId` INT(11) NOT NULL,
  `TestEventId` INT(11) NOT NULL,
  `EmployeeId` INT(11) NOT NULL,
  `SupervisorID` INT(11) NOT NULL,
  `TestItemTestEvent_Result` VARCHAR(45) NOT NULL,
  `TestItemTestEvent_Comment` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`TestItemId`, `TestEventId`),
  INDEX `fk_TestItem_has_TestEvent_TestEvent1_idx` (`TestEventId` ASC),
  INDEX `fk_TestItem_has_TestEvent_TestItem1_idx` (`TestItemId` ASC),
  INDEX `fk_TestItem_has_TestEvent_Technician1_idx` (`EmployeeId` ASC, `SupervisorID` ASC),
  CONSTRAINT `fk_TestItem_has_TestEvent_TestItem1`
    FOREIGN KEY (`TestItemId`)
    REFERENCES `southernairportdb`.`testitem` (`ItemCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TestItem_has_TestEvent_TestEvent1`
    FOREIGN KEY (`TestEventId`)
    REFERENCES `southernairportdb`.`testevent` (`TestEventId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TestItem_has_TestEvent_Technician1`
    FOREIGN KEY (`EmployeeId`)
    REFERENCES `southernairportdb`.`technician` (`EmployeeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
