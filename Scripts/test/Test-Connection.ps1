$credential = Get-Credential
$uname = $credential.UserName
$pass =  $credential.GetNetworkCredential().Password
$server = "ecooldb.ccd1ufibwvil.us-west-1.rds.amazonaws.com"
$db = "testdb"

$command = "CREATE TABLE Person (
    Pid int,
    LastName varchar(30),
    FirstName varchar(30)
);"
$command2 = "INSERT INTO Person (Pid, LastName, Firstname) VALUES(0,'Baggins','Bilbo');"

$command3 = "SELECT * FROM Person;"

Invoke-Sqlcmd -ServerInstance $server -Database $db -Username $uname -Password $pass -Query $command

Invoke-Sqlcmd -ServerInstance $server -Database $db -Username $uname -Password $pass -Query $command2

$out = Invoke-Sqlcmd -ServerInstance $server -Database $db -Username $uname -Password $pass -Query $command3

write-host $out

#alternative method, but require multiple connects although much shorter:
#Invoke-Sqlcmd -ServerInstance $server -Database $db -Username $uname -Password $pass -Query "select * from person"

#Invoke-Sqlcmd -InputFile
