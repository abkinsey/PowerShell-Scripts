help Tee-Object
#Gets help on the Tee-Object command.  Tee-Object will save the command
# output in a file or variable and also sent it down the pipeline

Get-Process | Sort-Object WS -Descending | Select-Object -First 10 | Tee-Object -FilePath C:\PowerShellTraining\proc.txt
#This will get a list of processes, sort them by WorkingSet in Descending order and then selects the first 10 and pipes the 
#results to Tee-Object which display results on teh screen and also writes them to a text file called proc.txt

Get-Process | Sort-Object WS -Descending | Select-Object -First 10 | Tee-Object -FilePath C:\PowerShellTraining\proc2.txt | Out-Printer
#This will get a list of processes, sort them by WorkingSet in Descending order and then selects the first 10 and pipes the 
#results to Tee-Object which writes them to a text file called proc2.txt and also sends the results to out-printer 





