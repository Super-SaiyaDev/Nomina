use NominaSystem;

ALTER TABLE Users
ADD CONSTRAINT FK_Users_Role FOREIGN KEY (IdRole) REFERENCES Roles(IdRole);

ALTER TABLE Permissions
ADD CONSTRAINT FK_Permissions_Role FOREIGN KEY (IdRole) REFERENCES Roles(IdRole);

ALTER TABLE Departament
ADD CONSTRAINT FK_Departament_Positions FOREIGN KEY (IdPosition) REFERENCES Positions(IdPosition);

ALTER TABLE Contract
ADD CONSTRAINT FK_Contract_Salary FOREIGN KEY (IdSalary) REFERENCES Salary(IdSalary),
ADD CONSTRAINT FK_Contract_Positions FOREIGN KEY (IdPosition) REFERENCES Positions(IdPosition);

ALTER TABLE Employees
ADD CONSTRAINT FK_Employees_Contract FOREIGN KEY (IdContract) REFERENCES Contract(IdContract);

ALTER TABLE Deductions
ADD CONSTRAINT FK_Deductions_Employees FOREIGN KEY (IdEmployees) REFERENCES Employees(IdEmployees);

ALTER TABLE Perceptions
ADD CONSTRAINT FK_Perceptions_Employees FOREIGN KEY (IdEmployees) REFERENCES Employees(IdEmployees);

ALTER TABLE Discounts
ADD CONSTRAINT FK_Discouns_Employees FOREIGN KEY (ID_Empleado) REFERENCES Employees(IdEmployees);

ALTER TABLE Payroll
ADD CONSTRAINT FK_Payroll_Users FOREIGN KEY (IdUsers) REFERENCES Users(IdUsers),
ADD CONSTRAINT FK_Payroll_Employees FOREIGN KEY (IdEmployees) REFERENCES Employees(IdEmployees),
ADD CONSTRAINT FK_Payroll_Contract FOREIGN KEY (IdContract) REFERENCES Contract(IdContract),
ADD CONSTRAINT FK_Payroll_TyperPayroll FOREIGN KEY (IdTypePayroll) REFERENCES TypePayroll(IdTypePayroll),
ADD CONSTRAINT FK_Payroll_Discounts FOREIGN KEY (IdDiscounts) REFERENCES Discounts(IdDiscounts);

ALTER TABLE ActivityRecord
ADD FOREIGN KEY (IdEmployees) REFERENCES Employees(IdEmployees);