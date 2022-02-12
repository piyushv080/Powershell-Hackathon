Write-Host "Piyush Verma" -ForegroundColor Magenta

Invoke-Command -ComputerName JUMPHOST,dc1,win1,wfa -ScriptBlock {
 Write-Host "Host Computer Name: $ENV:ComputerName"
}