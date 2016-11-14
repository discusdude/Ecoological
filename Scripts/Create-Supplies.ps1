$credential = Get-Credential
$uname = $credential.UserName
$pass = $credential.GetNetworkCredential().Password
$server = "ecooldb.ccd1ufibwvil.us-west-1.rds.amazonaws.com"
$db = "ecoolprod"

$command = "
    IF OBJECT_ID('supply','U') IS NOT NULL
        DROP TABLE supply;
    CREATE TABLE supply(
        ID INT IDENTITY,
        supply_name VARCHAR(255),
        count INT,
        PRIMARY KEY(ID)
    );
"

Invoke-Sqlcmd -ServerInstance $server -Database $db -Username $uname -Password $pass -Query $command