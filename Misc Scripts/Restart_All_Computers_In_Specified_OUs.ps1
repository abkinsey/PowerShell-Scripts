
# Company Name - SCRIPT - POWERSHELL
# NAME: Restart_All_Computers_In_Specified_OUs.ps1
# 
# AUTHOR: Andrew Kinsey
# DATE:  2022/07/17
# EMAIL: 
# 
# COMMENT:  THis script will pull a list of OU's from the $data array and proceed to restart all of the computers
#           within each specified OU.
#
# VERSION HISTORY
# 1.0 2022.07.17 Initial Version.
# 1.1 
#
# TO ADD
# -Add a Function to ...
# -Fix the...
# #############################################################################

#Create array of OU's to use
$Data=
"OU=IT,OU=Test,dc=PSLAB,dc=local",
#"OU=Accounting,OU=Test,dc=PSLAB,dc=local",
"OU=Marketing,OU=Test,dc=PSLAB,dc=local"

#For each of the OU's in $data run the restart all computers.
$data | ForEach-Object {
Get-ADComputer -SearchBase $_ -Filter '*' |
 Select-Object -Exp Name { restart-computer -computername $_.name -force}}

