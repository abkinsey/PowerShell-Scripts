

#***** Begin Script Block ******
Get-Process | Sort-Object cpu -Descending |
Select-Object -First 10 -Property Id, Name, CPU, StartTime,
@{Name = "Runtime" ;Expression={(Get-Date)-$_.StartTime}}
#***** End Script BLock *******

Get-Service bits  | Select-Object *

Get-Service -machinename akinsey-laptop | Select-Object DisplayName, Status, @{Name="ComputerName";Expression={$_.machinename}}

#********* This will only work in older verions of PowerShell and not v7 ***************
Get-Service -ComputerName ps-srvr01, Win10-PC1 | Select-Object DisplayName, Status,
@{name="ComputerName";Expression={$_.machinename}} | Out-GridView -Title "Services"
#*****************************************************************************************

#****** Powershell 7 way to accomplish this on a remote machine *******
New-PSSession -ComputerName ps-srvr01
Enter-PSSession 1

Get-Service -ComputerName ps-srvr01 | Select-Object DisplayName, Status,
@{name="ComputerName";Expression={$_.machinename}} | Out-File c:\files\test2.txt
#******************************************************************************
#************* Script Bloak Begin ********************
dir -Path C:\PowerShellTraining -file -Recurse | Select-Object Name,
@{Name="sizeKB";Expression={[math]::round($_.length/1kb,2)}},
@{Name="Modified";Expression={$_.lastwritetime}},
@{Name="ModifiedAge";Expression={(Get-Date) - $_.lastwritetime}},
@{name="Path";Expression={$_.fullname}},
@{Name="ComputerName";Expression={$env:COMPUTERNAME}}
#************* Script Bloak End ********************








