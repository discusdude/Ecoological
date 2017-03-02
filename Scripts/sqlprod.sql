--drop these tables if exist because they reference productNames and supplyNames
IF OBJECT_ID('inventories','U') IS NOT NULL
    DROP TABLE inventories;
IF OBJECT_ID('sales','U') IS NOT NULL
    DROP TABLE sales;

--supplies------------------------------------------------------------------------------------
IF OBJECT_ID('supplies','U') IS NOT NULL
    DROP TABLE supplies;
IF OBJECT_ID('basePrices','U') IS NOT NULL
    DROP TABLE basePrices;
IF OBJECT_ID('discounts','U') IS NOT NULL
    DROP TABLE discounts;
--IF OBJECT_ID('supplyNames','U') IS NOT NULL
--    DROP TABLE supplyNames;
IF OBJECT_ID('productNames','U') IS NOT NULL
    DROP TABLE productNames;
--IF OBJECT_ID('conditions','U') IS NOT NULL
--    DROP TABLE conditions;
IF OBJECT_ID('bumperShellzRight2','U') IS NOT NULL
	DROP TABLE bumperShellzRight2;
IF OBJECT_ID('bumperShellzLeft2','U') IS NOT NULL
	DROP TABLE bumperShellzLeft2;
IF OBJECT_ID('bumperShellzCenter2','U') IS NOT NULL
	DROP TABLE bumperShellzCenter2;
IF OBJECT_ID('bumperShellzRight1','U') IS NOT NULL
	DROP TABLE bumperShellzRight1;
IF OBJECT_ID('bumperShellzLeft1','U') IS NOT NULL
	DROP TABLE bumperShellzLeft1;
IF OBJECT_ID('bumperShellzCenter1','U') IS NOT NULL
	DROP TABLE bumperShellzCenter1;
IF OBJECT_ID('bumperShellzRight2B','U') IS NOT NULL
	DROP TABLE bumperShellzRight2B;
IF OBJECT_ID('bumperShellzLeft2','U') IS NOT NULL
	DROP TABLE bumperShellzLeft2B;
IF OBJECT_ID('bumperShellzCenter2','U') IS NOT NULL
	DROP TABLE bumperShellzCenter2B;
IF OBJECT_ID('gapShield','U') IS NOT NULL
	DROP TABLE gapShield;
IF OBJECT_ID('aeroBox','U') IS NOT NULL
	DROP TABLE aeroBox;
IF OBJECT_ID('cardboardBoxes','U') IS NOT NULL
	DROP TABLE cardboardBoxes;


	


--supplyNames for constraint
--CREATE TABLE supplyNames(
--   name VARCHAR(255) NOT NULL,
--    PRIMARY KEY(name)
--);
--productNames for constraint
CREATE TABLE productNames(
    product VARCHAR(255) NOT NULL,
    PRIMARY KEY(product)
);

--conditions for constraint
--CREATE TABLE conditions(
--    condition VARCHAR(255) NOT NULL,
--    PRIMARY KEY(condition)
--);

CREATE TABLE discounts(
    name VARCHAR(255) NOT NULL,
    condition VARCHAR(255) NOT NULL,
    discount FLOAT NOT NULL,
    PRIMARY KEY(name, condition),
    CONSTRAINT chk_discount CHECK(discount BETWEEN 0 AND 1)
);

-- Talon and I decided to split the bumperShellz table out of the supplies table, so I figured I might as well split the other products out. 12/21/2016
-- "partNumber", "wholesale" and "price" added by Mitchell Evans 12/10/2016 also primary key changed from name and product to partNumber
CREATE TABLE supplies(
	name varchar(255) NOT NULL,
    product VARCHAR(255) NOT NULL,
    count INT,
	price MONEY, 
    PRIMARY KEY(name, product)
    --CONSTRAINT chk_type_supplies CHECK(type IN('Product','Supply'))
);
-- "gapShield" created by Mitchell Evans
CREATE TABLE gapShield(
    partNumber VARCHAR(255) NOT NULL,
	wholesale VARCHAR(255),
	name varchar(255) NOT NULL,
    condition VARCHAR(255) NOT NULL,
    count INT,
	price MONEY, 
    PRIMARY KEY(partNumber)
    --CONSTRAINT chk_type_supplies CHECK(type IN('Product','Supply'))
);
-- "aeroBox" created by Mitchell Evans
CREATE TABLE aeroBox(
    partNumber VARCHAR(255) NOT NULL,
	wholesale VARCHAR(255),
	name varchar(255) NOT NULL,
    condition VARCHAR(255) NOT NULL,
    count INT,
	price MONEY, 
    PRIMARY KEY(partNumber)
    --CONSTRAINT chk_type_supplies CHECK(type IN('Product','Supply'))
);

CREATE TABLE bumperShellzRight2(
	partNumber VARCHAR(255) NOT NULL,
	truckModel VARCHAR(255) NOT NULL,
	truckYear VARCHAR(255) NOT NULL,
	sensorHoles VARCHAR(10) NOT NULL,
	frontOrRear VARCHAR(10) NOT NULL,	
	fogLamps VARCHAR(10) NOT NULL,
	exhaust VARCHAR(10) NOT NULL,
	UPC VARCHAR(255),
	name varchar(255) NOT NULL,
    condition VARCHAR(10) NOT NULL,
    count INT,
	price MONEY,
	threshold INT,
	boxID INT, 
	PRIMARY KEY (partNumber,truckModel,condition)
);

