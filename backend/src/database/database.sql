DROP DATABASE IF EXISTS NominaSystem;
CREATE DATABASE NominaSystem;
use NominaSystem;

CREATE TABLE Roles (
  IdRole INT AUTO_INCREMENT PRIMARY KEY,
  NameRole VARCHAR(50),
  Descriptions VARCHAR(255)
);

CREATE TABLE Users (
  IdUsers INT AUTO_INCREMENT PRIMARY KEY,
  NameUser VARCHAR(50),
  Lastname VARCHAR(50),
  Users VARCHAR(100),
  Clave VARCHAR(255),
  activo ENUM('activo','inactivo') DEFAULT 'activo',
  IdRole INT
);

ALTER TABLE Users
ADD FOREIGN KEY (IdRole) REFERENCES Roles(IdRole);

CREATE TABLE Permissions (
  IdPermission INT AUTO_INCREMENT PRIMARY KEY,
  NamePermission VARCHAR(30),
  Descriptions VARCHAR(255),
  IdRole INT
);

ALTER TABLE Permissions
ADD FOREIGN KEY (IdRole) REFERENCES Roles(IdRole);

CREATE TABLE Positions (
  IdPosition INT AUTO_INCREMENT PRIMARY KEY,
  NamePositions VARCHAR(50),
  Descriptions VARCHAR(255)
);

CREATE TABLE Salary (
  IdSalary INT AUTO_INCREMENT PRIMARY KEY,
  SalaryBase DECIMAL(10, 2),
  Bonus DECIMAL(10, 2),
  OverTime DECIMAL(10, 2),
  PayDate DATE,
  PayTerms VARCHAR(100),
  IdEmployees INT
);

CREATE TABLE Contract (
  IdContract INT AUTO_INCREMENT PRIMARY KEY,
  TypeContract VARCHAR(100),
  IdSalary INT,
  InitialDate TIMESTAMP,
  ContractTerms VARCHAR(150),
  WorkingTime VARCHAR(155),
  Descriptions VARCHAR(100)
);

ALTER TABLE Contract
ADD FOREIGN KEY (IdSalary) REFERENCES Salary(IdSalary);

CREATE TABLE Employees (
  IdEmployees INT AUTO_INCREMENT PRIMARY KEY,
  RNC VARCHAR(20),
  NameEmployee VARCHAR(100),
  Lastname VARCHAR(100),
  activo ENUM('activo','inactivo') DEFAULT 'activo',
  Gender VARCHAR(40),
  CivilStatus VARCHAR(10),
  Tel VARCHAR(15),
  BirthDate DATE,
  Address VARCHAR(100),
  Country VARCHAR(100),
  State VARCHAR(100),
  City VARCHAR(50),
  PostalCode VARCHAR(40),
  Email VARCHAR(80),
  Clave VARCHAR(255),
  IdContract INT,
  IdPosition INT
);

ALTER TABLE Employees
ADD FOREIGN KEY (IdContract) REFERENCES Contract(IdContract),
ADD FOREIGN KEY (IdPosition) REFERENCES Positions(IdPosition);

ALTER TABLE Salary
ADD FOREIGN KEY (IdEmployees) REFERENCES Employees(IdEmployees);

CREATE TABLE Departament (
  IdDepartament INT AUTO_INCREMENT PRIMARY KEY,
  NameDepartament VARCHAR(50),
  IdPosition INT
);

ALTER TABLE Departament
ADD FOREIGN KEY (IdPosition) REFERENCES Positions(IdPosition);

CREATE TABLE Deductions (
  IdDeductions INT AUTO_INCREMENT PRIMARY KEY,
  NameDeductions VARCHAR(50),
  Amount DECIMAL(10, 2),
  Descriptions VARCHAR(100),
  ID_Empleado INT
);

ALTER TABLE Deductions
ADD FOREIGN KEY (ID_Empleado) REFERENCES Employees(IdEmployees);

CREATE TABLE Perceptions (
  IdPerceptions INT AUTO_INCREMENT PRIMARY KEY,
  NamePerceptions VARCHAR(50),
  Amount DECIMAL(10, 2),
  Descriptions VARCHAR(100),
  ID_Empleado INT
);

ALTER TABLE Perceptions
ADD FOREIGN KEY (ID_Empleado) REFERENCES Employees(IdEmployees);

