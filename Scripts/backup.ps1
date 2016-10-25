$BackupUser = "CREATE LOGIN ecoolbackup WITH PASSWORD = 'backup', CHECK_POLICY = OFF;
CREATE USER ecoolbackup FROM LOGIN ecoolbackup;
EXEC sp_addrolemember 'db_backupoperator', 'ecoolbackup';"

Backup-SqlDatabase -ServerInstance $server -Credential $credential -Database $db -BackupFile $backupfile