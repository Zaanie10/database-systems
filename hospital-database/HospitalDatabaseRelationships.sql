-- Create Tables
CREATE TABLE IF NOT EXISTS Patients (
    PatientID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    BedID INT,  -- Foreign key
    City VARCHAR(50),  -- Add City column
    EmployeeID INT,  -- Add EmployeeID column
    FOREIGN KEY (BedID) REFERENCES Bed(BedID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);
    
CREATE TABLE IF NOT EXISTS Bed (
    BedID INT PRIMARY KEY,
    BedNumber INT,
    RoomNumber INT,
    IsOccupied BOOLEAN,
    PatientID INT,  -- Foreign key
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

CREATE TABLE IF NOT EXISTS Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Position VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Treatment (
    TreatmentID INT PRIMARY KEY,
    TreatmentName VARCHAR(50),
    Cost DECIMAL(10, 2),
    DepartmentID INT,  -- Foreign key
    PatientID INT,  -- Foreign key
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

CREATE TABLE IF NOT EXISTS Test (
    TestID INT PRIMARY KEY,
    TestName VARCHAR(50),
    Result VARCHAR(100),
    DepartmentID INT,  -- Foreign key
    PatientID INT,  -- Foreign key
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

-- Insert Data
-- Patients
INSERT INTO Patients(PatientID, FirstName, LastName, DateOfBirth, BedID) VALUES 
(11234, 'John', 'Doe', '1990-03-15', 1),
(21234, 'Alice', 'Smith', '1985-08-22', 2),
(31234, 'Michael', 'Johnson', '1972-05-10', 3),
(41234, 'Sarah', 'Brown', '2004-04-11', 4),
(51234, 'Emily', 'Wilson', '1980-12-03', 5);

-- Bed
INSERT INTO Bed(BedID, BedNumber, RoomNumber, IsOccupied, PatientID) VALUES 
(1, 1, 1, FALSE, 11234),
(2, 2, 1, FALSE, 21234),
(3, 3, 2, FALSE, 31234),
(4, 4, 2, FALSE, 41234),
(5, 5, 3, FALSE, 51234);

-- Employee
INSERT INTO Employee(EmployeeID, FirstName, LastName, Position) VALUES 
(1, 'Jane', 'Smith', 'Nurse'),
(2, 'Bob', 'Dole', 'Doctor'),
(3, 'Alice', 'Wonderland', 'Janitor'),
(4, 'Humpty', 'Dumpty', 'Student'),
(5, 'Manny', 'Delgato', 'Nurse');

-- Department
INSERT INTO Department(DepartmentID, DepartmentName) VALUES 
(1, 'Surgery'),
(2, 'Cardiology'),
(3, 'Oncology'),
(4, 'Pulmonary'),
(5, 'Neurology');

-- Treatment
INSERT INTO Treatment(TreatmentID, TreatmentName, Cost, DepartmentID, PatientID) VALUES 
(1, 'Steroid Injection', 150.00, 3, 11234),
(2, 'Physical Therapy', 120.00, 2, 21234),
(3, 'X-ray Imaging', 200.00, 1, 31234),
(4, 'Dental Cleaning', 80.00, 4, 41234),
(5, 'MRI Scan', 300.00, 1, 51234);

-- Test
INSERT INTO Test(TestID, TestName, Result, DepartmentID, PatientID) VALUES 
(6, 'Cholesterol Panel', 'Normal', 3, 11234),
(7, 'Blood Sugar Test', 'High', 1, 21234),
(8, 'MRI Scan', 'Abnormal', 2, 31234),
(9, 'X-ray Imaging', 'Clear', 1, 41234),
(10, 'Blood Pressure Test', 'Normal', 4, 51234);

-- Queries
-- 1. List all Patients and what Bed they are assigned to
SELECT Patients.*, Bed.BedNumber, Bed.RoomNumber
FROM Patients
LEFT JOIN Bed ON Patients.PatientID = Bed.PatientID;

-- 2. List all patients who had Treatments and what Treatment they received
SELECT Patients.*, Treatment.TreatmentName
FROM Patients
JOIN Treatment ON Patients.PatientID = Treatment.PatientID;

-- 3. List all patients who had tests and what Test they had
SELECT Patients.*, Test.TestName
FROM Patients
JOIN Test ON Patients.PatientID = Test.PatientID;

-- 4. List the employees (doctors, nurses, etc.) who assisted each patient
SELECT Patients.*, Employee.FirstName, Employee.LastName, Employee.Position
FROM Patients
JOIN Employee ON Patients.EmployeeID = Employee.EmployeeID;

-- 5. List all patients in alphabetical order
SELECT * FROM Patients
ORDER BY LastName, FirstName;

-- 6. List all patients who live in Atlanta and had a test completed
SELECT Patients.*, Test.TestName
FROM Patients
JOIN Test ON Patients.PatientID = Test.PatientID
WHERE Patients.City = 'Atlanta';

-- 7. List all patients who live in either Woodstock or Roswell who had a treatment completed
SELECT Patients.*, Treatment.TreatmentName
FROM Patients
JOIN Treatment ON Patients.PatientID = Treatment.PatientID
WHERE Patients.City IN ('Woodstock', 'Roswell');