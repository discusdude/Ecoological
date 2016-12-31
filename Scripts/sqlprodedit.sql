--Iventory------------------------------------------------------------------------------------
IF OBJECT_ID('plasticSheet','U') IS NOT NULL
    DROP TABLE plasticSheet;
-- "plasticSheet" created by Mitchell Evans
CREATE TABLE plasticSheet(
	partNumber VARCHAR(255) NOT NULL,
	name VARCHAR(255) NOT NULL,
	sheetLength VARCHAR(255) NOT NULL,
	sheetWidth VARCHAR(255) NOT NULL,
	count INT,
	PRIMARY KEY (partNumber)
);