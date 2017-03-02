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