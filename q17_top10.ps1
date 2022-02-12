Write-Host "Piyush Verma" -ForegroundColor Green

$Array = @()

$Id = Get-Process |select -First 10 -Property Id |ConvertTo-Html
$CpuUtilization = Get-Process |Sort-Object -Property Cpu -Descending|select -First 10 -Property cpu|ConvertTo-Html
$ProcessesName = Get-Process| Select -first 10 -Property  ProcessName | ConvertTo-Html
$servers = Get-Service|select -First 10 -Property Name|ConvertTo-Html


# Creating custom object
        $Object = New-Object PSObject -Property ([ordered]@{
                         "Id"                     =$Id
                         "CPUutilization"        =$CpuUtilization
                         "Processname"            =$ProcessesName
                         "ServerName"             = $servers
                        })
        
    # Add object to our array
    $Array += $Object
    
    # Creating head style
$Style = @"
      
    <style>
      body {
        width:58%;
        font-family: "Verdana";
        font-size: 8pt;
        color: #0033cc;
        }
      th, td { 
        width:100%;
        border: 1px solid #ddd;
        border-collapse: collapse;
       padding:5px;
       
        }
      th {
        
        font-size: 1em;
        text-align: center;
        background-color: #00cc66;
        color: #ffffff;
        }
      td {
          
        color: #000000;
        
        }
      
    </style>
      
"@
# Creating head style and header title
$output = '<html><head>'

#Import html style file
$output += $Style
$output += '</head><body>'
$output += "<h1 style='color: #CC3300' align=center><i>Top 10 Processes</i></h1>"
$output += '</br>'
$output += '<hr>'
$output += "
            <table>
                <tr>
                    <th>Id</th>
                    <th>CPU utilization</th>
                    <th>ProcessName</th>
                    <th>ServerName</th>
                </tr>"

                               
Foreach($Entry in $Array)
{
   $output += "
               <tr>
                <td>$($Entry.Id)</td>
                <td>$($Entry.CPUutilization)</td>
                <td>$($Entry.ProcessName)</td>
                <td>$($Entry.ServerName)</td>
                </tr>  "
}

$output += "</table></body></html>"

If($Array)
{
   $Array | Select-Object  Id,CPUutilization,ProcessName,Servers | Format-Table -AutoSize -Wrap
   $output  | out-file C:\Scripts\remote_computer.html
}