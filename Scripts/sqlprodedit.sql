--Iventory------------------------------------------------------------------------------------
 -- B-Stock BumperShellz
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
	PRIMARY KEY (partNumber,truckModel,condition)
);

-- "bumperShellz" created by Mitchell Evans
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
	PRIMARY KEY (partNumber,truckModel,condition)
);

-- B-Stock BumperShellz End