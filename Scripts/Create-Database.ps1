#create DB

[System.Reflection.Assembly]::LoadWithPartialName('Microsoft.SqlServer.SMO')

$DatabaseName = "testdb"
$server = "ecoologicaldb.ccd1ufibwvil.us-west-1.rds.amazonaws.com"

$srv = New-Object Microsoft.SqlServer.Management.SMO.Server($server)

$srv.ConnectionContext.LoginSecure=$false;
$credential = Get-Credential
$loginName = $credential.UserName
$srv.ConnectionContext.set_Login($loginName);
$srv.ConnectionContext.set_SecurePassword($credential.Password)
$srv.ConnectionContext.ApplicationName="SQLDeploymentScript"


$db = New-Object Microsoft.SqlServer.Management.Smo.Database($srv, "testdb")
$db.Create()