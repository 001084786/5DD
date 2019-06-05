USE southernairportdb;

INSERT INTO Country(CountryCode, CountryName) VALUES
('ITA', 'Italy');

INSERT INTO Address(AddressId, Street, Postcode, City, Country) VALUES
(1,'Piazza Almerico Da Schio', '00054', 'Fiumicino', 'Italy');

INSERT INTO Airline(IATACode, CountryCode, AddressId) VALUES
('AZ', 'ITA', 1);

INSERT INTO Aircraft(AircraftId, IATACode, ModelCode) VALUES
(001, 'AZ', 'B177');

INSERT INTO Aircraft(AircraftId, IATACode, ModelCode) VALUES
(002, 'AZ', 'G122');