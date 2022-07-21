help Format-Table | more
#formats the output as a table


Get-ChildItem C:\PowerShellTraining\*.dat | Format-Table -Property Fullname, length, lastwritetime

Get-ChildItem C:\PowerShellTraining\*.dat | format-table -property Fullname,Name,
@{Name="Size";Expression={$_.length}},lastwritetime,
@{Name="Age(Days)";Expression = { (Get-Date)-$_.lastwritetime | Select-Object -ExpandProperty TotalDays }}

Get-Vegetable | Format-Table -GroupBy color 

Get-Vegetable | Sort-Object Color | Format-Table -GroupBy color -property UPC, Count, Name, ISroot

dir C:\PowerShellTraining -File -Recurse | Group-Object Extension | Select-Object Count, Name,
@{Name="TotalKB";Expression={$_.Group | Measure-Object length -Sum | Select-Object -ExpandProperty sum}} |
Format-Table -GroupBy Name -Property Count, TotalKB
