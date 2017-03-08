<<<<<<< HEAD
IF OBJECT_ID('sales','U') IS NOT NULL
    DROP TABLE sales;
CREATE TABLE sales(
	partNumber VARCHAR(255) NOT NULL,
    date DATETIME NOT NULL,
    empID VARCHAR(255) NOT NULL,
    count INT NOT NULL,
    PRIMARY KEY (date, partNumber)
)

IF OBJECT_ID('employees','U') IS NOT NULL
    DROP TABLE employees;
CREATE TABLE employees(
    empID VARCHAR(255) NOT NULL,
    lastName VARCHAR(255) NOT NULL,
    firstName VARCHAR(255) NOT NULL,
    deptID INT,
    DoB DATE NOT NULL,
    CONSTRAINT FK_employees_departments FOREIGN KEY (deptID) REFERENCES departments(deptID) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (empId)
)

-- B-Stock BumperShellz End
=======
--Iventory------------------------------------------------------------------------------------	
IF OBJECT_ID('cardboardBoxes','U') IS NOT NULL
	DROP TABLE cardboardBoxes;
 -- B-Stock BumperShellz
CREATE TABLE cardboardBoxes(
	boxID INT IDENTITY,
	boxLength VARCHAR(255) NOT NULL,
	boxWidth VARCHAR(255) NOT NULL,
	boxHeight VARCHAR(255) NOT NULL,
	count INT,
	PRIMARY KEY (boxID)
);
>>>>>>> 703945d8baa3d717ad672997d71d598840970618
