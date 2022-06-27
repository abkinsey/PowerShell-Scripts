get-command -verb out

help Out-File

Get-Service | Sort-Object status,name

Get-Service | Sort-Object status,name | Out-File C:\PowerShellTraining\services.txt

notepad C:\PowerShellTraining\services.txt

Get-Service | Sort-Object status,name | Out-File C:\PowerShellTraining\services.txt -NoClobber
#no clobber prevents you from writing to a file that already exists

Get-Date | Out-File C:\PowerShellTraining\services.txt -Append
Get-Service | Sort-Object Status,Name | Out-File C:\PowerShellTraining\services.txt -Append

help Out-GridView

Get-Service | Out-GridView

Get-Service | Where-Object status -EQ 'running' | Out-GridView -PassThru

#************* Script Block Begin  **************
get-service | Where-Object Status -eq 'running' |
Out-GridView -Title "Select Services to Restart"
ForEach-Object {
    Write-Host "Restarting $($_.Display)" -ForegroundColor Green
    $_ | Restart-Service -PassThru -Force
}  
#************* Script Block End  **************

help Out-Printer

Get-EventLog system -Newest 10 -EntryType error | Select-Object Timegenerated, source, message | Out-Printer "Microsoft Print to pdf"

invoke-item 'C:\PowerShellTraining\testing out-printer.pdf'

#************* Script Block Begin  **************
Get-EventLog system -Newest 50 -EntryType error | 
Select-Object Timegenerated, source, message | 
Format-List |
Out-Printer "Microsoft Print to pdf"
#************* Script Block End  **************

