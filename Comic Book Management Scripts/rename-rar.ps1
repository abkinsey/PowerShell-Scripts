# #############################################################################
# Company Name - Rename .RAR Files - POWERSHELL
# NAME: rename-rar.ps1
# 
# AUTHOR:  Andrew Kinsey
# DATE:  2022/12/27
# EMAIL: 
# 
# COMMENT:  This script will rename all .rar files to .cbr files in a current
#           directory.
#
# VERSION HISTORY
# 1.0 2022.12.27 Initial Version.
# 
# TO ADD
# -Add a Function to ...
# -Fix the...
# #############################################################################


Get-ChildItem | rename-item -NewName {$_.name -replace ".rar",".cbr"}
