# ##########################################################################################
# Company Name - SCRIPT - POWERSHELL
# NAME: Change_Department.ps1
# 
# AUTHOR:  Andrew Kinsey
# DATE:  2018/05/14
# EMAIL: 
# 
# COMMENT:  This script will change the department name for a list of users 
#           which is specified in the department_change.csv file.
#
#           The .csv file needs to have 2 columns with the headers departmnet and username
#
# VERSION HISTORY
# 1.0 2018.05.14 Initial Version.
#
# #########################################################################################


#Define path to .csv file
$ImportFile = "C:\Prod_Scripts\input\department_change.csv"

#Import Users from $to be moved into an array called $userobjects 
$userobjects = Import-CSV $ImportFile


ForEach ( $userobject in $userobjects ) {
 #Assign the content to variables
 $FileUsername = $userobject.username
 $FileDepartment = $userobject.department
 $FileManager = $userobject.manager
 #$FileAddress = $userobject.address
 #$FilePostalCode = $userobject.postalcode
 #$FilePhoneNumber = $userobject.phone



  Set-ADUser "$FileUsername" -Replace @{department="$FileDepartment"}
  Set-ADUser "$FileUsername" -Replace @{department="$FileManager"}
  }

