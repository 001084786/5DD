/*
alessandroFAss2
*/

/* ----------------------------------------------------------------------------
SECTION A
----------------------------------------------------------------------------- */

-- MODEL TYPE
CREATE OR REPLACE TYPE model_type AS OBJECT
(
model_name VARCHAR2(10),
manufacturer VARCHAR2(20)
)
NOT FINAL;
/

-- MODEL TABLE
CREATE TABLE model_table OF model_type;
-- MODEL TABLE PK
ALTER TABLE model_table
ADD (CONSTRAINT modelPK PRIMARY KEY (model_name));

-- SUB-MODEL TYPE
CREATE TYPE sub_model_type UNDER model_type
(
sub_model_name VARCHAR2(10),
max_takeoff_weight NUMBER(8),
cruising_range NUMBER(8),
wing_span NUMBER(8, 2),
height NUMBER(8, 2)
)
NOT FINAL;
/

-- SUB-MODEL TABLE
CREATE TABLE sub_model_table OF sub_model_type;
-- SUB-MODEL TABLE PK
ALTER TABLE sub_model_table
ADD (CONSTRAINT sub_modelPK PRIMARY KEY (sub_model_name));

-- PASSENGER TYPE
CREATE TYPE passenger_type UNDER sub_model_type
(
max_no_of_passengers NUMBER(8)
);
/

-- PASSENGER TABLE
CREATE TABLE passenger_table OF passenger_type;
-- PASSENGER TABLE PK
ALTER TABLE passenger_table
ADD (CONSTRAINT passengerPK PRIMARY KEY (max_no_of_passengers));

-- CARGO TYPE
CREATE TYPE cargo_type UNDER sub_model_type
(
max_cargo_weight NUMBER(8)
);
/

-- CARGO TABLE
CREATE TABLE cargo_table OF cargo_type;
-- CARGP TABLE PK
ALTER TABLE cargo_table
ADD (CONSTRAINT cargoPK PRIMARY KEY (max_cargo_weight));


-- AIRLINE TYPE
CREATE OR REPLACE TYPE airline_type AS OBJECT
(
airline_code VARCHAR(8),
airline_name VARCHAR(25)
);
/

-- AIRLINE TABLE
CREATE TABLE airline_table OF airline_type;
-- AIRLINE TABLE PK
ALTER TABLE airline_table
ADD (CONSTRAINT airlinePK PRIMARY KEY (airline_code));


-- AIRPLANE TYPE
CREATE OR REPLACE TYPE airplane_type AS OBJECT
(
airplane_id NUMBER(8),
airplane_name VARCHAR(25),
airline_ref REF airline_type,
passenger_ref REF passenger_type,
cargo_ref REF cargo_type
);
/


-- AIRPLANE TABLE
CREATE TABLE airplane_table OF airplane_type;
-- AIRPLANE TABLE PK
ALTER TABLE airplane_table
ADD (CONSTRAINT airplanePK PRIMARY KEY (airplane_id));

/* -----------------------------------------------------------------------------
SECTION B
----------------------------------------------------------------------------- */

-- CREATE METHOD TO COUNT HOW MANY AIRPLANES ARE OWNED BY A AIRLINE
ALTER TYPE airline_type
ADD MEMBER FUNCTION count_airplanes RETURN NUMBER
CASCADE;
/

CREATE OR REPLACE TYPE BODY airline_type AS
MEMBER FUNCTION count_airplanes RETURN NUMBER IS
  X Number;
  BEGIN
    SELECT COUNT(AP.airplane_id) INTO X
    FROM airplane_table AP
    WHERE DEREF(AP.airline_ref) = self;
  RETURN X;
END count_airplanes;
END;
/

-- INSERT INTO MODEL.
INSERT INTO model_table VALUES('747', 'Boeing');
INSERT INTO model_table VALUES('A380', 'Airbus');
INSERT INTO model_table VALUES('An225', 'Antonov');
-- TEST INSERTION
SELECT * FROM model_table;

-- INSERT INTO SUB-MODEL
INSERT INTO sub_model_table VALUES('747', 'Boeing', '400', 412796, 13450,64.00, 18.41);
INSERT INTO sub_model_table VALUES('A380', 'Airbus', '842', 560000, 25000,80.00, 24.00);
INSERT INTO sub_model_table VALUES('An225', 'Antonov', 'Mirya', 640000, 15400,80.00, 18.10);
-- TEST INSERTION
SELECT * FROM sub_model_table;

-- INSERT INTO PASSENGER
INSERT INTO passenger_table VALUES ('747', 'Boeing', '400', 412796, 13450,64.00, 18.41, 416);
INSERT INTO passenger_table VALUES ('A380', 'Airbus', '842', 560000, 25000,80.00, 24.00, 868);
INSERT INTO passenger_table VALUES ('ARJ21', 'Comac', '700', 43500, 3700,27.28, 8.44, 90);
-- TEST INSERTION
SELECT * FROM passenger_table;

-- INSERT INTO CARGO
INSERT INTO cargo_table VALUES ('An225', 'Antonov', 'Mirya', 640000, 15400,80.00, 18.10, 250000);
INSERT INTO cargo_table VALUES ('A330', 'Airbus', '743L', 227000, 4270,60.30, 18.00, 50500);
INSERT INTO cargo_table VALUES ('747', 'Boeing', '400LCF', 364235, 7800,64.40, 21.54, 113400);
-- TEST INSERTION
SELECT * FROM cargo_table;


-- INSERT INTO AIRLINE
INSERT INTO airline_table VALUES ('QFA', 'Qantas');
INSERT INTO airline_table VALUES ('RYA', 'Ryan Air');
INSERT INTO airline_table VALUES ('SIA', 'Singapore Airlines');
-- TEST INSERTION
SELECT * FROM airline_table;

INSERT INTO airplane_table
SELECT
010, 'Airplane010', REF(AL), REF(PA), null
FROM airline_table AL, passenger_table PA
WHERE  AL.airline_code = 'QFA' AND PA.model_name = '747';

INSERT INTO airplane_table
SELECT
020, 'Airplane020', REF(AL), null, REF(CA)
FROM airline_table AL, cargo_table CA
WHERE  AL.airline_code = 'SIA' AND CA.model_name = 'An225';

INSERT INTO airplane_table
SELECT
030, 'Airplane030', REF(AL), REF(PA), null
FROM airline_table AL, passenger_table PA
WHERE  AL.airline_code = 'SIA' AND PA.model_name = 'A380';
-- TEST INSERTION
SELECT * FROM airplane_table;

-- TEST METHOD TO COUNT THE NUMBER OF AIRPLANES OWNED BY AN AIRLINE
SELECT AL.airline_name, AL.count_airplanes() AS "Number of Aircrafts" FROM airline_table AL;






