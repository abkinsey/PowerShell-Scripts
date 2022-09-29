# #############################################################################
# Company Name - SCRIPT - POWERSHELL
# NAME: Comicbook_Rename_Script.ps1
# 
# AUTHOR:  Andrew Kinsey
# DATE:  2022/09/26
# EMAIL: 
# 
# COMMENT:  This script will rename all files in a directory with sequential numbering. 
#           The following information will be requested prior to renaming the files.
#               1. Path - The directory containing the files to be renamed (NOTE: It will rename all files in the path specified)
#               2. Starting Number - It will use this as the first number when renaming the files
#               3. Prefix - filename to use prior to the number
#               4. Author - Writers name (shows after the number)
#               5. Type - Type of comic (Single, Trade, Hardcover, Omnibus)
#
#               The file name will look like this after the rename: Amazing Spider-Man 02 by Zeb Wells.cbr
#
# VERSION HISTORY
# 1.0 2018.04.25 Initial Version.
# 
#
# TO ADD
# -Add a Function to ...
# -Fix the...
# #############################################################################


$path = Read-Host "Enter Path to working directory"

[int] $startnumber = Read-Host "Starting Number?"

$prefix = Read-Host "prefix?"

$author = Read-Host "Author?"

Write-Host "`n1. Hardcover"
Write-Host "2. Trade Paperback"
Write-Host "3. Omnibus"
Write-Host "4. Single Issue (Default)"
[int] $choice = Read-Host "Type of Comic?"

$choice

if ($choice -eq '1') { $type = "HC" }
    elseif ($choice -eq '2') {$type = "TP"}
    elseif ($choice -eq '3') {$type = "Omnibus" }
    else { $type = "0" }

if ($choice -eq '1' -or $choice -eq '2' -or $choice -eq '3') {
    Write-Host "You picked Choice 1, 2 or 3!"
    $Type
    Get-ChildItem $path | %{Rename-Item $_.FullName -NewName ($prefix + ‘ - 0{0} by ’ -f $startnumber++ + $author + ‘ - ’ + $type +$_.extension)}
}
else {
    Write-Host "You chose poorly!!"
    $type
    Get-ChildItem $path | %{Rename-Item $_.FullName -NewName ($prefix + ‘ - 0{0} by ’ -f $startnumber++ + $author +$_.extension)}
}

$path

Pause 50
