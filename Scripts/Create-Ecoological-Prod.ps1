$credential = Get-Credential
$uname = $credential.UserName
$pass =  $credential.GetNetworkCredential().Password
$server = "ecooldb.ccd1ufibwvil.us-west-1.rds.amazonaws.com"
$db = "Ecoolprod"
$tableSQLPath = "$PSScriptRoot\sqlprod.sql"

#create database
$command = "USE master;
IF EXISTS(SELECT * FROM sys.databases WHERE name = '$db') DROP DATABASE $db;
CREATE DATABASE $db;"

Invoke-Sqlcmd -ServerInstance $server -Username $uname -Password $pass -Query $command

#create tables
Invoke-Sqlcmd -ServerInstance $server -Database $db -Username $uname -Password $pass -InputFile $tableSQLPath