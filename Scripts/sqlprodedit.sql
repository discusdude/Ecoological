IF OBJECT_ID('employees','U') IS NOT NULL
    DROP TABLE employees;

CREATE TABLE employees(
    empID INT IDENTITY,
    lastName VARCHAR(255) NOT NULL,
    firstName VARCHAR(255) NOT NULL,
    deptID INT,
    CONSTRAINT FK_employees_departments FOREIGN KEY (deptID) REFERENCES departments(deptID) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (empId)
)