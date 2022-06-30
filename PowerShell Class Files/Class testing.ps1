help Restart-Service -Parameter name
#Gets help on the name parameter of Restart-Service

'bits','winrm' | Restart-Service -PassThru
#This will pass both the bits and winrm services to Restart-Service and 
#with -PassThru it will display results on the screen

help Restart-Service -Parameter inputobject
#Gets help on the inputobject parameter of Restart-Service

Get-Service winrm | Restart-Service -PassThru
#This will get the winrm service and pass it through the pipeline to Restart-Service
# and display results on the screen

Get-Service winrm, bits  | Restart-Service -PassThru
#This will pull both the winrm and bits services and pass them through the pipeline
# to Restart-Service and display the results on the screen

Trace-Command -Name ParameterBinding -Expression {Get-Service winrm | Restart-Service} -PSHost


help Test-NetConnection -Parameter computername
#This will get help on the computername parameter of Test-NetConnection

get-content C:\PowerShellTraining\machines.txt
#This will display a list of machines specified in the machines.txt text file to the screen

Get-Content C:\PowerShellTraining\machines.txt | Test-NetConnection -InformationLevel Detailed
#This will get a list of machines from the machines.txt file and pipe them to Test-NetConnection. Test-NetConnection
#will display detailed results for each machine. The information level specification is not required

help Test-NetConnection -Parameter computername
#This will get help on the computername parameter of Test-NetConnection

help Test-NetConnection -Parameter port
#This will get help on the port parameter of Test-NetConnection

import-csv C:\PowerShellTraining\computerdata.csv
#This will display the data in the computerdata.csv on the screen

import-csv C:\PowerShellTraining\computerdata.csv | Test-NetConnection
#This will import the computerdata.csv file and pipe it to Test-NetConnection and the results 
#will be displayed on the screen

#****** Help Files to read
help about_Pipelines
help about_Parameters