CREATE TABLE TypePayroll (
  IdTypePayroll INT AUTO_INCREMENT PRIMARY KEY,
  TypePayroll VARCHAR(50),
  TimePayroll TIMESTAMP,
  Description VARCHAR(255)
);

CREATE TABLE Discounts (
  IdDiscounts INT AUTO_INCREMENT PRIMARY KEY,
  NameDiscounts VARCHAR(50),
  Amount DECIMAL(10, 2),
  TypeDiscounts VARCHAR(25),
  ID_Empleado INT
);

ALTER TABLE Discounts
ADD FOREIGN KEY (ID_Empleado) REFERENCES Employees(IdEmployees);

CREATE TABLE Payroll (
  IdPayroll INT AUTO_INCREMENT PRIMARY KEY,
  Datepayroll TIMESTAMP,
  TotalPerceptions DECIMAL(10, 2),
  TotalDeductions DECIMAL(10, 2),
  TotalHoursWorking Decimal(10,2),
  /*CAMPOS DE RELACIONES*/
  IdUsers INT,
  IdEmployees INT,
  IdTypePayroll INT,
  IdContract INT, 
  IdDiscounts INT
);

ALTER TABLE Payroll
ADD FOREIGN KEY (IdUsers) REFERENCES Users(IdUsers),
ADD FOREIGN KEY (IdEmployees) REFERENCES Employees(IdEmployees),
ADD FOREIGN KEY (IdContract) REFERENCES Contract(IdContract),
ADD FOREIGN KEY (IdTypePayroll) REFERENCES TypePayroll(IdTypePayroll),
ADD FOREIGN KEY (IdDiscounts) REFERENCES Discounts(IdDiscounts);

CREATE TABLE ActivityRecord (
  IdActivityRecord INT AUTO_INCREMENT PRIMARY KEY,
  Entrance DATETIME,
  Departure DATETIME,
  HoursWorked DATETIME,
  ExtraHours DATETIME,
  Absences INT,
  IdEmployees INT
);

ALTER TABLE ActivityRecord
ADD FOREIGN KEY (IdEmployees) REFERENCES Employees(IdEmployees);



use NominaSystem;

INSERT INTO Roles (NameRole, Descriptions) VALUES ('Admin', 'Administrador del sistema');
INSERT INTO Roles (NameRole, Descriptions) VALUES ('Editor', 'Usuario con permisos de edicion');
INSERT INTO Roles (NameRole, Descriptions) VALUES ('Viewer', 'Usuario con permisos de lectura');

INSERT INTO Users (NameUser, Lastname, Users, Clave, activo, IdRole) VALUES ('John', 'Doe', 'johndoe', 'password', 'activo', 1);
INSERT INTO Users (NameUser, Lastname, Users, Clave, activo, IdRole) VALUES ('Jane', 'Doe', 'janedoe', 'password', 'activo', 2);

INSERT INTO Permissions (NamePermission, Descriptions, ID_Rol) VALUES ('Create/Read/Update/Delete', 'Todos los permisos', 1);
INSERT INTO Permissions (NamePermission, Descriptions, ID_Rol) VALUES ('Read/Update/Delete', 'Permiso de Edicion', 2);
INSERT INTO Permissions (NamePermission, Descriptions, ID_Rol) VALUES ('Read', 'Permiso de lectura', 3);

INSERT INTO Positions (NamePositions, Descriptions) VALUES ('Manager', 'Maneja equipos');
INSERT INTO Positions (NamePositions, Descriptions) VALUES ('Developer', 'Desarrolla software');

INSERT INTO Salary (SalaryBase, Bonus, OverTime, PayDate, PayTerms) VALUES (50000, 5000, 200, NOW(), 'Biweekly');
INSERT INTO Salary (SalaryBase, Bonus, OverTime, PayDate, PayTerms) VALUES (60000, 6000, 300, NOW(), 'Biweekly');

INSERT INTO Contract (TypeContract, IdSalary, InitialDate, ContractTerms, WorkingTime, Descriptions) VALUES ('Full Time', 1, NOW(), 'Contrato a tiempo completo', '08:00:00', 'Trabaja 8 horas al día');
INSERT INTO Contract (TypeContract, IdSalary, InitialDate, ContractTerms, WorkingTime, Descriptions) VALUES ('Part Time', 2, NOW(), 'Contrato a tiempo parcial', '04:00:00', 'Trabaja 4 horas al día');

