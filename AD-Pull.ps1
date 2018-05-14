# #########################################################################################################################
# Company Name - SCRIPT - POWERSHELL
# NAME: AD-Pull.ps1
# 
# AUTHOR: Andrew Kinsey 
# DATE:   2015/07/14
# EMAIL:  
# 
# COMMENT:  THis scirpt is designed to pull a list of users from AD with specific fields
#           in order to update the user contact information on the company intranet.  This script will the do the following: 
#
#           1. Remove the phonedirectory_ad_export.old file from the specified directory spefified in $path
#           2. Rename the current phonedirectory_ad_export.csv file (if it exists) to phonedirectory_ad_export.old
#           3. Pull the list of users from Active Directory and collect the following information for each user: First Name,
#              Last Name, Department, Title, Location, Phone, Email.  This data is exprted to the directory speficied in $path2
#           4. After the .csv file is writen Get-Content is run to pull in the information from the .csv file.  Once the data
#              is retrieved the header row is re-written properly and then the file is re-exported to a new .csv file.
#
# VERSION HISTORY
# 1.0 2015.07.14 Initial Version.
# 1.1 2018.05.11 Cleaned up original version setup variables for filenames.
#
#
# NOTE: You will need to change the values for $path, $path2 and $path3.  Also the search base will need to be specified as well
# 
# ########################################################################################################################


Import-Module ActiveDirectory  

#---------------------------------------------------------------
# Define the filenamespaths of the files involved    
#---------------------------------------------------------------

$path = "\\path\phonedirectory_ad_export.old"
$path2 = "\\path\phonedirectory_ad_export.csv"
$path3 = "c:\Prod_Scripts\output\AD-Users.csv"


#---------------------------------------------------------------
# Check to see if there is a .old file and if so removes it.   
#---------------------------------------------------------------
if(Test-Path -Path $path)
  {
   Write-Host "The File test.old Does Exist"
   Remove-Item $path
   Write-Host "phonedirectory_ad_export.old has been removed"
  }
else
  {
   Write-Host "The File phonedirectory_ad_export.old Does Not Exist"
  }


#---------------------------------------------------------------
# Check to see if the previous .csv file exists and if so rename it to .old
#---------------------------------------------------------------

  if(Test-Path -Path $path2)
  {
   Write-Host "The File phonedirectory_ad_export.csv Does Exist"
   Rename-Item $path2 $path
   Write-Host "phonedirectory_ad_export.csv has been renamed to phonedirectory_ad_export.old"
  }
else
  {
   Write-Host "The File phonedirectory_ad_export.csv Does Not Exist"
  }

 

#----------------------------------------------------------------------------
# Run Get-ADUser to pull a complete list if users from Active Directory gathering specific properties,
# sorting by first name, then last name and finally exporting this information to a .csv file.
#----------------------------------------------------------------------------

Get-ADUser -Filter * -SearchScope OneLevel -SearchBase "OU=Users,DC=Domain,DC=com" -properties * | Select givenName, sn, department, title, physicalDeliveryOfficeName, telephoneNumber, mail | sort givenName,sn | export-csv $path3 -NoTypeInformation



#----------------------------------------------------------------------------
# Use Get-Content to pull in the .csv file and replace the header line with new headers instead.
# Once the headers are replaced, export the finished version to a new .csv file
#----------------------------------------------------------------------------

Get-Content $path3 | Select -skip 1 | ConvertFrom-Csv -Header 'First Name','Last Name','Department','Title','Location','Phone','Email' | Export-csv $path2 -NoTypeInformation


