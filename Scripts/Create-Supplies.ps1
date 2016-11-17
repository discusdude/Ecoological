$credential = Get-Credential
$uname = $credential.UserName
$pass =  $credential.GetNetworkCredential().Password
$server = "ecooldb.ccd1ufibwvil.us-west-1.rds.amazonaws.com"
$db = "ecooldev"

$command = "
    --IF OBJECT_ID('supply','U') IS NOT NULL
    --    DROP TABLE supply;
    IF OBJECT_ID('supplies2','U') IS NOT NULL
        DROP TABLE supplies2;
    IF OBJECT_ID('basePrices','U') IS NOT NULL
        DROP TABLE basePrices;
    IF OBJECT_ID('discounts','U') IS NOT NULL
        DROP TABLE discounts;
    IF OBJECT_ID('supplyNames','U') IS NOT NULL
        DROP TABLE supplyNames;
    IF OBJECT_ID('conditions','U') IS NOT NULL
        DROP TABLE conditions;

    CREATE TABLE supplyNames(
        name VARCHAR(255) NOT NULL,
        PRIMARY KEY(name)
    );

    CREATE TABLE conditions(
        condition VARCHAR(255) NOT NULL,
        PRIMARY KEY(condition)
    );

    CREATE TABLE discounts(
        name VARCHAR(255) REFERENCES supplyNames(name) NOT NULL,
        condition VARCHAR(255) REFERENCES conditions(condition) NOT NULL,
        discount FLOAT NOT NULL,
        PRIMARY KEY(name, condition),
        CONSTRAINT chk_discount CHECK(discount BETWEEN 0 AND 1)
    );

    CREATE TABLE supplies2(
        name varchar(255) REFERENCES supplyNames(name) NOT NULL,
        product VARCHAR(255) NOT NULL,
        type VARCHAR(255) NOT NULL,
        condition VARCHAR(255) REFERENCES conditions(condition) NOT NULL,
        count INT,
        PRIMARY KEY(name)
    );

    CREATE TABLE basePrices(
        name VARCHAR(255) REFERENCES supplyNames(name) NOT NULL,
        price MONEY NOT NULL,
        PRIMARY KEY(name)
    );
    

    INSERT INTO supplyNames(name) VALUES
    ('Display Boxes'),
    ('Internet Boxes'),
    ('Display Product'),
    ('Internet Product'),
    ('75 ft rolls'),
    ('Areo Boxes'),
    ('Bumper Shellz');

    INSERT INTO conditions(condition) VALUES
    ('Good'),
    ('Bad');

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
    ('Areo Boxes', 'Good', 1),
    ('Areo Boxes', 'Bad', 0.5),
    ('Bumper Shellz', 'Good', 1),
    ('Bumper Shellz', 'Bad', 0.5);

    INSERT INTO basePrices(name, price) VALUES
    ('Display Boxes', 15.00),
    ('Internet Boxes', 20.99),
    ('Display Product', 9.99),
    ('Internet Product', 7.00),
    ('75 ft rolls', 5.00),
    ('Areo Boxes', 200.00),
    ('Bumper Shellz', 14.20);
    
"


Invoke-Sqlcmd -ServerInstance $server -Database $db -Username $uname -Password $pass -Query $command