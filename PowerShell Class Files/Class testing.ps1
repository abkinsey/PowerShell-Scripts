

#***** Begin Script Block ******
Get-Process | Sort-Object cpu -Descending |
Select-Object -First 10 -Property Id, Name, CPU, StartTime,
@{Name = "Runtime" ;Expression={(Get-Date)-$_.StartTime}}
#***** End Script BLock *******

Get-Service bits  | Select-Object *

Get-Service -machinename akinsey-laptop | Select-Object DisplayName, Status, @{Name="ComputerName";Expression={$_.machinename}}

