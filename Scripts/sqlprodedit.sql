IF OBJECT_ID('scrap','U') IS NOT NULL
    DROP TABLE scrap;
CREATE TABLE scrap(
    scrapId INT IDENTITY,
    plasticSheetPartNumber VARCHAR(255) NOT NULL,
    truckModel VARCHAR(255) NOT NULL,
	truckYear VARCHAR(255) NOT NULL,
	frontOrRear VARCHAR(10) NOT NULL,
    count INT,
    PRIMARY KEY (scrapId)
)

IF OBJECT_ID('scrapHistory','U') IS NOT NULL
    DROP TABLE scrapHistory;
CREATE TABLE scrapHistory(
    scrapId INT NOT NULL,
    date DATETIME NOT NULL,
    empID VARCHAR(255) NOT NULL,
    count int NOT NULL,
    PRIMARY KEY (date, scrapId)
)