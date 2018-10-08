# #############################################################################
# Company Name - SCRIPT - POWERSHELL
# NAME: Remove_Move_Request.ps1
# 
# AUTHOR:  Andrew Kinsey
# DATE:  2017/10/18
# EMAIL: 
# 
# COMMENT:  This script will remove all current move requests whether they are
#           are stuck or not. The MoveStatus options are as follows:
#
#                    Completed
#                    CompletedWithWarning
#                    CompletionInProgress
#                    AutoSuspended
#                    Queued
#                    InProgress
#                    Suspended
#                    Failed
#
#
# VERSION HISTORY
# 1.0 2018.05.11 Initial Version.
# 1.1 
# #############################################################################


#Remove all completed move requests
Get-MoveRequest -MoveStatus Completed | Remove-MoveRequest

#Remove all failed move requests
Get-MoveRequest -MoveStatus Failed | Remove-MoveRequest

