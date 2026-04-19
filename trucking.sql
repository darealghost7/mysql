CREATE DATABASE RGI_Trucking;
USE RGI_Trucking;


-- STEP 2: Create LICENCE table (must come FIRST because DRIVER references it)
CREATE TABLE IF NOT EXISTS LICENCE (
    Licence_ID INT (50) PRIMARY KEY,
    Licence_Type INT NOT NULL,
    Driver_Desc VARCHAR(50) NOT NULL
);

-- STEP 3: Create ROUTE table (must come before DRIVER)
CREATE TABLE IF NOT EXISTS ROUTE (
    ROUTE_ID VARCHAR(10) PRIMARY KEY
);

-- STEP 4: Create TRUCK table
CREATE TABLE IF NOT EXISTS TRUCK (
    TRUCK_ID VARCHAR(20) PRIMARY KEY,
    TRUCK_Desc VARCHAR(50) NOT NULL
);

-- STEP 5: Create DRIVER table (references LICENCE only, NOT ROUTE)
CREATE TABLE IF NOT EXISTS DRIVER (
    DRIVER_ID VARCHAR(10) PRIMARY KEY,
    Driver_Name VARCHAR(50) NOT NULL,
    Driver_Surname VARCHAR(50) NOT NULL,
    Licence_ID INT NOT NULL,
    FOREIGN KEY (Licence_ID) REFERENCES LICENCE(Licence_ID)
);

-- STEP 6: Create ASSIGNMENT table (links DRIVER, TRUCK, and ROUTE)
CREATE TABLE IF NOT EXISTS Assignment (
    Assignment_ID VARCHAR(12) NOT NULL,
    DRIVER_ID VARCHAR(10),
    TRUCK_ID VARCHAR(20),
    ROUTE_ID VARCHAR(10),
    PRIMARY KEY (DRIVER_ID, TRUCK_ID),
    FOREIGN KEY (DRIVER_ID) REFERENCES DRIVER(DRIVER_ID),
    FOREIGN KEY (TRUCK_ID) REFERENCES TRUCK(TRUCK_ID),
    FOREIGN KEY (ROUTE_ID) REFERENCES ROUTE(ROUTE_ID)
);

CREATE TABLE IF NOT EXISTS EMPLOYEE(
EMPLOYE_ID VARCHAR(12) PRIMARY KEY,
Employee_Name VARCHAR(50) NOT NULL,
Employee_Surname VARCHAR(50) NOT NULL,
Employee_Type enum('Dispatcher', 'FirstResponder', 'Mechanic', 'Clerk') NOT NULL
);

CREATE TABLE IF NOT EXISTS Dispatcher(
Dispatcher_ID VARCHAR(12) PRIMARY KEY,
shift_start time,
shift_end time,
FOREIGN KEY (Dispatcher_ID)  REFERENCES EMPLOYEE(EMPLOYE_ID)
);

CREATE TABLE IF NOT EXISTS FirstResponder(
FirstResponder_ID VARCHAR(18) PRIMARY KEY,
FOREIGN KEY (FirstResponder_ID)  REFERENCES EMPLOYEE(EMPLOYE_ID)
);

CREATE TABLE IF NOT EXISTS Mechanic(
Mechanic_ID VARCHAR(18) PRIMARY KEY,
FOREIGN KEY (Mechanic_ID)  REFERENCES EMPLOYEE(EMPLOYE_ID)
);

CREATE TABLE IF NOT EXISTS Clerk(
Clerk_ID VARCHAR(25) PRIMARY KEY,
FOREIGN KEY (Clerk_ID)  REFERENCES EMPLOYEE(EMPLOYE_ID)
);

-- Dispatch relationship (Dispatcher dispatches FirstResponder)
CREATE TABLE Dispatch (
    Dispatch_ID INT AUTO_INCREMENT PRIMARY KEY,
    Dispatcher_ID VARCHAR(15),
    FirstResponder_ID VARCHAR(15),
    Emergency_Location VARCHAR(200),
    Dispatch_Time DATETIME,
    FOREIGN KEY (Dispatcher_ID) REFERENCES Dispatcher(Dispatcher_ID),
    FOREIGN KEY (FirstResponder_ID) REFERENCES FirstResponder(FirstResponder_ID)
);

