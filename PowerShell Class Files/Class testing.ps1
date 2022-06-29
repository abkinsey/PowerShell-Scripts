help Tee-Object
#Gets help on the Tee-Object command.  Tee-Object will save the command
# output in a file or variable and also sent it down the pipeline

Get-Process | Sort-Object WS -Descending | Select-Object -First 10 | Tee-Object -FilePath C:\PowerShellTraining\proc.txt



