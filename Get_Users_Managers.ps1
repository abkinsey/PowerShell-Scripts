# #############################################################################
# Company Name - SCRIPT - POWERSHELL
# NAME: Get_Users_Managers.ps1
# 
# AUTHOR: Andrew Kinsey  
# DATE:  2018/04/25
# EMAIL: 
# 
# COMMENT:  This script will get a list of AD users and their managers. It will
#           export this information to a .csv file.
#
# VERSION HISTORY
# 1.0 2018.04.25 Initial Version.
# 
#
# TO ADD
# -Add a Function to ...
# -Fix the...
# #############################################################################


Get-ADUser -filter * | select UserPrincipalName | Export-Csv c:\Prod_Scripts\Output\users.csv



Import-Csv c:\Prod_Scripts\output\users.csv | ForEach {

    Get-ADUser -Filter "UserPrincipalName -eq '$($_.UserPrincipalName)'" -Properties Manager

} |  Select Name,@{N='Manager';E={(Get-ADUser $_.Manager).Name}} | export-csv c:\prod_scripts\Output\managers.csv