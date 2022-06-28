# #############################################################################################
# Company Name - SCRIPT - POWERSHELL
# NAME: Backup_PowerShell_Scripts.ps1
# 
# AUTHOR: Andrew Kinsey
# DATE:  2016/05/12
# EMAIL: 
# 
# COMMENT:  This script will make nightly backups of all of the production PowerShell Scripts
#           that run on our network and store them in a central location to provide ease of 
#           backups and restores when needed. Once modified this script should be run as a 
#           task on the server that is backing up the files.
#
#
# VERSION HISTORY
# 1.0 2016.05.11 Initial Version.
# 1.1 2016.05.12 Added additional servers to the backup. (Added AREXCH04, AREXCH05, DEXTER
#
# TO ADD
# -Add a Function to ...
# -Fix the...
# ############################################################################################


######################
# Remove old Scripts #
######################

Remove-Item 'c:\Script_Backups' -Force -Recurse

####################
# EXCH01 Scripts #
####################

Copy-Item '\\exch01\c$\Prod_Scripts' C:\Script_Backups\EXCH01\Prod_Scripts -Recurse 
Copy-Item '\\exch01\c$\Scripts' C:\Script_Backups\EXCH01\Scripts -Recurse


####################
# EXCH02 Scripts #
####################

Copy-Item '\\exch02\c$\Prod_Scripts' C:\Script_Backups\EXCH02\Prod_Scripts -Recurse 


####################
# DC01 Scripts   #
####################

Copy-Item '\\dc01\c$\Prod_Scripts' C:\Script_Backups\DC01\Prod_Scripts -Recurse 
Copy-Item '\\dc01\c$\More_Scripts' C:\Script_Backups\DC01\More_Scripts -Recurse
Copy-Item '\\dc01\c$\Temp' C:\Script_Backups\DC01\Temp -Recurse


####################
# DC02 Scripts   #
####################

Copy-Item '\\dc02\c$\Prod_Scripts' C:\Script_Backups\DC02\Prod_Scripts -Recurse 
Copy-Item '\\dc02\c$\Temp' C:\Script_Backups\DC02\Temp -Recurse
