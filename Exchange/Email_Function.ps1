# #############################################################################
# Company Name - SCRIPT - POWERSHELL
# NAME: Email_Function.ps1
# 
# AUTHOR: Andrew Kinsey 
# DATE:  2018/05/01
# EMAIL: 
# 
# COMMENT:  This script can used as a function or inserted into a script to 
#           email information or alrtts.
#
# VERSION HISTORY
# 1.0 2018.05.01 Initial Version.
#
# #############################################################################


#Email results to specified admins and include the names and results of turning Outlook Anywhere 

$smtpServer = “Exchange_Server/ip address”
$msg = new-object Net.Mail.MailMessage
$smtp = new-object Net.Mail.SmtpClient($smtpServer)
$msg.From = “fromuser@domain.com”
$msg.ReplyTo = “fromuser@domain.com”
$msg.To.Add(“touser@domain.com") #use , to add multiple recipients
$msg.subject = 'PUT SUBJECT IN HERE'
$msg.body = (Get-Content $file | Out-String )
$smtp.Send($msg)


$msg.Dispose(); 