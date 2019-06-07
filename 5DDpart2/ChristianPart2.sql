-- ========================== DROP & CREATE TABLES ==========================

-- DROP THE TABLES
DROP TABLE Airplane_table;
DROP TYPE Airplane;

DROP TABLE Airline_table;
DROP TYPE Airline;

DROP TABLE Passenger_table;
DROP TYPE Passenger;

DROP TABLE Cargo_table;
DROP TYPE Cargo;

DROP TABLE SubModel_table;
DROP TYPE Submodel;

DROP TABLE Model_table;
DROP TYPE Model;
/

-- CREATE THE Model TABLE
CREATE TYPE Model AS OBJECT (ModelName VARCHAR2(10), Manufacturer VARCHAR2(20)) NOT FINAL;
/
CREATE TABLE Model_table OF Model;

ALTER TABLE Model_table
  ADD (CONSTRAINT ModelNamePK PRIMARY KEY (ModelName));
/


-- CREATE THE SubModel TABLE
CREATE TYPE SubModel UNDER Model (SubModelName VARCHAR2(10), MaxTakeOffWeight NUMBER(8), CrusingRange NUMBER(8), WingSpan NUMBER(8, 2), Height NUMBER(8, 2)) NOT FINAL;
/
CREATE TABLE SubModel_table OF SubModel;

ALTER TABLE SubModel_table
  ADD (CONSTRAINT SubModelNamePK PRIMARY KEY (SubModelName));
/


/* CREATE THE Passenger TABLE */
CREATE TYPE Passenger UNDER SubModel (MaxNoOfPassenger NUMBER(8)) NOT FINAL;
/
CREATE TABLE Passenger_table OF Passenger;

/* CREATE THE Cargo TABLE */
CREATE TYPE Cargo UNDER SubModel (MaxCargoWeight NUMBER(8)) NOT FINAL;
/
CREATE TABLE Cargo_table OF Cargo;


-- CREATE THE Airline TABLE ===== WITH A METHOD
CREATE TYPE Airline AS OBJECT (AirlineCode VARCHAR2(8), AirlineName VARCHAR2(25));
/
CREATE TABLE Airline_table OF Airline;

-- CREATE THE Airplane TABLE
CREATE TYPE Airplane AS OBJECT (AirlineRef REF Airline, CargoRef REF Cargo, PassengerRef REF Passenger, AirplaneId NUMBER(8), AirplaneName VARCHAR2(25));
/

ALTER TABLE Airline_table
  ADD (CONSTRAINT AirlineCodePK PRIMARY KEY (AirlineCode));



ALTER TYPE Airline
  ADD MEMBER FUNCTION Count_planes RETURN NUMBER
  CASCADE;
/




DROP TYPE Airplane;






CREATE TABLE Airplane_table OF Airplane;

AlTER TABLE Airplane_table
  ADD (CONSTRAINT AirplaneIdPK PRIMARY KEY (AirlineId));
/








-- CREATE THE Airline FUNCTION
CREATE OR REPLACE TYPE BODY Airline AS
MEMBER FUNCTION Count_planes RETURN NUMBER IS
  x NUMBER;
  BEGIN
    SELECT COUNT (AP.AirplaneId) INTO x
    FROM Airplane_table AP
    WHERE DEREF(AP.Airline) = self;
  RETURN x;
END Count_planes;
END;
/

show error;








/*
-- ========================== INSERT DATA ==========================
--Airline
INSERT INTO Airline_table VALUES ('1', 'SA');
INSERT INTO Airline_table VALUES ('2', 'NSW');
INSERT INTO Airline_table VALUES ('3', 'TAZ');

-- Model
INSERT INTO Model_table VALUES ('111', 'Fast Flight');
INSERT INTO Model_table VALUES ('222', 'Air Wave');
INSERT INTO Model_table VALUES ('333', 'Aero Go');

SELECT * FROM Model_table;

--SubModel
INSERT INTO SubModel_table VALUES ('111', 'Fast Flight', 'QTFF', 111, 111, 111.00, 111.00);
INSERT INTO SubModel_table VALUES ('222', 'Air Wave', 'AIRW', 222, 222, 222.00, 222.00);
INSERT INTO SubModel_table VALUES ('333', 'Aero Go', 'AERO', 333, 333, 333.00, 333.00);

SELECT * FROM SubModel_table;

--Cargo
INSERT INTO Cargo_table VALUES ('111', 'Fast Flight', 'QTFF', 111, 111, 111.00, 111.00, 1000);
--INSERT INTO Cargo_table VALUES ('222', 'Air Wave', 'AIRW', 222, 222, 222.00, 222.00, 2000);
--INSERT INTO Cargo_table VALUES ('333', 'Aero Go', 'AERO', 333, 333, 333.00, 333.00, 3000);

--Passenger
--INSERT INTO Passenger_table VALUES ('111', 'Fast Flight', 'QTFF', 111, 111, 111.00, 111.00, 5);
INSERT INTO Passenger_table VALUES ('222', 'Air Wave', 'AIRW', 222, 222, 222.00, 222.00, 55);
INSERT INTO Passenger_table VALUES ('333', 'Aero Go', 'AERO', 333, 333, 333.00, 333.00, 555);

--Airplane
INSERT INTO Airplane_table
SELECT 1, 'Air01', REF(AL), null, REF(CA)
FROM Airline_table AL, Cargo_table CA
WHERE AL.AirlineCode = '1' AND CA.ModelName = 'QTFF';

INSERT INTO Airplane_table
SELECT 1, 'Air02', REF(AL), REF(PA), null
FROM Airline_table AL, Passenger_table PA
WHERE AL.AirlineCode = '1' AND PA.ModelName = 'AIRW';

INSERT INTO Airplane_table
SELECT 1, 'Air03', REF(AL), REF(PA), null
FROM Airline_table AL, Passenger_table PA
WHERE AL.AirlineCode = '3' AND PA.ModelName = 'AERO';


-- COUNT
SELECT AL.AirlineName, AL.Count_planes() AS "No. of Airplanes" FROM Airline_table AL;
/
























