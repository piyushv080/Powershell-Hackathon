Write-Host "Piyush Verma" -ForegroundColor Green

#Get-service

$servers = Get-Content -Path C:\Scripts\servers.txt

Foreach($server in $servers)
{
  # get the status 
  $file=(invoke-command -ComputerName $server -ScriptBlock {Get-Service | where{$_.Name -eq "WinRM"}}) |

  Select Name, Status, PSComputerName | Export-Csv C:\Scripts\data_CSV.csv -NoTypeInformation
}

