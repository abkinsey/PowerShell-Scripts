# #############################################################################
# Company Name - SCRIPT - POWERSHELL
# NAME: add_supervisor.ps1
# 
# AUTHOR:  Andrew Kinsey
# DATE:  2018/04/25
# EMAIL: 
# 
# COMMENT:  This script will pull a list of users and assign the supervisor to
#            user account.
#
# VERSION HISTORY
# 1.0 2018.04.25 Initial Version.
# 
#
# TO ADD
# -Add a Function to ...
# -Fix the...
# #############################################################################

Import-Module ActiveDirectory
$Users = Import-csv 'C:\Prod_Scripts\input\Users to Import.csv'
foreach ($User in  $Users)
{
Set-ADUser $User.SamAccountName -Manager $User.Newmanager
}


