/* i'm creating the views of the bd */ USE NominaSystem;

CREATE VIEW
    listemployeespercepciones AS listEmployeesPercepciones AS
SELECT
    `e`.`RNC` AS `RNC`,
    `e`.`NameEmployee` AS `NameEmployee`,
    `e`.`Lastname` AS `Lastname`,
    `e`.`Tel` AS `Tel`,
    `e`.`Address` AS `Address`,
    `e`.`Country` AS `Country`,
    `e`.`State` AS `State`,
    `e`.`City` AS `City`,
    `e`.`PostalCode` AS `PostalCode`,
    `e`.`Email` AS `Email`,
    `s`.`SalaryBase` AS `SalaryBase`,
    `s`.`Bonus` AS `Bonus`,
    `s`.`PayDate` AS `PayDate`,
    `s`.`PayTerms` AS `PayTerms`,
    `s`.`OverTime` AS `OverTime`
from
    (
        (
            `nominasystem`.`employees` `e`
            join `nominasystem`.`contract` `c` on (`e`.`IdContract` = `c`.`IdContract`)
        )
        join `nominasystem`.`salary` `s` on (`c`.`IdSalary` = `s`.`IdSalary`)
    );
    -- these are the views of the users table --
CREATE VIEW
    UsersView AS
SELECT
    U.IdUsers,
    U.NameUser,
    U.LastName,
    U.Users,
    U.Clave,
    U.activo,
    R.IdRole AS IDrole,
    R.NameRole,
    R.Descriptions,
    P.NamePermission,
    P.Descriptions AS DP
FROM
    Users AS U
    INNER JOIN Roles AS R ON R.IDrole = U.IdRole
    INNER JOIN Permissions AS P ON P.IdRole = R.IDrole
WHERE
    U.activo = 'activo';

SELECT
    *
FROM
    UsersView;

-- these are the store procedure of the users table --
-- ------------------------------- for List a user ---------------------------------------------
DELIMITER / / CREATE PROCEDURE ListUsers () BEGIN
SELECT
    *
FROM
    UsersView;

END / / DELIMITER;

CALL ListUsers ();

-- -------------------------------- for Search a user --------------------------
DELIMITER / / CREATE PROCEDURE SearchUsers (IN P_IdUsers INT) BEGIN
SELECT
    *
FROM
    UsersView
WHERE
    IdUsers = P_IdUsers;

END / / DELIMITER;

CALL SearchUsers (1);

-- -------------------------------------- for create a user -----------------------------------------------------
DROP PROCEDURE IF EXISTS CreateUsers DELIMITER / / CREATE PROCEDURE CreateUsers (
    IN P_NameUser VARCHAR(40),
    IN P_LastName VARCHAR(50),
    IN P_Users VARCHAR(80),
    IN P_Clave VARCHAR(255),
    IN P_IdRole INT
) BEGIN
INSERT INTO
    Users (NameUser, Lastname, Users, Clave, IdRole)
VALUES
    (
        P_NameUser,
        P_LastName,
        P_Users,
        P_Clave,
        P_IdRole
    );

END / / DELIMITER;

CALL CreateUsers ("juan", "Vergaraz Soliz", 'PedroVS', '123456', 1);

-- ----------------------------------------- for Update a user -------------------------------------------------
DELIMITER / / CREATE PROCEDURE UpdateUsers (
    IN P_IdUser INT,
    IN P_NameUser VARCHAR(40),
    IN P_LastName VARCHAR(50),
    IN P_Users VARCHAR(80),
    IN P_Clave VARCHAR(255),
    IN P_IdRole INT
) BEGIN
UPDATE Users
SET
    NameUser = P_NameUser,
    Lastname = P_LastName,
    Users = P_Users,
    Clave = P_Clave,
    IdROle = P_IdRole
WHERE
    IdUsers = P_IdUser;

END / / DELIMITER;

CALL UpdateUsers (
    2,
    "Pedro",
    "Vergaras Solis",
    'PedroVS',
    '123456',
    1
);

-- ----------------------------------------- for Delete a user -------------------------------------------------
DELIMITER / / CREATE PROCEDURE DeleteUsers (IN P_IdUser INT) BEGIN
UPDATE Users
SET
    activo = 'inactivo'
WHERE
    IdUsers = P_IdUser;

END / / DELIMITER;

CALL DeleteUsers (2);

-- ----------------------------------------- for Login a user -------------------------------------------------
DROP PROCEDURE IF EXISTS LoginUsers;

DELIMITER / / CREATE PROCEDURE LoginUsers (IN P_Users VARCHAR(80), IN P_Clave VARCHAR(255)) BEGIN
-- i'm call to the view UserView for when is delete the dates
SELECT
    *
FROM
    UsersView
WHERE
    Users = P_Users
    AND Clave = P_Clave
    AND activo = 'activo';

END / / DELIMITER;

CALL LoginUsers ("Simon1520Arias", "123456");

-- ----------------------------------------- for the Perceptions of the employees  -------------------------------------------------
DELIMITER / / CREATE PROCEDURE PerceptionsEmployees () BEGIN
SELECT
    E.NameEmployee,
    E.Lastname,
    E.Gender,
    E.CivilStatus,
    E.Tel,
    E.BirthDate,
    E.Address,
    E.Country,
    E.State,
    E.City,
    E.PostalCode,
    C.TypeContract,
    C.ContractTerms,
    C.InitialDate,
    C.WorkingTime,
    C.Descriptions,
    C.IdPosition,
    S.SalaryBase,
    S.Bonus,
    S.PayDate,
    S.PayTerms
FROM
    employees AS E
    INNER JOIN contract AS C ON E.IdContract = C.IdContract
    INNER JOIN salary as S ON c.IdSalary = s.IdSalary;

END / / DELIMITER;

CALL PerceptionsEmployees ();