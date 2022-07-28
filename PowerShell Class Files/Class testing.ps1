help Format-Table | more
#formats the output as a table


Get-ChildItem C:\PowerShellTraining\*.dat | Format-Table -Property Fullname, length, lastwritetime
#This will get a list of all of the .dat files in the specified directory.  It will list them in a table view
#and only display the full name, length and the last write time.

Get-ChildItem C:\PowerShellTraining\*.dat | format-table -property Fullname,Name,
@{Name="Size";Expression={$_.length}},lastwritetime,
@{Name="Age(Days)";Expression = { (Get-Date)-$_.lastwritetime | Select-Object -ExpandProperty TotalDays }}
#This will get a list of .dat files from the specified diretory, format it as a table, and display the Fullname,
#The name, and use curtom objects for show "size" and Age in days"

Get-Vegetable | Format-Table -GroupBy color 
#This will get all the vegetables group them by object and show them in a table grouping them by color and displaying
#only the UPS, Count, Name, and Isroot fields.
#NOTE This will now sort correctly by group because it is processing the information as it is coming through the pipeline
#     The sort needs to be run first in order to make this work correctly

Get-Vegetable | Sort-Object Color | Format-Table -GroupBy color -property UPC, Count, Name, ISroot
#This will get a list of vegetables and now since the sort comes first it will properly group all the vegetables by color
#as requested and will display the output in table form specifying just the properties UPC, Count, Name, ISRoot

dir C:\PowerShellTraining -File -Recurse | Group-Object Extension | Select-Object Count, Name,
@{Name="TotalKB";Expression={$_.Group | Measure-Object length -Sum | Select-Object -ExpandProperty sum}} |
Format-Table -GroupBy Name -Property Count, TotalKB
#This will do a directory of the specified path and all subdirectories. It will group the results by extension and selects
# the Count and Name object and also specifies a custom object for TotalKB.  All of this information will be presented in
#a table format and it groups by Name and shows the Count and TotalKB for each















