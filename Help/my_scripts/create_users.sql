USE southernairportdb;

CREATE USER 'Joe'@'localhost' IDENTIFIED BY 'Brown';
GRANT ALL PRIVILEGES ON southernairportdb.* TO 'Joe'@'localhost';

CREATE USER 'Jill'@'localhost' IDENTIFIED BY 'White';
GRANT SELECT, UPDATE ON southernairportdb.* TO 'Jill'@'localhost';