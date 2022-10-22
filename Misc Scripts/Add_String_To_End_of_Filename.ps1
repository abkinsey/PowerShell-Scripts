#Get-ChildItem -Path \\Mac\Home\Desktop\Test | Rename-Item -NewName { $_.Name -replace '\.','-b.' }

Get-ChildItem -Path \\Mac\Home\Desktop\Test | Rename-Item -NewName { $_.Name -replace '\.',' James Bond.' }

ddodiag.exe