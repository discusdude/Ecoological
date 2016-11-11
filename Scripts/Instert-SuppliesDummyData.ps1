$credential = Get-Credential
$uname = $credential.UserName
$pass =  $credential.GetNetworkCredential().Password
$server = "ecooldb.ccd1ufibwvil.us-west-1.rds.amazonaws.com"
$db = "ecooldev"
$table = "supply"

$command = "
    INSERT INTO $table(
        supply_name,
        count
    )
    VALUES
    ('Flat Boxes', 200),
    ('Pretty Boxes', 50),
    ('Normal Boxes', 100),
    ('Gap Shield Rolls', 50);
"

Invoke-Sqlcmd -ServerInstance $server -Database $db -Username $uname -Password $pass -Query $command