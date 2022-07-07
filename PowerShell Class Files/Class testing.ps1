get-service BITS

Get-Service | Get-Member name

dir C:\Windows\System32\WindowsPowerShell\v1.0\DotNetTypes.format.ps1xml

get-content C:\Windows\System32\WindowsPowerShell\v1.0\DotNetTypes.format.ps1xml |
Select-String system.serviceprocess.servicecontroller -Context 0,30 | more

Get-Service BITS | Format-Table

Get-Service BITS | Format-List

Import-Csv C:\PowerShellTraining\computerdata.csv | Get-Member -MemberType Properties

Import-Csv C:\PowerShellTraining\computerdata.csv

Import-Csv C:\PowerShellTraining\computerdata2.csv 

Import-Csv C:\PowerShellTraining\computerdata2.csv | Format-Table


