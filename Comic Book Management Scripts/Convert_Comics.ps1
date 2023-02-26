# #############################################################################
# Company Name - Rename .CBZ Files - POWERSHELL
# NAME: rename-cbz.ps1
# 
# AUTHOR:  Andrew Kinsey
# DATE:  2022/12/27
# EMAIL: 
# 
# COMMENT:  This script will rename all .cbz files to .zip files in a current
#           directory.
#
# VERSION HISTORY
# 1.0 2022.12.27 Initial Version.
# 
# TO ADD
# -Add a Function to ...
# -Fix the...
# #############################################################################


Get-ChildItem | rename-item -NewName {$_.name -replace ".cbz",".zip"}
Start-Process "C:\Program Files (x86)\WinRAR\WinRAR.exe"

Get-ChildItem *.zip
Pause

Get-ChildItem | rename-item -NewName {$_.name -replace ".rar",".cbr"}

Pause