CREATE TABLE IF NOT EXISTS Maintenance (
    Mechanic_ID VARCHAR(15),
    Truck_ID VARCHAR(30),
    Maintenance_Date DATE,
    Maintenance_Type VARCHAR(100),
    PRIMARY KEY (Mechanic_ID, TRUCK_ID, Maintenance_Date),
    FOREIGN KEY (Mechanic_ID) REFERENCES Mechanic(Mechanic_ID),
    FOREIGN KEY (TRUCK_ID) REFERENCES TRUCK(TRUCK_ID)
);

CREATE TABLE if not exists MaintenanceQuery (
    Query_ID INT PRIMARY KEY,
    Clerk_ID VARCHAR(15),
    Mechanic_ID VARCHAR(15),
    Query_Date DATE,
    Query_Description TEXT,
    Status VARCHAR(50),
    FOREIGN KEY (Clerk_ID) REFERENCES Clerk (Clerk_ID),
    FOREIGN KEY (Mechanic_ID) REFERENCES Mechanic (Mechanic_ID)
);

-- Insert into LICENCE
INSERT INTO LICENCE (Licence_ID, Licence_Type, Driver_Desc) VALUES
(1, 1, 'Class A'),
(2, 2, 'Class B'),
(3, 3, 'Class C');

-- Insert into ROUTE
INSERT INTO ROUTE (ROUTE_ID) VALUES
('N1'), ('N2'), ('N3'), ('N4'), ('N7'),
('M4'), ('M16'), ('M27');


-- Insert into TRUCK
INSERT INTO TRUCK (TRUCK_ID, TRUCK_Desc) VALUES
('FG 87 FB ZNP', 'Purple with yellow trim'),
('FF 88 HH ZN', 'Blue'),
('DDD ZN', 'Northen Blue'),
('KING S ZN', 'Gold with gold rims'),
('LITTLE ZN', 'Pink with mocking jay hood ornament'),
('1 MAN ZN', 'White'),
('HY PP FG ZN', 'Red'),
('HOLD ZN', 'Black');


-- Insert into DRIVER
INSERT INTO DRIVER (DRIVER_ID, Driver_Name, Driver_Surname, Licence_ID) VALUES
('RGI-D25', 'John', 'Snow', 2),
('RGI-F45', 'Aegon', 'Targaryen', 1),
('RGI-G56', 'Rob', 'Stark', 1),
('RGI-F70', 'Jamie', 'Lannister', 1),
('RGI-Z56', 'Petyr', 'Baelish', 3),
('RGI-Q34', 'Jaqen', 'H\'ghar', 1),
('RGI-P90', 'Theon', 'Greyjoy', 3),
('RGI-T89', 'Hodor', 'Hodor', 2);


-- Insert into Assignment
INSERT INTO Assignment (Assignment_ID, DRIVER_ID, TRUCK_ID, ROUTE_ID) VALUES
('ASSIGN001', 'RGI-D25', 'FG 87 FB ZNP', 'N3'),
('ASSIGN002', 'RGI-F45', 'FF 88 HH ZN', 'M4'),
('ASSIGN003', 'RGI-G56', 'DDD ZN', 'N2'),
('ASSIGN004', 'RGI-F70', 'KING S ZN', 'M16'),
('ASSIGN005', 'RGI-Z56', 'LITTLE ZN', 'N1'),
('ASSIGN006', 'RGI-Q34', '1 MAN ZN', 'N7'),
('ASSIGN007', 'RGI-P90', 'HY PP FG ZN', 'M27'),
('ASSIGN008', 'RGI-T89', 'HOLD ZN', 'N4');

-- This is where i input my name
INSERT INTO DRIVER (DRIVER_ID, Driver_Name, Driver_Surname, Licence_ID) VALUES
('RGI-DBS', 'Daryl', 'Tshitenge', '1');










    