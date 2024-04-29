USE NominaSystem;

INSERT INTO Company (NameCompany, Adress, City, State, Country, PostalCode, TEL, Email, Company_Creation_Date) VALUES ('Tech Corp', '123 Main St', 'New York', 'NY', 'USA', '10001', '1234567890', 'techcorp@example.com', NOW());

INSERT INTO Roles (NameRole, Descriptions) VALUES ('Admin', 'Administrador del sistema');

INSERT INTO Users (NameUser, Lastname, Users, Clave, activo, IdRole) VALUES ('John', 'Doe', 'johndoe', 'password', 'activo', 1);

INSERT INTO Permissions (NamePermission, Descriptions, IdRole) VALUES ('Create/Read/Update/Delete', 'Todos los permisos', 1);

INSERT INTO Positions (NamePositions, Descriptions) VALUES ('Manager', 'Maneja equipos');

INSERT INTO Departament (NameDepartament, IdPosition) VALUES ('IT', 1);

INSERT INTO Salary (SalaryBase, Bonus, OverTime, PayDate, PayTerms, IdEmployees) VALUES (50000, 5000, 200, NOW(), 'Biweekly', 1);

INSERT INTO Contract (TypeContract, ContractTerms, InitialDate, WorkingTime, Descriptions, IdSalary, IdPosition) VALUES ('Full Time', 'Contrato a tiempo completo', NOW(), '08:00:00', 'Trabaja 8 horas al día', 1, 1);

INSERT INTO Employees (RNC, NameEmployee, Lastname, activo, Gender, CivilStatus, Tel, BirthDate, Address, Country, State, City, PostalCode, Email, Clave, IdContract) VALUES ('1010101010', 'John', 'Doe', 'activo', 'Male', 'Single', '1234567890', '1990-01-01', '123 Main St', 'USA', 'NY', 'New York', '10001', 'johndoe@example.com', 'password', 1);

INSERT INTO Deductions (NameDeductions, Amount, Descriptions, IdEmployees) VALUES ('Tax', 500, 'Impuesto', 1);

INSERT INTO Perceptions (NamePerceptions, Amount, Descriptions, IdEmployees) VALUES ('Bonus', 500, 'Bono', 1);

INSERT INTO TypePayroll (TypePayroll, TimePayroll, Description) VALUES ('Biweekly', NOW(), 'Pago quincenal');

INSERT INTO Discounts (NameDiscounts, Amount, TypeDiscounts, ID_Empleado) VALUES ('Tax', 500, 'Impuesto', 1);

INSERT INTO Payroll (Datepayroll, TotalPerceptions, TotalDeductions, TotalHoursWorking, IdUsers, IdEmployees, IdTypePayroll, IdContract, IdDiscounts) VALUES (NOW(), 1000, 500, 80, 1, 1, 1, 1, 1);

INSERT INTO ActivityRecord (Entrance, Departure, HoursWorked, ExtraHours, Absences, IdEmployees) VALUES (NOW(), NOW(), 8, 0, 0, 1);

INSERT INTO Payment (IdEmployees, IdCompany, monto, fecha) VALUES (1, 1, 500, NOW());

INSERT INTO HistorialPagos (IdPayment, IdCompany, PaymentDate) VALUES (1, 1, NOW());