-- "bumperShellz" created by Mitchell Evans
CREATE TABLE bumperShellzLeft2(
	partNumber VARCHAR(255) NOT NULL,
	truckModel VARCHAR(255) NOT NULL,
	truckYear VARCHAR(255) NOT NULL,
	sensorHoles VARCHAR(10) NOT NULL,
	frontOrRear VARCHAR(10) NOT NULL,	
	fogLamps VARCHAR(10) NOT NULL,
	exhaust VARCHAR(10) NOT NULL,
	UPC VARCHAR(255),
	name varchar(255) NOT NULL,
    condition VARCHAR(10) NOT NULL,
    count INT,
	price MONEY,
	threshold INT,
	boxID INT, 
	PRIMARY KEY (partNumber,truckModel,condition)
);

-- "bumperShellz" created by Mitchell Evans
CREATE TABLE bumperShellzCenter2(
	partNumber VARCHAR(255) NOT NULL,
	truckModel VARCHAR(255) NOT NULL,
	truckYear VARCHAR(255) NOT NULL,
	sensorHoles VARCHAR(10) NOT NULL,
	frontOrRear VARCHAR(10) NOT NULL,	
	fogLamps VARCHAR(10) NOT NULL,
	exhaust VARCHAR(10) NOT NULL,
	UPC VARCHAR(255),
	name varchar(255) NOT NULL,
    condition VARCHAR(10) NOT NULL,
    count INT,
	price MONEY,
	threshold INT,
	boxID INT, 
	PRIMARY KEY (partNumber,truckModel,condition)
);

 CREATE TABLE bumperShellzRight1(
	partNumber VARCHAR(255) NOT NULL,
	truckModel VARCHAR(255) NOT NULL,
	truckYear VARCHAR(255) NOT NULL,
	sensorHoles VARCHAR(10) NOT NULL,
	frontOrRear VARCHAR(10) NOT NULL,	
	fogLamps VARCHAR(10) NOT NULL,
	exhaust VARCHAR(10) NOT NULL,
	UPC VARCHAR(255),
	name varchar(255) NOT NULL,
    condition VARCHAR(10) NOT NULL,
    count INT,
	price MONEY,
	threshold INT,
	boxID INT, 
	PRIMARY KEY (partNumber,truckModel,condition)
);

CREATE TABLE bumperShellzLeft1(
	partNumber VARCHAR(255) NOT NULL,
	truckModel VARCHAR(255) NOT NULL,
	truckYear VARCHAR(255) NOT NULL,
	sensorHoles VARCHAR(10) NOT NULL,
	frontOrRear VARCHAR(10) NOT NULL,	
	fogLamps VARCHAR(10) NOT NULL,
	exhaust VARCHAR(10) NOT NULL,
	UPC VARCHAR(255),
	name varchar(255) NOT NULL,
    condition VARCHAR(10) NOT NULL,
    count INT,
	price MONEY,
	threshold INT,
	boxID INT, 
	PRIMARY KEY (partNumber,truckModel,condition)
);

CREATE TABLE bumperShellzCenter1(
	partNumber VARCHAR(255) NOT NULL,
	truckModel VARCHAR(255) NOT NULL,
	truckYear VARCHAR(255) NOT NULL,
	sensorHoles VARCHAR(10) NOT NULL,
	frontOrRear VARCHAR(10) NOT NULL,	
	fogLamps VARCHAR(10) NOT NULL,
	exhaust VARCHAR(10) NOT NULL,
	UPC VARCHAR(255),
	name varchar(255) NOT NULL,
    condition VARCHAR(10) NOT NULL,
    count INT,
	price MONEY,
	threshold INT,
	boxID INT, 
	PRIMARY KEY (partNumber,truckModel,condition)
);

 CREATE TABLE bumperShellzRight2B(
	partNumber VARCHAR(255) NOT NULL,
	truckModel VARCHAR(255) NOT NULL,
	truckYear VARCHAR(255) NOT NULL,
	sensorHoles VARCHAR(10) NOT NULL,
	frontOrRear VARCHAR(10) NOT NULL,	
	fogLamps VARCHAR(10) NOT NULL,
	exhaust VARCHAR(10) NOT NULL,
	UPC VARCHAR(255),
	name varchar(255) NOT NULL,
    condition VARCHAR(10) NOT NULL,
    count INT,
	price MONEY,
	threshold INT,
	boxID INT, 
	PRIMARY KEY (partNumber,truckModel,condition)
);

