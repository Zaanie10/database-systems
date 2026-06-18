Drop table if exists Patient;
Drop table if exists Bed;
Drop table if exists Employee;
Drop table if exists Department;
Drop table if exists Treatment;
Drop table if exists Test;

CREATE TABLE IF NOT EXISTS Patient (
    PatientID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE
);
INSERT INTO Patient(PatientID, FirstName, LastName, DateOfBirth) VALUES (11234, 'John', 'Doe', '1990-03-15');
INSERT INTO Patient(PatientID, FirstName, LastName, DateOfBirth) VALUES (21234, 'Alice', 'Smith', '1985-08-22');
INSERT INTO Patient(PatientID, FirstName, LastName, DateOfBirth) VALUES (31234, 'Michael', 'Johnson', '1972-05-10');
INSERT INTO Patient(PatientID, FirstName, LastName, DateOfBirth) VALUES (41234, 'Sarah', 'Brown', '2004-04-11');
INSERT INTO Patient(PatientID, FirstName, LastName, DateOfBirth) VALUES (51234, 'Emily', 'Wilson', '1980-12-03');

CREATE TABLE IF NOT EXISTS Bed (
    BedID INT PRIMARY KEY,
    BedNumber INT,
    RoomNumber INT,
    IsOccupied BOOLEAN
);
INSERT INTO Bed(BedID, BedNumber, RoomNumber, IsOccupied) VALUES (001, 1, 1, FALSE);
INSERT INTO Bed(BedID, BedNumber, RoomNumber, IsOccupied) VALUES (002, 2, 1, FALSE);
INSERT INTO Bed(BedID, BedNumber, RoomNumber, IsOccupied) VALUES (003, 3, 2, FALSE);
INSERT INTO Bed(BedID, BedNumber, RoomNumber, IsOccupied) VALUES (004, 4, 2, FALSE);
INSERT INTO Bed(BedID, BedNumber, RoomNumber, IsOccupied) VALUES (005, 5, 3, FALSE);


CREATE TABLE IF NOT EXISTS Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Position VARCHAR(50)
);
INSERT INTO Employee(EmployeeID, FirstName, LastName, Position) VALUES (1, 'Jane', 'Smith', 'Nurse');
INSERT INTO Employee(EmployeeID, FirstName, LastName, Position) VALUES (2, 'Bob', 'Dole', 'Doctor');
INSERT INTO Employee(EmployeeID, FirstName, LastName, Position) VALUES (3, 'Alice', 'Wonderland', 'Janitor');
INSERT INTO Employee(EmployeeID, FirstName, LastName, Position) VALUES (4, 'Humpty', 'Dumpty', 'Student');
INSERT INTO Employee(EmployeeID, FirstName, LastName, Position) VALUES (5, 'Manny', 'Delgato', 'Nurse');

CREATE TABLE IF NOT EXISTS Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);
INSERT INTO Department(DepartmentID, DepartmentName) VALUES (1, 'Surgery');
INSERT INTO Department(DepartmentID, DepartmentName) VALUES (2, 'Cardiology');
INSERT INTO Department(DepartmentID, DepartmentName) VALUES (3, 'Oncology');
INSERT INTO Department(DepartmentID, DepartmentName) VALUES (4, 'Pulmonary');
INSERT INTO Department(DepartmentID, DepartmentName) VALUES (5, 'Neurology');

CREATE TABLE IF NOT EXISTS Treatment (
    TreatmentID INT PRIMARY KEY,
    TreatmentName VARCHAR(50),
    Cost DECIMAL(10, 2),
    DepartmentID INT,  -- Foreign key
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);
INSERT INTO Treatment(TreatmentID, TreatmentName, Cost, DepartmentID) VALUES (1, 'Steroid Injection', 150.00, 3);
INSERT INTO Treatment(TreatmentID, TreatmentName, Cost, DepartmentID) VALUES (2, 'Physical Therapy', 120.00, 2);
INSERT INTO Treatment(TreatmentID, TreatmentName, Cost, DepartmentID) VALUES (3, 'X-ray Imaging', 200.00, 1);
INSERT INTO Treatment(TreatmentID, TreatmentName, Cost, DepartmentID) VALUES (4, 'Dental Cleaning', 80.00, 4);
INSERT INTO Treatment(TreatmentID, TreatmentName, Cost, DepartmentID) VALUES (5, 'MRI Scan', 300.00, 1);

CREATE TABLE IF NOT EXISTS Test (
    TestID INT PRIMARY KEY,
    TestName VARCHAR(50),
    Result VARCHAR(100),
    DepartmentID INT,  -- Foreign key
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);
INSERT INTO Test(TestID, TestName, Result, DepartmentID) VALUES (6, 'Cholesterol Panel', 'Normal', 3);
INSERT INTO Test(TestID, TestName, Result, DepartmentID) VALUES (7, 'Blood Sugar Test', 'High', 1);
INSERT INTO Test(TestID, TestName, Result, DepartmentID) VALUES (8, 'MRI Scan', 'Abnormal', 2);
INSERT INTO Test(TestID, TestName, Result, DepartmentID) VALUES (9, 'X-ray Imaging', 'Clear', 1);
INSERT INTO Test(TestID, TestName, Result, DepartmentID) VALUES (10, 'Blood Pressure Test', 'Normal', 4);

SELECT * FROM Patient;
SELECT * FROM Bed;
SELECT * FROM Employee;
SELECT * FROM Department;
SELECT * FROM Treatment;
SELECT * FROM Test;
