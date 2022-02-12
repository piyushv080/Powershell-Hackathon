Write-Host "Piyush Verma" -ForegroundColor Green

$Servers = Get-Content "C:\Scripts\servers.txt"
foreach($Server in $Servers)
{
Write-Host "Printing Process" $Server""
Get-Process -name "c*" -ComputerName "$server" | 
Format-Table -Property ID, ProcessName, MachineName
}
