
# ###########################################################################################
# Company Name - SCRIPT - POWERSHELL
# NAME: CheckFreeSpace.v3.ps1
# 
# AUTHOR: Victor Ashiedu
# EDITOR: Andrew Kinsey
# DATE:  2016/05/16
# EMAIL: akinsey@allrisks.com
# 
# COMMENT:  This script will pull a list of servers from a text file and calculate
#           the free disk space on each disk.  It will then create a .csv file
#           that inclues a list of servers and drives that have less than 20% 
#           free disk space.  Once the .csv file is put together it will email
#           this information to a specified individual or group.
#
# CONFIGURATION:
#
#           1. Line 40 - Change for the number of reports to save
#           2. Line 45 - Specify the patch for the Disk Reports
#           3. Line 51 - Specify the Date format
#           4. Line 57 - Specify path and file name for the list of servers
#           5. Line 96 - Specify path and file name for the .csv file 
#           6. Line 101 - SPecify the path and filename to be attached to the pending email
#           7. Lines 105-110 - Specify email information
#
#
# VERSION HISTORY
# 1.0 2016.05.16 Initial Version.
# 1.1 2018.07.10 Configured Changes to the email section.
#
# ##########################################################################################



# Set-ExecutionPolicy Unrestricted -Force

Set-ExecutionPolicy Unrestricted -Force

#delete reports older than 7 days

$OldReports = (Get-Date).AddDays(-7)

#edit the line below to the location you store your disk reports# It might also
#be stored on a local file system for example, D:\ServerStorageReport\DiskReport

Get-ChildItem c:\logs\DiskReports\*.* | `
Where-Object { $_.LastWriteTime -le $OldReports} | `
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue  

#Create variable for log date

$LogDate = get-date -f yyyy-MM-dd


#Define location of text file containing your servers. It might also
#be stored on a local file system for example, D:\ServerStorageReport\DiskReport

$File = Get-Content -Path c:\Servers.txt

#Define admin account variable (Uncommented it and the line in Get-WmiObject
#Line 44 below is commented out because I run this script via task schedule.
#If you wish to run this script manually, please uncomment line 44.

#$RunAccount = get-Credential  

# $DiskReport = ForEach ($Servernames in ($File)) 

#the disk $DiskReport variable checks all servers returned by the $File variable (line 37)

$DiskReport = ForEach ($Servernames in ($File)) 

{Get-WmiObject win32_logicaldisk <#-Credential $RunAccount#> `
-ComputerName $Servernames -Filter "Drivetype=3" `
-ErrorAction SilentlyContinue | 

#return only disks with
#free space less  
#than or equal to 0.1 (10%)

Where-Object {   ($_.freespace/$_.size) -le '0.20'}

} 


#create reports

$DiskReport | 

Select-Object @{Label = "Server Name";Expression = {$_.SystemName}},
@{Label = "Drive Letter";Expression = {$_.DeviceID}},
@{Label = "Total Capacity (GB)";Expression = {"{0:N1}" -f( $_.Size / 1gb)}},
@{Label = "Free Space (GB)";Expression = {"{0:N1}" -f( $_.Freespace / 1gb ) }},
@{Label = 'Free Space (%)'; Expression = {"{0:P0}" -f ($_.freespace/$_.size)}} |

#Export report to CSV file (Disk Report)

Export-Csv -path "c:\logs\DiskReports\DiskReport_$logDate.csv" -NoTypeInformation



# Attach and send CSV report (Most recent report will be attached)
$att = Get-ChildItem c:\logs\DiskReports\*.* | sort LastWriteTime | select -last 1


$fromaddress = "admin@domain.com" 
$toaddress = "user@domain.com" 
$Subject = "Weekly Server Storage Report" 
$body = "Attached is Weekly Server Storage Report. The scipt has been amended to return only servers with free disk space less than or equal to 20%. All reports are located in \\ardc01\c$\Prod_Scripts\output\DiskReports\, but the most recent is sent weekly"
$attachment = "C:\servers.txt"
$smtpserver = "xxx.xxx.xxx.xxx" 
#Use the variables in the script:

$message = new-object System.Net.Mail.MailMessage 
$message.From = $fromaddress 
$message.To.Add($toaddress)
$message.IsBodyHtml = $True 
$message.Subject = $Subject 
$attach = new-object Net.Mail.Attachment($att) 
$message.Attachments.Add($attach) 
$message.body = $body 
$smtp = new-object Net.Mail.SmtpClient($smtpserver) 
$smtp.Send($message)

