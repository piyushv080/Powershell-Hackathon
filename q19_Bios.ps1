Write-Host "Piyush Verma" -ForegroundColor Green 

$Servers = Get-Content "C:\Scripts\Servers.txt"

foreach($Server in $Servers)
{
  
Get-WmiObject -Class Win32_BIOS -ComputerName $Server |
Out-GridView

}