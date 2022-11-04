﻿# #############################################################################
# Company Name - SCRIPT - POWERSHELL
# NAME: Replace-Renumber_Files.ps1
# 
# AUTHOR:  Andrew Kinsey
# DATE:  2022/10/16
# EMAIL: 
# 
# COMMENT:  This script will....
#
# VERSION HISTORY
# 1.0 2022.10.16 Initial Version.
# 1.1 2011.06.14 Upgrade with...
#
# TO ADD
# -Add a Function to ...
# -Fix the...
# #############################################################################

$nr = 1

Get-ChildItem  "C:\Users\abkin\Dropbox\Comics\! DC Dark Crisis Event\" | %{Rename-Item $_ -NewName (‘0{0}’ -f $nr++ + $($_.Name.Substring($_.Name.IndexOf('-'))))}
