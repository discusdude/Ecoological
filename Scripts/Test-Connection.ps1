

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

if($conn.State -eq "Open"){
    Write-Host "Connected" -ForegroundColor Cyan

}
else{
    Write-Host "Connection Failed" -ForegroundColor Red
    break
}

$cmd = New-Object System.Data.SqlClient.SqlCommand
$cmd.Connection = $conn

$cmd.CommandText = "CREATE TABLE Person (
    Pid int,
    LastName varchar(30),
    FirstName varchar(30)
);"

$cmd.ExecuteNonQuery()

$cmd.CommandText = "INSERT INTO Person (Pid, LastName, Firstname) VALUES(0,'Baggins','Bilbo');"

$cmd.ExecuteNonQuery()

$cmd.CommandText = "SELECT * FROM Person;"

$adapter = New-Object System.Data.SqlClient.SqlDataAdapter $cmd
$dataset = New-Object

#alternative method, but require multiple connects although much shorter:
#Invoke-Sqlcmd -ServerInstance $server -Database $db -Username $uname -Password $pass -Query "select * from person"