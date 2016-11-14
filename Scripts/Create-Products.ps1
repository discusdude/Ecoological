$credential = Get-Credential
$uname = $credential.UserName
$pass = $credential.GetNetworkCredential().Password
$server = "ecooldb.ccd1ufibwvil.us-west-1.rds.amazonaws.com"
$db = "Ecoolprod"

$command = "
    IF OBJECT_ID('products','U') IS NOT NULL
        DROP TABLE products;

    IF OBJECT_ID('ProductTypes','U') IS NOT NULL
        DROP TABLE ProductTypes;

    IF OBJECT_ID('BumperShellz','U') IS NOT NULL
        DROP TABLE BumperShellz;

    IF OBJECT_ID('GapShields','U') IS NOT NULL
        DROP TABLE GapShields;

    IF OBJECT_ID('AreoBox','U') IS NOT NULL
        DROP TABLE AreoBox;


    CREATE TABLE ProductTypes(
        ProductTypeID int,
        ProductType varchar(20),
        PRIMARY KEY(ProductTypeID)
    );

    INSERT INTO ProductTypes(
        ProductTypeID,
        ProductType
    )
    VALUES
    (1,'Bumper Shellz'),
    (2,'Gap Sheild'),
    (3,'Areo Box');

    CREATE TABLE products(
        ProdID INT IDENTITY,
        ProductTypeID int REFERENCES ProductTypes(ProductTypeID) NOT NULL,
        price MONEY,
        location INT,
        PRIMARY KEY(ProdID),
        CONSTRAINT Product_AltPK unique (ProdID, ProductTypeID)
    );

    CREATE TABLE BumperShellz(
        ProdID INT,
        ProductTypeID as 1 persisted,
        Condition varchar(20),
        Status varchar(20),
        SKU int,
        Count int,
        PRIMARY KEY(ProdID),
        FOREIGN KEY(ProdID, ProductTypeID) REFERENCES products(ProdID, ProductTypeID)
    )

    CREATE TABLE GapShields(
        ProdID INT,
        ProductTypeID as 2 persisted,
        Count int,
        PRIMARY KEY(ProdID),
        FOREIGN KEY(ProdID, ProductTypeID) REFERENCES products(ProdID, ProductTypeID)
    )

    CREATE TABLE AreoBox(
        ProdID INT,
        ProductTypeID as 3 persisted,
        SKU int,
        Count int,
        PRIMARY KEY(ProdID),
        FOREIGN KEY(ProdID, ProductTypeID) REFERENCES products(ProdID, ProductTypeID)
    )
"

Invoke-Sqlcmd -ServerInstance $server -Database $db -Username $uname -Password $pass -Query $command