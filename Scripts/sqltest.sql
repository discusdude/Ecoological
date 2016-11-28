--Iventory
IF OBJECT_ID('inventories','U') IS NOT NULL
    DROP TABLE inventories;
CREATE TABLE inventories(
    invid INT IDENTITY,
    date DATE,
    name VARCHAR(255) REFERENCES supplyNames(name) NOT NULL,
    condition VARCHAR(255) REFERENCES conditions(condition) NOT NULL,
    type VARCHAR(255) NOT NULL,
    count INT,
    PRIMARY KEY(invid),
    CONSTRAINT chk_type CHECK(type IN('Product','Supply'))
);

--Customers

IF OBJECT_ID('custEmails','U') IS NOT NULL
    DROP TABLE custEmails;
IF OBJECT_ID('custShipping','U') IS NOT NULL
    DROP TABLE custShipping; 
IF OBJECT_ID('custPhones','U') IS NOT NULL
    DROP TABLE custPhones; 
IF OBJECT_ID('states','U') IS NOT NULL
    DROP TABLE states;
IF OBJECT_ID('customers','U') IS NOT NULL
    DROP TABLE customers;
CREATE TABLE customers(
    custid INT IDENTITY,
    lastName VARCHAR(255),
    firstName VARCHAR(255),
    PRIMARY KEY(custid)
    
);
CREATE TABLE custEmails(
    custid INT NOT NULL,
    email VARCHAR(255),
    CONSTRAINT FK_custemails_custid FOREIGN KEY (custid) REFERENCES customers(custid) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY(custid, email)
);
CREATE TABLE states(
    code VARCHAR(20) NOT NULL,
    name VARCHAR(64) NOT NULL,
    PRIMARY KEY (name)
);

--Look into on update cascade
CREATE TABLE custShipping(
    custid INT REFERENCES customers(custid) NOT NULL,
    state VARCHAR(64) NOT NULL,
    zipCode INT,
    CONSTRAINT FK_shipping_state FOREIGN KEY (state) REFERENCES states(name) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT chk_zipCode CHECK(zipCode >= 10000 AND zipCode  <= 99999) --custShipping constraint to force zip code to have correct number of digits
);

CREATE TABLE custPhones(
    custid INT NOT NULL,
    phoneNumber VARCHAR(15),
    CONSTRAINT FK_custphones_custid FOREIGN KEY (custid) REFERENCES customers(custid) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT chk_phoneNumber CHECK(phoneNumber LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]')
);

INSERT INTO states(code, name) VALUES ('AL','Alabama'), ('AK','Alaska'), ('AS','American Samoa'), ('AZ','Arizona'), ('AR','Arkansas'), ('CA','California'), ('CO','Colorado'), ('CT','Connecticut'), ('DE','Delaware'), ('DC','District of Columbia'), ('FM','Federated States of Micronesia'), ('FL','Florida'), ('GA','Georgia'), ('GU','Guam'), ('HI','Hawaii'), ('ID','Idaho'), ('IL','Illinois'), ('IN','Indiana'), ('IA','Iowa'), ('KS','Kansas'), ('KY','Kentucky'), ('LA','Louisiana'), ('ME','Maine'), ('MH','Marshall Islands'), ('MD','Maryland'), ('MA','Massachusetts'), ('MI','Michigan'), ('MN','Minnesota'), ('MS','Mississippi'), ('MO','Missouri'), ('MT','Montana'), ('NE','Nebraska'), ('NV','Nevada'), ('NH','New Hampshire'), ('NJ','New Jersey'), ('NM','New Mexico'), ('NY','New York'), ('NC','North Carolina'), ('ND','North Dakota'), ('MP','Northern Mariana Islands'), ('OH','Ohio'), ('OK', 'Oklahoma'), ('OR','Oregon'), ('PW','Palau'), ('PA','Pennsylvania'), ('PR','Puerto Rico'), ('RI','Rhode Island'), ('SC','South Carolina'), ('SD','South Dakota'), ('TN','Tennessee'), ('TX','Texas'), ('UT','Utah'), ('VT','Vermont'), ('VI','Virgin Islands'), ('VA','Virginia'), ('WA','Washington'), ('WV','West Virginia'), ('WI','Wisconsin'), ('WY','Wyoming');

--Sales
--Going to make a trigger that automatically sets datetime at time of purchase
IF OBJECT_ID('sales','U') IS NOT NULL
    DROP TABLE sales;
CREATE TABLE sales(
    date DATETIME NOT NULL,
    name VARCHAR(255) REFERENCES supplyNames(name) NOT NULL,
    count INT  NOT NULL,
    PRIMARY KEY (date, name)
)

--Patents
IF OBJECT_ID('patents','U') IS NOT NULL
    DROP TABLE patents;
CREATE TABLE patents(
    patentNumber INT NOT NULL,
    patentName VARCHAR(255) NOT NULL,
    PRIMARY KEY (patentNumber)
)

--GROUP DEPARTMENTS, EMPLOYEES, AND EMPPHONES TOGETHER, DROP EMPPHONES THEN EMPLOYEES
IF OBJECT_ID('empPhones','U') IS NOT NULL
    DROP TABLE empPhones;
IF OBJECT_ID('employees','U') IS NOT NULL
    DROP TABLE employees;
IF OBJECT_ID('departments','U') IS NOT NULL
    DROP TABLE departments;
--Departments
CREATE TABLE departments(
    deptID INT NOT NULL,
    name VARCHAR(255),
    PRIMARY KEY (deptID)
)
--Employees
--Need trigger for age or view
CREATE TABLE employees(
    empID INT IDENTITY,
    lastName VARCHAR(255) NOT NULL,
    firstName VARCHAR(255) NOT NULL,
    deptID INT,
    DoB DATE NOT NULL,
    CONSTRAINT FK_employees_departments FOREIGN KEY (deptID) REFERENCES departments(deptID) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (empId)
)
CREATE TABLE empPhones(
    empID INT NOT NULL,
    phoneNumber VARCHAR(15),
    CONSTRAINT FK_empphones_empid FOREIGN KEY (empID) REFERENCES employees(empID) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT chk_EmpPhoneNumber CHECK(phoneNumber LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]')
);

--Employee view
-- USE Ecooldev;
-- GO
-- IF OBJECT_ID ('emps', 'V') IS NOT NULL
--     DROP VIEW emps;
-- GO
-- CREATE VIEW emps
-- AS
-- SELECT p.firstName, p.lastname, p.name