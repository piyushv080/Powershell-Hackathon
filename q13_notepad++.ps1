Write-Host "Piyush Verma"

$computers = c:\Scripts\Servers.txt
$Notepad = "Location of notepad install"

$computers | where{test-connection $_ -quiet -count 1} | ForEach-Object {

  copy-item $Notepad -recurse "\\$_\c$\temp" 

  $newProc=([WMICLASS]"\\$_\root\cimv2:win32_Process").Create("C:\temp\npp.6.9.2.Installer.exe /S")

  If ($newProc.ReturnValue -eq 0) { 
    Write-Host $_ $newProc.ProcessId 
  } else { 
    write-host $_ Process create failed with $newProc.ReturnValue 
  }
}