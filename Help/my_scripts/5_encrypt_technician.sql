USE southernairportdb;

INSERT INTO Technician(EmployeeId, EmpFirstName, EmpLastName, Salary, LoginName, AddressId) VALUES
(1, AES_ENCRYPT('Alessandro', 'password'), AES_ENCRYPT('Ferro', 'password'), 2000.00, ('aleferro', 'password'), 2);