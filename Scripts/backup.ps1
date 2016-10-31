<#Unnescessary

$credential = Get-Credential
$uname = $credential.UserName
$pass =  $credential.GetNetworkCredential().Password
$server = "ecooldb.ccd1ufibwvil.us-west-1.rds.amazonaws.com"
$db = "testdb"

$BackupUser = "CREATE LOGIN ecoolbackup WITH PASSWORD = 'backup', CHECK_POLICY = OFF;
CREATE USER ecoolbackup FROM LOGIN ecoolbackup;
EXEC sp_addrolemember 'db_backupoperator', 'ecoolbackup';"

$backupfile = "D:\Users\skyla\Documents\Fall2016\IT350\Ecoological\Scripts\backup.sql"

Backup-SqlDatabase -ServerInstance $server -Credential $credential -Database $db -BackupFile $backupfile#>