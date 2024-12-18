CREATE database bankSysDb;
drop database bankSysDb
select * from Employee
use bankSysDb
-- 1. Employee Table
CREATE TABLE Employee (
    Emp_ID INT PRIMARY KEY,
    Super_ID INT NOT NULL,
    Salary MONEY DEFAULT 0,
    Position VARCHAR(15),
    F_Name VARCHAR(10),
    L_Name VARCHAR(10),
    Gender CHAR(1),
    Birth_Date DATE,
    EmpAddress VARCHAR(20)
);

-- 2. Department Table
CREATE TABLE Department (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(20),
    Dept_Location VARCHAR(20),
    Manager_ID INT NOT NULL,
);

-- 3. Emp_Working_Department Table
CREATE TABLE Emp_Working_Department (
    Emp_ID INT NOT NULL,
    Dept_ID INT NOT NULL,
    StartDate DATE,
);

-- 4. Equipment Table
CREATE TABLE Equipment (
    Equip_ID INT PRIMARY KEY,
    Dept_ID INT NOT NULL,
    Equip_Name VARCHAR(15),
    Equip_Type VARCHAR(15),
    Starting_Use DATE,
);

-- 5. Bank Treasury Table
CREATE TABLE Bank_Treasury (
    Treasury_ID INT PRIMARY KEY,
    Balance MONEY DEFAULT 0
);

-- 6. Loan Table
CREATE TABLE Loan (
    Loan_ID INT PRIMARY KEY ,
    Duration VARCHAR(10),
    StartDate DATE,
    End_Date DATE,
    Amount MONEY DEFAULT 0,
    Management_Fees MONEY,
    Treasury_ID INT NOT NULL,
);

-- 7. Customer Table
CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    F_Name VARCHAR(10),
    L_Name VARCHAR(10),
    Birth_Date DATE,
    Gender CHAR(1)
);

-- 8. Installment Table
CREATE TABLE Installment (
    Loan_ID INT NOT NULL,
    Customer_ID INT NOT NULL,
    Payment_Date DATETIME DEFAULT GETDATE() NOT NULL,
    Payment_Amount MONEY DEFAULT 0,
);

-- 9. Customer Phone Table
CREATE TABLE Customer_Phone (
    Customer_ID INT NOT NULL,
    Phone_Number VARCHAR(15) PRIMARY KEY,
);

-- 10. Account Table
CREATE TABLE Account (
    Account_ID INT PRIMARY KEY,
    Account_Type VARCHAR(10),
    Balance MONEY DEFAULT 0,
    Customer_ID INT NOT NULL,
    Account_Password VARCHAR(30),
);

-- 11. Withdraw and Deposit Table
CREATE TABLE Withdraw_And_Deposit (
    Transaction_ID INT PRIMARY KEY,
    Amount MONEY,
    Transaction_Date DATETIME,
    Treasury_ID INT NOT NULL,
    WD_Type VARCHAR(10),
    Account_ID INT NOT NULL,
    Action_By INT DEFAULT 0,
);

-- 12. Car Table
CREATE TABLE Car (
    Car_ID INT PRIMARY KEY,
    Owner_ID INT NOT NULL,
    Owner_Type VARCHAR(10)
);

-- 13. Parking Table
CREATE TABLE Parking (
    Area_ID INT PRIMARY KEY
);

-- 14. Parking Time Table
CREATE TABLE Parking_Time (
    Car_ID INT NOT NULL,
    Area_ID INT NOT NULL,
    Time_In DATETIME,
    Time_Out DATETIME,
);

-- 15. Dependent Table
CREATE TABLE Dependents (
    Emp_ID INT NOT NULL,
    Dep_Name VARCHAR(25),
    Relation VARCHAR(25),
    Birth_Date DATE,
);

-- 16. Employee Phone Table
CREATE TABLE Employee_Phone (
    Emp_ID INT NOT NULL,
    Phone_Number VARCHAR(15) PRIMARY KEY,
);

-- 17. Zip Codes Table
CREATE TABLE Zip_Codes (
    Zip_Code INT PRIMARY KEY,
    City VARCHAR(15)
);

-- 18. Customer Address Table
CREATE TABLE Customer_Address (
    Customer_ID INT NOT NULL,
    Zip_Code INT NOT NULL,
    Street VARCHAR(10),
    Building_Number INT,
);

-- 19. ATM Table
CREATE TABLE ATM (
    ATM_ID INT PRIMARY KEY,
    ATM_Location VARCHAR(20),
    Balance MONEY DEFAULT 0
);
Create TABLE Agency_Service_Department (
Dept_ID int,
Agency_ID int,
Service_Date datetime,
Service_SName varchar(20),
Service_ID int PRIMARY KEY,
Treasurey_ID int
);

-- 20. Refill ATM Table
CREATE TABLE Refill_ATM (
    ATM_ID INT NOT NULL,
    Outsource_ID INT NOT NULL,
    Amount MONEY DEFAULT 0,
    Refill_Date DATETIME,
);

