Write-Host "Piyush Verma" -ForegroundColor Green

$Servers = Get-Content "C:\Scripts\servers.txt"
foreach($Server in $Servers)
{

$ipconfig = $null
$ipconfig = Get-WmiObject -Class "win32_networkadapterconfiguration" -ComputerName $Servers

Write-Host "The Server"$Server""
Write-Host "IP ADDRESS" $ipconfig.ipaddress;
Write-HOST "MAC ADDRESS" $ipconfig.macaddress


}