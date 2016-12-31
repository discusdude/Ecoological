$credential = Get-Credential
$uname = $credential.UserName
$pass =  $credential.GetNetworkCredential().Password
$server = "ecooldb.ccd1ufibwvil.us-west-1.rds.amazonaws.com"
$db = "Ecoolprod"
$tableSQLPath = "$PSScriptRoot\sqlprodedit.sql"


#create tables
Invoke-Sqlcmd -ServerInstance $server -Database $db -Username $uname -Password $pass -InputFile $tableSQLPath

pause