-- 21. Outsource Agency Table
CREATE TABLE Outsource_Agency (
    Agency_ID INT PRIMARY KEY,
    Agency_Name VARCHAR(20)
);

-- 22. Take Loan Table
create TABLE Take_Loan (
    Loan_ID INT NOT NULL ,
    Customer_ID INT NOT NULL,
    Taking_Loan DATETIME,
);

-- 23. Money Transaction Table
CREATE TABLE Money_Transaction (
    Transaction_ID INT PRIMARY KEY,
    To_Account_ID INT NOT NULL,
    From_Account_ID INT NOT NULL,
    Transaction_DateTime DATETIME,
    Transaction_Amount MONEY,
    Transaction_By INT DEFAULT 0
);
--/////////////////////////VIEW///////////////////////////
-- View: Employee and Department Details
CREATE VIEW EmployeeDepartment AS
SELECT 
    e.Emp_ID AS EmployeeID,
    e.F_Name AS FirstName,
    e.L_Name AS LastName,
    e.Position AS Position,
    d.Dept_Name AS DepartmentName,
    d.Dept_Location AS DepartmentLocation
FROM Employee e
JOIN Emp_Working_Department ed ON e.Emp_ID = ed.Emp_ID
JOIN Department d ON ed.Dept_ID = d.Dept_ID;


SELECT * FROM EmployeeDepartment


--- Loan Details with Treasury Balance

CREATE VIEW LoanTreasuryDetails AS
SELECT 
    l.Loan_ID AS LoanID,
    l.Amount AS LoanAmount,
    l.Duration AS Duration,
    l.StartDate AS StartDate,
    l.End_Date AS EndDate,
    l.Management_Fees AS ManagementFees,
    t.Balance AS TreasuryBalance
FROM Loan l
JOIN Bank_Treasury t ON l.Treasury_ID = t.Treasury_ID;
SELECT * FROM LoanTreasuryDetails

---Customer Loan Installments
CREATE VIEW CustomerInstallments AS
SELECT 
    c.Customer_ID AS CustomerID,
    c.F_Name AS FirstName,
    c.L_Name AS LastName,
    i.Loan_ID AS LoanID,
    i.Payment_Date AS PaymentDate,
    i.Payment_Amount AS PaymentAmount
FROM Customer c
JOIN Installment i ON c.Customer_ID = i.Customer_ID;
SELECT * FROM CustomerInstallments


----ATM Refill Transactions
CREATE VIEW ATMRefillDetails AS
SELECT 
    a.ATM_ID AS ATMID,
    a.ATM_Location AS Location,
    a.Balance AS CurrentBalance,
    r.Amount AS RefilledAmount,
    r.Refill_Date AS RefillDate
FROM ATM a
LEFT JOIN Refill_ATM r ON a.ATM_ID = r.ATM_ID;
SELECT * FROM CustomerInstallments

----Employee Dependents

CREATE VIEW EmployeeDependents AS
SELECT 
    e.Emp_ID AS EmployeeID,
    e.F_Name AS FirstName,
    e.L_Name AS LastName,
    d.Dep_Name AS DependentName,
    d.Relation AS Relation,
    d.Birth_Date AS DependentBirthDate
FROM Employee e
LEFT JOIN Dependents d ON e.Emp_ID = d.Emp_ID;
SELECT * FROM EmployeeDependents


------Account Transactions Summary
CREATE VIEW AccountTransactionSummary AS
SELECT 
    t.Transaction_ID AS TransactionID,
    t.To_Account_ID AS ToAccountID,
    t.From_Account_ID AS FromAccountID,
    t.Transaction_DateTime AS TransactionDateTime,
    t.Transaction_Amount AS Amount
FROM Money_Transaction t;
SELECT * FROM AccountTransactionSummary


------ Parking and Car Details

CREATE VIEW CarParkingDetails AS
SELECT 
    c.Car_ID AS CarID,
    c.Owner_ID AS OwnerID,
    c.Owner_Type AS OwnerType,
    p.Area_ID AS ParkingArea,
    p.Time_In AS EntryTime,
    p.Time_Out AS ExitTime
FROM Car c
JOIN Parking_Time p ON c.Car_ID = p.Car_ID;
SELECT * FROM CarParkingDetails


---------------Loans Taken by Customers

CREATE VIEW CustomerLoans AS
SELECT 
    c.Customer_ID AS CustomerID,
    c.F_Name AS FirstName,
    c.L_Name AS LastName,
    l.Loan_ID AS LoanID,
    l.Amount AS LoanAmount,
    l.StartDate AS StartDate,
    t.Taking_Loan AS LoanTakenDate
FROM Customer c
JOIN Take_Loan t ON c.Customer_ID = t.Customer_ID
JOIN Loan l ON t.Loan_ID = l.Loan_ID;
SELECT * FROM CustomerLoans;