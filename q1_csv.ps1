Write-Host "Piyush Verma" -ForegroundColour Green

#Get-Service 

Get-Service -DisplayName *Windows* | Select-Object -Property DisplayName, Status,RequiredServices ,DependentServices |
Export-Csv -Path C:\Scripts\status.csv -NoTypeInformation
