DROP DATABASE IF EXISTS NominaSystem;
CREATE DATABASE NominaSystem;
USE NominaSystem;

CREATE TABLE Company (
    IdCompany INT PRIMARY KEY AUTO_INCREMENT,
    NameCompany VARCHAR(255) NOT NULL,
    Adress VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(100),
    Country VARCHAR(100),
    PostalCode VARCHAR(20),
    TEL VARCHAR(20),
    Email VARCHAR(100),
    Company_Creation_Date DATE
);

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

CREATE TABLE Permissions (
  IdPermission INT AUTO_INCREMENT PRIMARY KEY,
  NamePermission VARCHAR(30),
  Descriptions VARCHAR(255),
  IdRole INT
);

CREATE TABLE Positions (
  IdPosition INT AUTO_INCREMENT PRIMARY KEY,
  NamePositions VARCHAR(50),
  Descriptions VARCHAR(255)
);

CREATE TABLE Departament (
  IdDepartament INT AUTO_INCREMENT PRIMARY KEY,
  NameDepartament VARCHAR(50),
  IdPosition INT
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
  ContractTerms VARCHAR(150),
  InitialDate TIMESTAMP,
  WorkingTime VARCHAR(155),
  Descriptions VARCHAR(100),
  IdSalary INT,
  IdPosition INT
);

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
  IdContract INT
);

CREATE TABLE Deductions (
  IdDeductions INT AUTO_INCREMENT PRIMARY KEY,
  NameDeductions VARCHAR(50),
  Amount DECIMAL(10, 2),
  Descriptions VARCHAR(100),
  IdEmployees INT
);

CREATE TABLE Perceptions (
  IdPerceptions INT AUTO_INCREMENT PRIMARY KEY,
  NamePerceptions VARCHAR(50),
  Amount DECIMAL(10, 2),
  Descriptions VARCHAR(100),
  IdEmployees INT
);

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

CREATE TABLE Payroll (
  IdPayroll INT AUTO_INCREMENT PRIMARY KEY,
  Datepayroll TIMESTAMP,
  TotalPerceptions DECIMAL(10, 2),
  TotalDeductions DECIMAL(10, 2),
  TotalHoursWorking Decimal(10,2),
  IdUsers INT,
  IdEmployees INT,
  IdTypePayroll INT,
  IdContract INT, 
  IdDiscounts INT
);

CREATE TABLE ActivityRecord (
  IdActivityRecord INT AUTO_INCREMENT PRIMARY KEY,
  Entrance DATETIME,
  Departure DATETIME,
  HoursWorked INT,
  ExtraHours INT,
  Absences INT,
  IdEmployees INT
);

CREATE TABLE Payment (
    IdPayment INT PRIMARY KEY AUTO_INCREMENT,  -- Corregido aquí
    IdEmployees INT NOT NULL,
    IdCompany INT,
    monto DECIMAL(10, 2),
    fecha DATE,
    FOREIGN KEY (IdEmployees) REFERENCES Employees(IdEmployees),
    FOREIGN KEY (IdCompany) REFERENCES Company(IdCompany)
);

CREATE TABLE HistorialPagos (
    IdHistoPagos INT PRIMARY KEY AUTO_INCREMENT,
    IdPayment INT NOT NULL,
    IdCompany INT NOT NULL,
    PaymentDate DATE NOT NULL,
    FOREIGN KEY (IdPayment) REFERENCES Payment(IdPayment),  -- Corregido aquí
    FOREIGN KEY (IdCompany) REFERENCES Company(IdCompany)
);

