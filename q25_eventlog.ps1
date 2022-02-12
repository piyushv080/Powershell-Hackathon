Write-Host "Piyush Verma" -ForegroundColor Green

$servers = get-content -path "C:\Scripts\Servers.txt"

$logs = get-content -path "C:\Users\Administrator.DEMO\Desktop\loglist.txt"

foreach ($server in $servers)
{
 foreach($log in $logs)
 {
   Get-WinEvent -ComputerName $server -MaxEvents 5 -ErrorAction SilentlyContinue -FilterHashtable @{
   LogName = 'Security'
   ID = $log
   }

   Get-WinEvent -ComputerName $server -MaxEvents 5 -ErrorAction SilentlyContinue -FilterHashtable @{
   LogName = 'Systems'
   ID = $log
   }

   Get-WinEvent -ComputerName $server -MaxEvents 5 -ErrorAction SilentlyContinue -FilterHashtable @{
   LogName = 'Application'
   ID = $log

   }
  }

}
