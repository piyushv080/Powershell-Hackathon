Write-Host "Piyush Verma" -ForegroundColor Magenta

$Servers = Get-Content -Path "C:\Scripts\Servers.txt"
$Folder = "C:\piyush\*"

foreach ( $Server in $Servers)
{
  
  Copy-Item $Folder "\$Server\c$\" -Recurse -Force  
  Write-Host "Content copied" -ForegroundColor Blue
  
}