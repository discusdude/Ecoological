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
        type VARCHAR(255),
        count INT,
        PRIMARY KEY(invid)
    );
"

Invoke-Sqlcmd -ServerInstance $server -Database $db -Username $uname -Password $pass -Query $command