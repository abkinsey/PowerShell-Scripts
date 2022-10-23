#Get-ChildItem -Path \\Mac\Home\Desktop\Test | Rename-Item -NewName { $_.Name -replace '\.','-b.' }

#Get-ChildItem -Path \\Mac\Home\Desktop\Test | Rename-Item -NewName { $_.Name -replace '\.',' James Bond.' }

Get-ChildItem \\Mac\Home\Desktop\Test | select name |export-csv \\Mac\Home\Desktop\test.csv

Import-Csv \\Mac\Home\Desktop\test.csv | 
