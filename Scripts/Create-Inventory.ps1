$credential = Get-Credential
$uname = $credential.UserName
$pass =  $credential.GetNetworkCredential().Password
$server = "ecooldb.ccd1ufibwvil.us-west-1.rds.amazonaws.com"
$db = "Ecooldev"

$command = "
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
"

Invoke-Sqlcmd -ServerInstance $server -Database $db -Username $uname -Password $pass -Query $command
#name, type, conditions