Write-Host "Piyush Verma" -ForegroundColor Red

$Servers = Get-Content -Path "C:\Scripts\Servers.txt"

foreach($Server in $Servers)
{

    Write-Host "Server name is = " $Server" "
    New-Item -Path C:\New\  -Name NewDir -Itemtype Directory -Force 
    Out-File -FilePath C:\New\test.txt -InputObject "random data"
}

Test-Path -Path "./New/"

