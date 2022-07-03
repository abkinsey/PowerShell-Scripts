Get-Vegetable

Get-Vegetable | Select-Object Name -Unique

Get-Vegetable | Select-Object Name -Unique | Out-File C:\PowerShellTraining\veggies.txt

Get-Vegetable | Select-Object -ExpandProperty Name -Unique

Get-Vegetable | Select-Object -ExpandProperty Name -Unique | Out-File C:\PowerShellTraining\veggies.txt

help Get-Vegetable -Parameter Name

Get-Content C:\PowerShellTraining\veggies.txt | Where-Object {$_ -like "c*"} |Get-Vegetable


