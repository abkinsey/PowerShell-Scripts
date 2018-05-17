# #############################################################################
# Company Name - SCRIPT - POWERSHELL
# NAME: Add_Users_To_AD_Group.ps1
# 
# AUTHOR: Andrew Kinsey
# DATE:  2018/05/17
# EMAIL: 
# 
# COMMENT:  This script will pull a list of users from a .csv file and add them 
#           to an AD group / Distribution List
#
#
# VERSION HISTORY
# 1.0 2018.05.17 Initial Version.
# #############################################################################

Import-module ActiveDirectory  
Import-CSV "C:\Prod_Scripts\input\users_to_group.csv" | % {  
Add-ADGroupMember -Identity g_xenappusers -Member $_.UserName  
} 