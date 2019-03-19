# #############################################################################
# Company Name - SCRIPT - POWERSHELL
# NAME: Server_Reboot.ps1
# 
# AUTHOR: Andrew Kinsey 
# DATE:  2019/03/19
# EMAIL: 
# 
# COMMENT:  This script will reboot the local server and send an email to a 
#           group of users informing them of a successful reboot.
#
# VERSION HISTORY
# 1.0 2019.03.19 Initial Version.
#
# #############################################################################

#Get server name
$server = $env:COMPUTERNAME

#Issue server reboot command
Restart-Computer -force


#Email result to specified list of admins

$smtpServer = “arexch03.allrisks.com”
$msg = new-object Net.Mail.MailMessage
$smtp = new-object Net.Mail.SmtpClient($smtpServer)
$msg.From = “admin@allrisks.com”
$msg.ReplyTo = “akinsey@allrisks.com”
$msg.To.Add(“akinsey@allrisks.com,atherres@allrisks.com,mike.cooper@allrisks.com") #use , to add multiple recipients
#$msg.To.Add(“akinsey@allrisks.com") #use , to add multiple recipients
$msg.subject = "Exchange Server -- $server Rebooted"
$msg.body = "$server has completed it's monthly reboot."
$smtp.Send($msg)
$msg.Dispose(); 