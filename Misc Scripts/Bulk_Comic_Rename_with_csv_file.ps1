# #############################################################################
# Company Name - Bulk Comic Rename with csv file.ps1 - POWERSHELL
# NAME: Bulk_Comic_Rename_with_csv_file.ps1
# 
# AUTHOR:  Andrew Kinsey
# DATE:  2022/11/07
# EMAIL: 
# 
# COMMENT:  This script will use a .csv file to rename a directory of comic book
#           files.  The .csv file will be populated with 2 colums.  the path column
#           provides the current file names of each of the files.  The filename 
#           column provides the new filename.
#
# Sample .csv file
#
#                           spawn_rename.csv
#path	                                                    filename			
#C:\temp2\spawn\Spawn 001(1992)(Digital)(TLK-EMPIRE-HD).cbr	Spawn - 01 by Todd McFarlane.cbr			
#C:\temp2\spawn\Spawn 002(1992)(Digital)(TLK-EMPIRE-HD).cbr	Spawn - 02 by Todd McFarlane.cbr			
#C:\temp2\spawn\Spawn 003(1992)(Digital)(TLK-EMPIRE-HD).cbr	Spawn - 03 by Todd McFarlane.cbr			
#
#
# VERSION HISTORY
# 1.0 2022.11.07 Initial Version.
# 1.1 2011.06.14 Upgrade with...
#
# TO ADD
# -Add a Function to ...
# -Fix the...
# #############################################################################

$folder="C:\Temp2\Spawn" #target folder containing files
$csv="c:\temp2\spawn_rename.csv" #path to CSV file

cd ($folder); import-csv ($csv)| foreach {rename-item -path $_.path -newname $_.filename} 

