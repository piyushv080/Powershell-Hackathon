
#Get-Credential | Export-Clixml -path "C:\Scripts\pass\pwd_new.xml"


$credential = Import-Clixml -Path "C:\Scripts\pass\pwd_new.xml"

$health = Get-PhysicalDisk | Sort Size | FT FriendlyName, Size, MediaType, SpindleSpeed, HealthStatus, OperationalStatus -AutoSize |Out-String
$From = ""
$To = ""
$Cc = ""
$Subject = "Health "
$Body = "$health"
$SMTPServer = "smtp.outlook.com"
$SMTPPort = "587"
Send-MailMessage -From $From -to $To -Cc $Cc -Subject $Subject -Body $Body -BodyAsHtml -SmtpServer $SMTPServer -Port $SMTPPort -UseSsl -Credential $Credential

