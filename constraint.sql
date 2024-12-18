 USE bankSysDb;

-- Employee Table
ALTER TABLE Employee
ADD CONSTRAINT FK_Supervisor FOREIGN KEY (Super_ID) REFERENCES Employee(Emp_ID),
    CONSTRAINT CHK_Employee_Gender CHECK (Gender IN ('f', 'm'));

-- Emp_Working_Department Table
ALTER TABLE Emp_Working_Department
ADD CONSTRAINT FK_Emp_Working FOREIGN KEY (Emp_ID) REFERENCES Employee(Emp_ID),
    CONSTRAINT FK_Dept_Working FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID),
    CONSTRAINT PK_Emp_Working PRIMARY KEY (Emp_ID, Dept_ID);

-- Department Table
ALTER TABLE Department
ADD CONSTRAINT FK_Manager FOREIGN KEY (Manager_ID) REFERENCES Employee(Emp_ID);

-- Equipment Table
ALTER TABLE Equipment
ADD CONSTRAINT FK_Equipment_Department FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID);

-- Agency_Service_Department Table
ALTER TABLE Agency_Service_Department
ADD CONSTRAINT FK_Outsource_Department FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID),
    CONSTRAINT FK_Outsource_Agency FOREIGN KEY (Agency_ID) REFERENCES Outsource_Agency(Agency_ID),
    CONSTRAINT FK_Outsource_Treasury FOREIGN KEY (Treasurey_ID) REFERENCES Bank_Treasury(Treasury_ID);

-- Loan Table
ALTER TABLE Loan
ADD CONSTRAINT FK_Loan_Treasury FOREIGN KEY (Treasury_ID) REFERENCES Bank_Treasury(Treasury_ID);

-- Installment Table
ALTER TABLE Installment
ADD CONSTRAINT FK_Installment_Loan FOREIGN KEY (Loan_ID) REFERENCES Loan(Loan_ID),
    CONSTRAINT FK_Installment_Customer FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    CONSTRAINT PK_Installment PRIMARY KEY (Loan_ID, Customer_ID, Payment_Date);

-- Take_Loan Table
ALTER TABLE Take_Loan
ADD CONSTRAINT FK_TakeLoan_Loan FOREIGN KEY (Loan_ID) REFERENCES Loan(Loan_ID),
    CONSTRAINT FK_TakeLoan_Customer FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    CONSTRAINT PK_TakeLoan PRIMARY KEY (Loan_ID, Customer_ID);

-- Customer Table
ALTER TABLE Customer
ADD CONSTRAINT CHK_Customer_Gender CHECK (Gender IN ('f', 'm'));

-- Customer_Phone Table
ALTER TABLE Customer_Phone
ADD CONSTRAINT FK_Customer_Phone FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID);

-- Dependent Table
ALTER TABLE Dependents
ADD CONSTRAINT FK_Dependent_Employee FOREIGN KEY (Emp_ID) REFERENCES Employee(Emp_ID);

-- Employee_Phone Table
ALTER TABLE Employee_Phone
ADD CONSTRAINT FK_Employee_Phone FOREIGN KEY (Emp_ID) REFERENCES Employee(Emp_ID);

-- Customer_Address Table
ALTER TABLE Customer_Address
ADD CONSTRAINT FK_Customer_Address FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    CONSTRAINT FK_Address_Zip FOREIGN KEY (Zip_Code) REFERENCES Zip_Codes(Zip_Code);

-- Money_Transaction Table
ALTER TABLE Money_Transaction
ADD CONSTRAINT FK_Transaction_ToAccount FOREIGN KEY (To_Account_ID) REFERENCES Account(Account_ID),
    CONSTRAINT FK_Transaction_FromAccount FOREIGN KEY (From_Account_ID) REFERENCES Account(Account_ID),
    CONSTRAINT FK_Transaction_ByATM FOREIGN KEY (Transaction_By) REFERENCES ATM(ATM_ID);

-- Withdraw_And_Deposit Table
ALTER TABLE Withdraw_And_Deposit
ADD CONSTRAINT FK_WD_Account FOREIGN KEY (Account_ID) REFERENCES Account(Account_ID),
    CONSTRAINT FK_WD_ByATM FOREIGN KEY (Action_By) REFERENCES ATM(ATM_ID),
    CONSTRAINT CHK_WD_Type CHECK (WD_Type IN ('withdraw', 'deposit')),
    CONSTRAINT FK_WD_Treasury FOREIGN KEY (Treasury_ID) REFERENCES Bank_Treasury(Treasury_ID);

-- Account Table
ALTER TABLE Account
ADD CONSTRAINT FK_Account_Customer FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    CONSTRAINT CHK_Account_Type CHECK (Account_Type IN ('gold', 'silver', 'platinum'));

--Refill_ATM Table
ALTER TABLE Refill_ATM
ADD CONSTRAINT FK_Refill_ATM_Outsource FOREIGN KEY (Outsource_ID) REFERENCES Outsource_Agency(Agency_ID),
    CONSTRAINT FK_Refill_ATM FOREIGN KEY (ATM_ID) REFERENCES ATM(ATM_ID);

--Car Table
ALTER TABLE Car
ADD CONSTRAINT CHK_Car_OwnerType CHECK (Owner_Type IN ('employee', 'customer'));

--Parking_Time Table
ALTER TABLE Parking_Time
ADD CONSTRAINT FK_ParkingTime_Car FOREIGN KEY (Car_ID) REFERENCES Car(Car_ID),
    CONSTRAINT FK_ParkingTime_Area FOREIGN KEY (Area_ID) REFERENCES Parking(Area_ID);
