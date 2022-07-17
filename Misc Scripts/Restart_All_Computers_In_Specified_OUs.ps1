
# Company Name - SCRIPT - POWERSHELL
# NAME: Restart_All_Computers_In_Specified_OUs.ps1
# 
# AUTHOR: Andrew Kinsey
# DATE:  2022/07/17
# EMAIL: 
# 
# COMMENT:  This script will....
#
# VERSION HISTORY
# 1.0 2011.05.25 Initial Version.
# 1.1 2011.06.14 Upgrade with...
#
# TO ADD
# -Add a Function to ...
# -Fix the...
# #############################################################################



# Restart Computers in multiple OU's

#Create array of OU's to use
$Data=
"OU=IT,OU=Test,dc=PSLAB,dc=local",
#"OU=Accounting,OU=Test,dc=PSLAB,dc=local",
"OU=Marketing,OU=Test,dc=PSLAB,dc=local"

#For each of the OU's in $data run the restart all computers.
$data | ForEach-Object {
Get-ADComputer -SearchBase $_ -Filter '*' |
 Select-Object -Exp Name { restart-computer -computername $_.name -force}}

