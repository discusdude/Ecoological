IF OBJECT_ID('inventories','U') IS NOT NULL
    DROP TABLE inventories;
CREATE TABLE inventories(
    invid INT IDENTITY,
    date DATE,
    name VARCHAR(255) REFERENCES supplyNames(name) NOT NULL,
    condition VARCHAR(255) REFERENCES conditions(condition) NOT NULL,
    type VARCHAR(255) NOT NULL,
    count INT,
    PRIMARY KEY(invid)
);

SELECT TABLE_NAME FROM Ecooldev.INFORMATION_SCHEMA.Tables WHERE TABLE_TYPE = 'BASE TABLE'

select * from supplies2

SELECT * from supplyNames