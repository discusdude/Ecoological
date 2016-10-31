$credential = Get-Credential
$uname = $credential.UserName
$pass =  $credential.GetNetworkCredential().Password
$server = "ecooldb.ccd1ufibwvil.us-west-1.rds.amazonaws.com"
$db = "testdb"

$command = "USE master;
    SELECT name, database_id, create_date FROM sys.databases;"

Invoke-Sqlcmd -ServerInstance $server -Username $uname -Password $pass -Query $command