INSERT INTO Employees (RNC, NameEmployee, Lastname, activo, Gender, CivilStatus, Tel, BirthDate, Address, Country, State, City, PostalCode, Email, Clave, IdContract, IdPosition) VALUES ('1010101010', 'John', 'Doe', 'activo', 'Male', 'Single', '1234567890', '1990-01-01', '123 Main St', 'USA', 'NY', 'New York', '10001', 'johndoe@example.com', 'password', 1, 1);
INSERT INTO Employees (RNC, NameEmployee, Lastname, activo, Gender, CivilStatus, Tel, BirthDate, Address, Country, State, City, PostalCode, Email, Clave, IdContract, IdPosition) VALUES ('2020202020', 'Jane', 'Doe', 'activo', 'Female', 'Married', '0987654321', '1992-02-02', '456 Elm St', 'USA', 'NY', 'New York', '10002', 'janedoe@example.com', 'password', 2, 2);

INSERT INTO Departament (NameDepartament, IdPosition) VALUES ('IT', 1);
INSERT INTO Departament (NameDepartament, IdPosition) VALUES ('HR', 2);

INSERT INTO Deductions (NameDeductions, Amount, Descriptions, ID_Empleado) VALUES ('Tax', 500, 'Impuesto', 1);
INSERT INTO Deductions (NameDeductions, Amount, Descriptions, ID_Empleado) VALUES ('Insurance', 200, 'Seguro', 2);

INSERT INTO Perceptions (NamePerceptions, Amount, Descriptions, ID_Empleado) VALUES ('Bonus', 500, 'Bono', 1);
INSERT INTO Perceptions (NamePerceptions, Amount, Descriptions, ID_Empleado) VALUES ('Overtime', 200, 'Horas extras', 2);

INSERT INTO TypePayroll (TypePayroll, TimePayroll, Description) VALUES ('Biweekly', NOW(), 'Pago quincenal');
INSERT INTO TypePayroll (TypePayroll, TimePayroll, Description) VALUES ('Monthly', NOW(), 'Pago mensual');

INSERT INTO Discounts (NameDiscounts, Amount, TypeDiscounts, ID_Empleado) VALUES ('Tax', 500, 'Impuesto', 1);
INSERT INTO Discounts (NameDiscounts, Amount, TypeDiscounts, ID_Empleado) VALUES ('Insurance', 200, 'Seguro', 2);

INSERT INTO Payroll (Datepayroll, TotalPerceptions, TotalDeductions, TotalHoursWorking, IdUsers, IdEmployees, IdTypePayroll, IdContract, IdDiscounts) VALUES (NOW(), 1000, 500, 80, 1, 1, 1, 1, 1);
INSERT INTO Payroll (Datepayroll, TotalPerceptions, TotalDeductions, TotalHoursWorking, IdUsers, IdEmployees, IdTypePayroll, IdContract, IdDiscounts) VALUES (NOW(), 1200, 600, 40, 2, 2, 2, 2, 2);

INSERT INTO ActivityRecord (Entrance, Departure, HoursWorked, ExtraHours, Absences, IdEmployees) VALUES (NOW(), NOW(), '08:00:00', '00:00:00', 0, 1);
INSERT INTO ActivityRecord (Entrance, Departure, HoursWorked, ExtraHours, Absences, IdEmployees) VALUES (NOW(), NOW(), '04:00:00', '00:00:00', 0, 2);

/* 

/// creating store procedure ///

DELIMITER //
CREATE PROCEDURE RecordEmployeeUpdate(IN empID INT, IN updatedData VARCHAR(255))
BEGIN
  INSERT INTO EmployeeAudit (EmployeeID, UpdateTimestamp, UpdatedData)
  VALUES (empID, NOW(), updatedData);
END //
DELIMITER ;

/// creating a trigger ///

DELIMITER //
CREATE TRIGGER AfterEmployeeUpdate
AFTER UPDATE ON Employees
FOR EACH ROW
BEGIN
  CALL RecordEmployeeUpdate(NEW.IdEmployees, NEW.Name);
END; //
DELIMITER ;


*/


