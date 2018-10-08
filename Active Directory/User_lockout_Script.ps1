# #############################################################################
# Company Name - SCRIPT - POWERSHELL
# NAME: User_lockout_Script.ps1
# 
# AUTHOR:  Andrew Kinsey
# DATE:  2016/03/14
# EMAIL: 
# 
# COMMENT:  This script will Emails admins when a user account is locked out.
#
# VERSION HISTORY
# 1.0 2016.03.14 Initial Version.
# 
# #############################################################################


$Report= "c:\Prod_Scripts\output\html.html" 
 
$AccountLockOutEvent=Get-EventLog -LogName "Security" -InstanceID 4740 -Newest 1
$LockedAccount = $($AccountLockOutEvent.ReplacementStrings[0])


$HTML=@" 
<title>Account locked out Report</title> 
<!--mce:0--> 
"@ 
 
$Account_Name = @{n='Account name';e={$_.ReplacementStrings[-1]}} 
$Account_domain = @{n='Account Domain';e={$_.ReplacementStrings[-2]}} 
$Caller_Computer_Name = @{n='Caller Computer Name';e={$_.ReplacementStrings[-1]}} 
 
             
$event= Get-EventLog -LogName Security -InstanceId 4740 -Newest 1 | 
   Select TimeGenerated,ReplacementStrings,"Account Name","Account Domain","Caller Computer Name" | 
   % {
    
     New-Object PSObject -Property @{ 
      "Account name" = $_.ReplacementStrings[-7] 
      "Account Domain" = $_.ReplacementStrings[5] 
      "Caller Computer Name" = $_.ReplacementStrings[1] 
      Date = $_.TimeGenerated 
    } 
   } 


$a = "<style>"
$a = $a + "BODY{}"
$a = $a + "TABLE{border-width: 1px;border-style: solid;border-color: black;border-collapse: collapse;}"
$a = $a + "TH{border-width: 1px;padding: 3px;border-style: solid;border-color: black}"
$a = $a + "TD{border-width: 1px;padding: 3px;border-style: solid;border-color: black}"
$a = $a + "</style>"


   
  $event | ConvertTo-Html -Property "Account name","  ", "Account Domain",  "Caller Computer Name",Date -head $a -body  "<H2> User is locked in the Active Directory</H2>"| 
     Out-File $Report -Append 
 
$MailBody= Get-Content $Report 
$MailSubject= "User Account locked out:  $LockedAccount" 
$SmtpClient = New-Object system.net.mail.smtpClient 
$SmtpClient.host = "mailserver.domain.com" 
$MailMessage = New-Object system.net.mail.mailmessage 
$MailMessage.from = "sender@domain.com" 
$MailMessage.To.add("user1@domain.com,user2@domain.com") 
$MailMessage.Subject = $MailSubject 
$MailMessage.IsBodyHtml = 1 
$MailMessage.Body = $MailBody 
$SmtpClient.Send($MailMessage) 
 

del c:\Prod_Scripts\output\html.html