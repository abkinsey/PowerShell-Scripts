help Format-Table

dir C:\PowerShellTraining\*.dat | Format-Table -Property Fullname, length, lastwritetime

dir C:\PowerShellTraining\*.dat | format-table -property Fullname,Name,
@{Name="Size";Expression={$_.length}},lastwritetime,
@{Name="Age(Days)";Expression = { (Get-Date)-$_.lastwritetime | Select-Object -ExpandProperty TotalDays }}

Get-Vegetable | Format-Table -GroupBy color 