CREATE TABLE bumperShellzLeft2B(
	partNumber VARCHAR(255) NOT NULL,
	truckModel VARCHAR(255) NOT NULL,
	truckYear VARCHAR(255) NOT NULL,
	sensorHoles VARCHAR(10) NOT NULL,
	frontOrRear VARCHAR(10) NOT NULL,	
	fogLamps VARCHAR(10) NOT NULL,
	exhaust VARCHAR(10) NOT NULL,
	UPC VARCHAR(255),
	name varchar(255) NOT NULL,
    condition VARCHAR(10) NOT NULL,
    count INT,
	price MONEY,
	threshold INT,
	boxID INT, 
	PRIMARY KEY (partNumber,truckModel,condition)
);

-- "bumperShellz" created by Mitchell Evans
CREATE TABLE bumperShellzCenter2B(
	partNumber VARCHAR(255) NOT NULL,
	truckModel VARCHAR(255) NOT NULL,
	truckYear VARCHAR(255) NOT NULL,
	sensorHoles VARCHAR(10) NOT NULL,
	frontOrRear VARCHAR(10) NOT NULL,	
	fogLamps VARCHAR(10) NOT NULL,
	exhaust VARCHAR(10) NOT NULL,
	UPC VARCHAR(255),
	name varchar(255) NOT NULL,
    condition VARCHAR(10) NOT NULL,
    count INT,
	price MONEY,
	threshold INT,
	boxID INT, 
	PRIMARY KEY (partNumber,truckModel,condition)
);

-- B-Stock BumperShellz End






CREATE TABLE plasticSheet(
	partNumber VARCHAR(255) NOT NULL,
	name VARCHAR(255) NOT NULL,
	sheetLength VARCHAR(255) NOT NULL,
	sheetWidth VARCHAR(255) NOT NULL,
	count INT,
	PRIMARY KEY (partNumber)
);

CREATE TABLE cardboardBoxes(
	boxID INT IDENTITY,
	boxLength VARCHAR(255) NOT NULL,
	boxWidth VARCHAR(255) NOT NULL,
	boxHeight VARCHAR(255) NOT NULL,
	count INT,
	PRIMARY KEY (boxID)
);

CREATE TABLE basePrices(
    name VARCHAR(255) NOT NULL,
    price MONEY NOT NULL,
    PRIMARY KEY(name)
);


--INSERT INTO supplyNames(name) VALUES
--('Tailgate Gap Cover'),
--('8 Pack'),
--('75 ft roll'),
--('PoP Display'),
--('Gloss Black'),
--('Matte Black'),
--('Carbon Fiber (blk)'),
--('Brushed Metal'),
--('Camouflage (RealTreeMax4)'),
--('Camouflage (Branching Out)'),
--('Camouflage (Mossy Oak Break Up)'),
--('Camouflage (RealTree AP)'),
--('Camouflage (Mossy Oak Duck Blind)'),
--('Gloss White'),
--('ToughShellz (haircell texture, blk ABS)'),
--('Paintable ABS'),
--('Standard Assembly'),
--('Premium Assembly');

INSERT INTO productNames(product) VALUES
('AeroBox'),
('GapShield'),
('BumperShellz');

--INSERT INTO conditions(condition) VALUES
--('Good'),
--('Bad');

INSERT INTO discounts(name, condition, discount) VALUES
('Display Boxes', 'Good', 1),
('Display Boxes', 'Bad', 0.5),
('Internet Boxes', 'Good', 1),
('Internet Boxes', 'Bad', 0.5),
('Display Product', 'Good', 1),
('Display Product', 'Bad', 0.5),
('Internet Product', 'Good', 1),
('Internet Product', 'Bad', 0.5),
('75 ft rolls', 'Good', 1),
('75 ft rolls', 'Bad', 0.5),
('AeroBoxes', 'Good', 1),
('AeroBoxes', 'Bad', 0.5),
('BumperShellz', 'Good', 1),
('BumperShellz', 'Bad', 0.5);

INSERT INTO basePrices(name, price) VALUES
('Display Boxes', 15.00),
('Internet Boxes', 20.99),
('Display Product', 9.99),
('Internet Product', 7.00),
('75 ft rolls', 5.00),
('AeroBoxes', 200.00),
('BumperShellz', 14.20);

--Iventory------------------------------------------------------------------------------------
IF OBJECT_ID('inventories','U') IS NOT NULL
    DROP TABLE inventories;
CREATE TABLE inventories(
    invid INT IDENTITY,
	partNumber VARCHAR(255) NOT NULL,
    date DATETIME,
    name VARCHAR(255) NOT NULL,
    product VARCHAR(255) NOT NULL,
    condition VARCHAR(255)NOT NULL,
	rightLeftCenter varchar(10),
	whip INT,
    type VARCHAR(255) NOT NULL,
    count INT,
    PRIMARY KEY(invid)
    --CONSTRAINT chk_type CHECK(type IN('Product','Supply'))
);

--Customers------------------------------------------------------------------------------------

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
    custid INT,
    state VARCHAR(64) NOT NULL,
    zipCode INT,
    CONSTRAINT FK_shipping_state FOREIGN KEY (state) REFERENCES states(name) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_custshipping_custid FOREIGN KEY (custid) REFERENCES customers(custid) ON DELETE CASCADE ON UPDATE CASCADE,
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
    name VARCHAR(255) NOT NULL,
    count INT NOT NULL,
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