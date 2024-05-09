-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-05-2024 a las 19:00:44
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `nominasystem`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateUsers` (IN `P_NameUser` VARCHAR(40), IN `P_LastName` VARCHAR(50), IN `P_Users` VARCHAR(80), IN `P_Clave` VARCHAR(255), IN `P_IdRole` INT)   BEGIN
     INSERT INTO Users(NameUser, Lastname, Users, Clave, IdRole)
     VALUES (P_NameUser, P_LastName, P_Users, P_Clave, P_IdRole);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteUsers` (IN `P_IdUser` INT)   BEGIN
	UPDATE Users SET activo = 'inactivo' WHERE IdUsers = P_IdUser;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ListEmployeespPercepciones` ()   BEGIN 
SELECT * FROM listemployeespercepciones;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ListUsers` ()   BEGIN
    SELECT * FROM UsersView;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LoginUsers` (IN `P_Users` VARCHAR(80), IN `P_Clave` VARCHAR(255))   BEGIN
    -- i'm call to the view UserView for when is delete the dates
    
     SELECT * FROM UsersView WHERE Users = P_Users AND Clave = P_Clave AND activo = 'activo';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchUsers` (IN `P_IdUsers` INT)   BEGIN
    SELECT * FROM UsersView WHERE IdUsers = P_IdUsers;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateUsers` (IN `P_IdUser` INT, IN `P_NameUser` VARCHAR(40), IN `P_LastName` VARCHAR(50), IN `P_Users` VARCHAR(80), IN `P_Clave` VARCHAR(255), IN `P_IdRole` INT)   BEGIN
	UPDATE Users SET NameUser = P_NameUser, Lastname = P_LastName, Users = P_Users, Clave = P_Clave, IdROle =
    P_IdRole WHERE IdUsers = P_IdUser;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `activityrecord`
--

CREATE TABLE `activityrecord` (
  `IdActivityRecord` int(11) NOT NULL,
  `Entrance` datetime DEFAULT NULL,
  `Departure` datetime DEFAULT NULL,
  `HoursWorked` int(11) DEFAULT NULL,
  `ExtraHours` int(11) DEFAULT NULL,
  `Absences` int(11) DEFAULT NULL,
  `IdEmployees` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `activityrecord`
--

INSERT INTO `activityrecord` (`IdActivityRecord`, `Entrance`, `Departure`, `HoursWorked`, `ExtraHours`, `Absences`, `IdEmployees`) VALUES
(1, '2024-05-01 10:20:56', '2024-05-01 10:20:56', 8, 0, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `company`
--

CREATE TABLE `company` (
  `IdCompany` int(11) NOT NULL,
  `NameCompany` varchar(255) NOT NULL,
  `Adress` varchar(255) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `State` varchar(100) DEFAULT NULL,
  `Country` varchar(100) DEFAULT NULL,
  `PostalCode` varchar(20) DEFAULT NULL,
  `TEL` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Company_Creation_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `company`
--

INSERT INTO `company` (`IdCompany`, `NameCompany`, `Adress`, `City`, `State`, `Country`, `PostalCode`, `TEL`, `Email`, `Company_Creation_Date`) VALUES
(1, 'Tech Corp', '123 Main St', 'New York', 'NY', 'USA', '10001', '1234567890', 'techcorp@example.com', '2024-05-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contract`
--

