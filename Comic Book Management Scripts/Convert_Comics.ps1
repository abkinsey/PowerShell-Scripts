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

#Renames all .cbz files in the current directory to *.zip
Get-ChildItem | rename-item -NewName {$_.name -replace ".cbz",".zip"}

#List out all of the .zip files to be converted
Get-ChildItem *.zip

#Starts WinRar application to start the conversion
Start-Process "C:\Program Files (x86)\WinRAR\WinRAR.exe"

#Pauses unil the files are converted with WinRar
Pause

#Renames the converted .rar files to the .cbr cominc book reader format
Get-ChildItem | rename-item -NewName {$_.name -replace ".rar",".cbr"}

Pause
