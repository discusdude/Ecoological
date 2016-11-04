$credential = Get-Credential
$uname = $credential.UserName
$pass =  $credential.GetNetworkCredential().Password
$server = "ecooldb.ccd1ufibwvil.us-west-1.rds.amazonaws.com"
$db = "testdb"


$command = "
    IF OBJECT_ID('individual','U') IS NOT NULL
        DROP TABLE individual;
    CREATE TABLE individual(
        ID int IDENTITY,
        lastname varchar(255),
        firstname varchar(255),
        PRIMARY KEY(ID)
    );
"

Invoke-Sqlcmd -ServerInstance $server -Database $db -Username $uname -Password $pass -Query $command