CREATE TABLE `contract` (
  `IdContract` int(11) NOT NULL,
  `TypeContract` varchar(100) DEFAULT NULL,
  `ContractTerms` varchar(150) DEFAULT NULL,
  `InitialDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `WorkingTime` varchar(155) DEFAULT NULL,
  `Descriptions` varchar(100) DEFAULT NULL,
  `IdSalary` int(11) DEFAULT NULL,
  `IdPosition` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `contract`
--

INSERT INTO `contract` (`IdContract`, `TypeContract`, `ContractTerms`, `InitialDate`, `WorkingTime`, `Descriptions`, `IdSalary`, `IdPosition`) VALUES
(1, 'Full Time', 'Contrato a tiempo completo', '2024-05-01 14:20:56', '08:00:00', 'Trabaja 8 horas al día', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deductions`
--

CREATE TABLE `deductions` (
  `IdDeductions` int(11) NOT NULL,
  `NameDeductions` varchar(50) DEFAULT NULL,
  `Amount` decimal(10,2) DEFAULT NULL,
  `Descriptions` varchar(100) DEFAULT NULL,
  `IdEmployees` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `deductions`
--

INSERT INTO `deductions` (`IdDeductions`, `NameDeductions`, `Amount`, `Descriptions`, `IdEmployees`) VALUES
(1, 'Tax', 500.00, 'Impuesto', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departament`
--

CREATE TABLE `departament` (
  `IdDepartament` int(11) NOT NULL,
  `NameDepartament` varchar(50) DEFAULT NULL,
  `IdPosition` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `departament`
--

INSERT INTO `departament` (`IdDepartament`, `NameDepartament`, `IdPosition`) VALUES
(1, 'IT', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `discounts`
--

CREATE TABLE `discounts` (
  `IdDiscounts` int(11) NOT NULL,
  `NameDiscounts` varchar(50) DEFAULT NULL,
  `Amount` decimal(10,2) DEFAULT NULL,
  `TypeDiscounts` varchar(25) DEFAULT NULL,
  `ID_Empleado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `discounts`
--

INSERT INTO `discounts` (`IdDiscounts`, `NameDiscounts`, `Amount`, `TypeDiscounts`, `ID_Empleado`) VALUES
(1, 'Tax', 500.00, 'Impuesto', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employees`
--

CREATE TABLE `employees` (
  `IdEmployees` int(11) NOT NULL,
  `RNC` varchar(20) DEFAULT NULL,
  `NameEmployee` varchar(100) DEFAULT NULL,
  `Lastname` varchar(100) DEFAULT NULL,
  `activo` enum('activo','inactivo') DEFAULT 'activo',
  `Gender` varchar(40) DEFAULT NULL,
  `CivilStatus` varchar(10) DEFAULT NULL,
  `Tel` varchar(15) DEFAULT NULL,
  `BirthDate` date DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `Country` varchar(100) DEFAULT NULL,
  `State` varchar(100) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `PostalCode` varchar(40) DEFAULT NULL,
  `Email` varchar(80) DEFAULT NULL,
  `Clave` varchar(255) DEFAULT NULL,
  `IdContract` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `employees`
--

INSERT INTO `employees` (`IdEmployees`, `RNC`, `NameEmployee`, `Lastname`, `activo`, `Gender`, `CivilStatus`, `Tel`, `BirthDate`, `Address`, `Country`, `State`, `City`, `PostalCode`, `Email`, `Clave`, `IdContract`) VALUES
(1, '1010101010', 'John', 'Doe', 'activo', 'Male', 'Single', '1234567890', '1990-01-01', '123 Main St', 'USA', 'NY', 'New York', '10001', 'johndoe@example.com', 'password', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historialpagos`
--

CREATE TABLE `historialpagos` (
  `IdHistoPagos` int(11) NOT NULL,
  `IdPayment` int(11) NOT NULL,
  `IdCompany` int(11) NOT NULL,
  `PaymentDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `historialpagos`
--

INSERT INTO `historialpagos` (`IdHistoPagos`, `IdPayment`, `IdCompany`, `PaymentDate`) VALUES
(1, 1, 1, '2024-05-01');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `listemployeespercepciones`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `listemployeespercepciones` (
`RNC` varchar(20)
,`NameEmployee` varchar(100)
,`Lastname` varchar(100)
,`Tel` varchar(15)
,`Address` varchar(100)
,`Country` varchar(100)
,`State` varchar(100)
,`City` varchar(50)
,`PostalCode` varchar(40)
,`Email` varchar(80)
,`SalaryBase` decimal(10,2)
,`Bonus` decimal(10,2)
,`PayDate` date
,`PayTerms` varchar(100)
,`OverTime` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment`
--

CREATE TABLE `payment` (
  `IdPayment` int(11) NOT NULL,
  `IdEmployees` int(11) NOT NULL,
  `IdCompany` int(11) DEFAULT NULL,
  `monto` decimal(10,2) DEFAULT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `payment`
--

INSERT INTO `payment` (`IdPayment`, `IdEmployees`, `IdCompany`, `monto`, `fecha`) VALUES
(1, 1, 1, 500.00, '2024-05-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payroll`
--

CREATE TABLE `payroll` (
  `IdPayroll` int(11) NOT NULL,
  `Datepayroll` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `TotalPerceptions` decimal(10,2) DEFAULT NULL,
  `TotalDeductions` decimal(10,2) DEFAULT NULL,
  `TotalHoursWorking` decimal(10,2) DEFAULT NULL,
  `IdUsers` int(11) DEFAULT NULL,
  `IdEmployees` int(11) DEFAULT NULL,
  `IdTypePayroll` int(11) DEFAULT NULL,
  `IdContract` int(11) DEFAULT NULL,
  `IdDiscounts` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `payroll`
--

INSERT INTO `payroll` (`IdPayroll`, `Datepayroll`, `TotalPerceptions`, `TotalDeductions`, `TotalHoursWorking`, `IdUsers`, `IdEmployees`, `IdTypePayroll`, `IdContract`, `IdDiscounts`) VALUES
(1, '2024-05-01 14:20:56', 1000.00, 500.00, 80.00, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perceptions`
--

CREATE TABLE `perceptions` (
  `IdPerceptions` int(11) NOT NULL,
  `NamePerceptions` varchar(50) DEFAULT NULL,
  `Amount` decimal(10,2) DEFAULT NULL,
  `Descriptions` varchar(100) DEFAULT NULL,
  `IdEmployees` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `perceptions`
--

INSERT INTO `perceptions` (`IdPerceptions`, `NamePerceptions`, `Amount`, `Descriptions`, `IdEmployees`) VALUES
(1, 'Bonus', 500.00, 'Bono', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `IdPermission` int(11) NOT NULL,
  `NamePermission` varchar(30) DEFAULT NULL,
  `Descriptions` varchar(255) DEFAULT NULL,
  `IdRole` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`IdPermission`, `NamePermission`, `Descriptions`, `IdRole`) VALUES
(1, 'Create/Read/Update/Delete', 'Todos los permisos', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `positions`
--

CREATE TABLE `positions` (
  `IdPosition` int(11) NOT NULL,
  `NamePositions` varchar(50) DEFAULT NULL,
  `Descriptions` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `positions`
--

INSERT INTO `positions` (`IdPosition`, `NamePositions`, `Descriptions`) VALUES
(1, 'Manager', 'Maneja equipos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `IdRole` int(11) NOT NULL,
  `NameRole` varchar(50) DEFAULT NULL,
  `Descriptions` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`IdRole`, `NameRole`, `Descriptions`) VALUES
(1, 'Admin', 'Administrador del sistema');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salary`
--

CREATE TABLE `salary` (
  `IdSalary` int(11) NOT NULL,
  `SalaryBase` decimal(10,2) DEFAULT NULL,
  `Bonus` decimal(10,2) DEFAULT NULL,
  `OverTime` decimal(10,2) DEFAULT NULL,
  `PayDate` date DEFAULT NULL,
  `PayTerms` varchar(100) DEFAULT NULL,
  `IdEmployees` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `salary`
--

INSERT INTO `salary` (`IdSalary`, `SalaryBase`, `Bonus`, `OverTime`, `PayDate`, `PayTerms`, `IdEmployees`) VALUES
(1, 50000.00, 5000.00, 200.00, '2024-05-01', 'Biweekly', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `typepayroll`
--

CREATE TABLE `typepayroll` (
  `IdTypePayroll` int(11) NOT NULL,
  `TypePayroll` varchar(50) DEFAULT NULL,
  `TimePayroll` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `typepayroll`
--

INSERT INTO `typepayroll` (`IdTypePayroll`, `TypePayroll`, `TimePayroll`, `Description`) VALUES
(1, 'Biweekly', '2024-05-01 14:20:56', 'Pago quincenal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `IdUsers` int(11) NOT NULL,
  `NameUser` varchar(50) DEFAULT NULL,
  `Lastname` varchar(50) DEFAULT NULL,
  `Users` varchar(100) DEFAULT NULL,
  `Clave` varchar(255) DEFAULT NULL,
  `activo` enum('activo','inactivo') DEFAULT 'activo',
  `IdRole` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`IdUsers`, `NameUser`, `Lastname`, `Users`, `Clave`, `activo`, `IdRole`) VALUES
(1, 'John', 'Doe', 'johndoe', '$2b$10$Tr9A9U07lgm0oGT4wVFK..5diUo0hGG.blvILJlr/lQtInLkDe0au', 'activo', 1),
(2, 'Pedro', 'Vergaras Solis', 'PedroVS', '$2b$10$kh8kUcBM1ibjtjo2J8c7f.Ea/esakwRLl42muB2vVF7L2DdCsgDyC', 'activo', 1);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `usersview`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `usersview` (
`IdUsers` int(11)
,`NameUser` varchar(50)
,`LastName` varchar(50)
,`Users` varchar(100)
,`Clave` varchar(255)
,`activo` enum('activo','inactivo')
,`IDrole` int(11)
,`NameRole` varchar(50)
,`Descriptions` varchar(255)
,`NamePermission` varchar(30)
,`DP` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `listemployeespercepciones`
--
DROP TABLE IF EXISTS `listemployeespercepciones`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `listemployeespercepciones`  AS SELECT `e`.`RNC` AS `RNC`, `e`.`NameEmployee` AS `NameEmployee`, `e`.`Lastname` AS `Lastname`, `e`.`Tel` AS `Tel`, `e`.`Address` AS `Address`, `e`.`Country` AS `Country`, `e`.`State` AS `State`, `e`.`City` AS `City`, `e`.`PostalCode` AS `PostalCode`, `e`.`Email` AS `Email`, `s`.`SalaryBase` AS `SalaryBase`, `s`.`Bonus` AS `Bonus`, `s`.`PayDate` AS `PayDate`, `s`.`PayTerms` AS `PayTerms`, `s`.`OverTime` AS `OverTime` FROM ((`employees` `e` join `contract` `c` on(`e`.`IdContract` = `c`.`IdContract`)) join `salary` `s` on(`c`.`IdSalary` = `s`.`IdSalary`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `usersview`
--
DROP TABLE IF EXISTS `usersview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `usersview`  AS SELECT `u`.`IdUsers` AS `IdUsers`, `u`.`NameUser` AS `NameUser`, `u`.`Lastname` AS `LastName`, `u`.`Users` AS `Users`, `u`.`Clave` AS `Clave`, `u`.`activo` AS `activo`, `r`.`IdRole` AS `IDrole`, `r`.`NameRole` AS `NameRole`, `r`.`Descriptions` AS `Descriptions`, `p`.`NamePermission` AS `NamePermission`, `p`.`Descriptions` AS `DP` FROM ((`users` `u` join `roles` `r` on(`r`.`IdRole` = `u`.`IdRole`)) join `permissions` `p` on(`p`.`IdRole` = `r`.`IdRole`)) WHERE `u`.`activo` = 'activo' ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `activityrecord`
--
ALTER TABLE `activityrecord`
  ADD PRIMARY KEY (`IdActivityRecord`),
  ADD KEY `IdEmployees` (`IdEmployees`);

--
-- Indices de la tabla `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`IdCompany`);

--
-- Indices de la tabla `contract`
--
ALTER TABLE `contract`
  ADD PRIMARY KEY (`IdContract`),
  ADD KEY `FK_Contract_Salary` (`IdSalary`),
  ADD KEY `FK_Contract_Positions` (`IdPosition`);

--
-- Indices de la tabla `deductions`
--
ALTER TABLE `deductions`
  ADD PRIMARY KEY (`IdDeductions`),
  ADD KEY `FK_Deductions_Employees` (`IdEmployees`);

--
-- Indices de la tabla `departament`
--
ALTER TABLE `departament`
  ADD PRIMARY KEY (`IdDepartament`),
  ADD KEY `FK_Departament_Positions` (`IdPosition`);

--
-- Indices de la tabla `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`IdDiscounts`),
  ADD KEY `FK_Discouns_Employees` (`ID_Empleado`);

--
-- Indices de la tabla `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`IdEmployees`),
  ADD KEY `FK_Employees_Contract` (`IdContract`);

--
-- Indices de la tabla `historialpagos`
--
ALTER TABLE `historialpagos`
  ADD PRIMARY KEY (`IdHistoPagos`),
  ADD KEY `IdPayment` (`IdPayment`),
  ADD KEY `IdCompany` (`IdCompany`);

--
-- Indices de la tabla `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`IdPayment`),
  ADD KEY `IdEmployees` (`IdEmployees`),
  ADD KEY `IdCompany` (`IdCompany`);

--
-- Indices de la tabla `payroll`
--
ALTER TABLE `payroll`
  ADD PRIMARY KEY (`IdPayroll`),
  ADD KEY `FK_Payroll_Users` (`IdUsers`),
  ADD KEY `FK_Payroll_Employees` (`IdEmployees`),
  ADD KEY `FK_Payroll_Contract` (`IdContract`),
  ADD KEY `FK_Payroll_TyperPayroll` (`IdTypePayroll`),
  ADD KEY `FK_Payroll_Discounts` (`IdDiscounts`);

--
-- Indices de la tabla `perceptions`
--
ALTER TABLE `perceptions`
  ADD PRIMARY KEY (`IdPerceptions`),
  ADD KEY `FK_Perceptions_Employees` (`IdEmployees`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`IdPermission`),
  ADD KEY `FK_Permissions_Role` (`IdRole`);

--
-- Indices de la tabla `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`IdPosition`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`IdRole`);

--
-- Indices de la tabla `salary`
--
ALTER TABLE `salary`
  ADD PRIMARY KEY (`IdSalary`);

--
-- Indices de la tabla `typepayroll`
--
ALTER TABLE `typepayroll`
  ADD PRIMARY KEY (`IdTypePayroll`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`IdUsers`),
  ADD KEY `FK_Users_Role` (`IdRole`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `activityrecord`
--
ALTER TABLE `activityrecord`
  MODIFY `IdActivityRecord` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `company`
--
ALTER TABLE `company`
  MODIFY `IdCompany` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `contract`
--
ALTER TABLE `contract`
  MODIFY `IdContract` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `deductions`
--
ALTER TABLE `deductions`
  MODIFY `IdDeductions` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `departament`
--
ALTER TABLE `departament`
  MODIFY `IdDepartament` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `discounts`
--
ALTER TABLE `discounts`
  MODIFY `IdDiscounts` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `employees`
--
ALTER TABLE `employees`
  MODIFY `IdEmployees` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `historialpagos`
--
ALTER TABLE `historialpagos`
  MODIFY `IdHistoPagos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `payment`
--
ALTER TABLE `payment`
  MODIFY `IdPayment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `payroll`
--
ALTER TABLE `payroll`
  MODIFY `IdPayroll` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `perceptions`
--
ALTER TABLE `perceptions`
  MODIFY `IdPerceptions` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `permissions`
--
ALTER TABLE `permissions`
  MODIFY `IdPermission` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `positions`
--
ALTER TABLE `positions`
  MODIFY `IdPosition` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `IdRole` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `salary`
--
ALTER TABLE `salary`
  MODIFY `IdSalary` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `typepayroll`
--
ALTER TABLE `typepayroll`
  MODIFY `IdTypePayroll` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `IdUsers` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `activityrecord`
--
ALTER TABLE `activityrecord`
  ADD CONSTRAINT `activityrecord_ibfk_1` FOREIGN KEY (`IdEmployees`) REFERENCES `employees` (`IdEmployees`);

--
-- Filtros para la tabla `contract`
--
ALTER TABLE `contract`
  ADD CONSTRAINT `FK_Contract_Positions` FOREIGN KEY (`IdPosition`) REFERENCES `positions` (`IdPosition`),
  ADD CONSTRAINT `FK_Contract_Salary` FOREIGN KEY (`IdSalary`) REFERENCES `salary` (`IdSalary`);

--
-- Filtros para la tabla `deductions`
--
ALTER TABLE `deductions`
  ADD CONSTRAINT `FK_Deductions_Employees` FOREIGN KEY (`IdEmployees`) REFERENCES `employees` (`IdEmployees`);

--
-- Filtros para la tabla `departament`
--
ALTER TABLE `departament`
  ADD CONSTRAINT `FK_Departament_Positions` FOREIGN KEY (`IdPosition`) REFERENCES `positions` (`IdPosition`);

--
-- Filtros para la tabla `discounts`
--
ALTER TABLE `discounts`
  ADD CONSTRAINT `FK_Discouns_Employees` FOREIGN KEY (`ID_Empleado`) REFERENCES `employees` (`IdEmployees`);

--
-- Filtros para la tabla `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `FK_Employees_Contract` FOREIGN KEY (`IdContract`) REFERENCES `contract` (`IdContract`);

--
-- Filtros para la tabla `historialpagos`
--
ALTER TABLE `historialpagos`
  ADD CONSTRAINT `historialpagos_ibfk_1` FOREIGN KEY (`IdPayment`) REFERENCES `payment` (`IdPayment`),
  ADD CONSTRAINT `historialpagos_ibfk_2` FOREIGN KEY (`IdCompany`) REFERENCES `company` (`IdCompany`);

--
-- Filtros para la tabla `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`IdEmployees`) REFERENCES `employees` (`IdEmployees`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`IdCompany`) REFERENCES `company` (`IdCompany`);

--
-- Filtros para la tabla `payroll`
--
ALTER TABLE `payroll`
  ADD CONSTRAINT `FK_Payroll_Contract` FOREIGN KEY (`IdContract`) REFERENCES `contract` (`IdContract`),
  ADD CONSTRAINT `FK_Payroll_Discounts` FOREIGN KEY (`IdDiscounts`) REFERENCES `discounts` (`IdDiscounts`),
  ADD CONSTRAINT `FK_Payroll_Employees` FOREIGN KEY (`IdEmployees`) REFERENCES `employees` (`IdEmployees`),
  ADD CONSTRAINT `FK_Payroll_TyperPayroll` FOREIGN KEY (`IdTypePayroll`) REFERENCES `typepayroll` (`IdTypePayroll`),
  ADD CONSTRAINT `FK_Payroll_Users` FOREIGN KEY (`IdUsers`) REFERENCES `users` (`IdUsers`);

--
-- Filtros para la tabla `perceptions`
--
ALTER TABLE `perceptions`
  ADD CONSTRAINT `FK_Perceptions_Employees` FOREIGN KEY (`IdEmployees`) REFERENCES `employees` (`IdEmployees`);

--
-- Filtros para la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD CONSTRAINT `FK_Permissions_Role` FOREIGN KEY (`IdRole`) REFERENCES `roles` (`IdRole`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FK_Users_Role` FOREIGN KEY (`IdRole`) REFERENCES `roles` (`IdRole`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
