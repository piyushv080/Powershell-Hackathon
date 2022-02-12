Write-Host "Piyush Verma" -ForegroundColor Yellow

#Import-Module ServerManager  
Add-WindowsFeature -Name "RSAT-AD-PowerShell" -IncludeAllSubFeature

#importing active Directory module  
Import-Module ActiveDirectory 
 
$AccountName = Read-Host("enter the user name") 
New-ADUser $AccountName  
write-host("Displaying all the created/exixting user")  
Get-ADUser -Filter * -Properties samAccountName | select samAccountName  
write-host("user added successfully")