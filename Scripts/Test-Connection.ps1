

$credential = Get-Credential
$uname = $credential.UserName
$pass =  $credential.GetNetworkCredential().Password
$server = "ecoologicaldb.ccd1ufibwvil.us-west-1.rds.amazonaws.com"
$db = "testdb"



$stringbuilder = New-Object Text.Stringbuilder

[void]$stringbuilder.AppendFormat("server={0};database={1};uid={2};pwd={3}", $server, $db, $uname, $pass)


$conn = New-Object System.Data.SqlClient.SqlConnection
$conn.ConnectionString = $stringbuilder.ToString()
$conn.Open()


    switch ($conn.State)
{
"Open" { Write-Host "Do some work"; }
Default { Write-Host "The connection is $($conn.State).  There has been an error connecting to the database."; }
}

