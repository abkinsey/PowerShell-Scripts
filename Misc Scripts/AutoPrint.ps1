# ###############################################################################
#  - SCRIPT - POWERSHELL
# NAME: AutoPrint.ps1
# 
# AUTHOR:  Andrew Kinsey
# DATE:  2018/10/30
# EMAIL: 
# 
# COMMENT:  This script will automatically print all documents from a particular
#           folder.
#
# VERSION HISTORY
# 1.0 2018.10.30 Initial Version.
# 
# ##############################################################################

$orders = "C:\autoprint\"


$items = Get-ChildItem -Path "c:\autoprint\" -Filter "*.*"


foreach ($item in $items) { Start-Process –FilePath $orders\$item –Verb Print -PassThru | %{sleep 5;$_} | kill     }


