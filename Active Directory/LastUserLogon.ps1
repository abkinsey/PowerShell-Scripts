# #######################################################################################
# Company Name - SCRIPT - POWERSHELL
# NAME: LastUserLogon.ps1
# 
# AUTHOR:  Andrew Kinsey
# DATE:  2018/04/23
# EMAIL: 
# 
# COMMENT:  This script will show the last time a user logged into the domain.
#
# VERSION HISTORY
# 1.0 2018.04.23 Initial Version.
# 1.1 2018.04.24 Added user input to request username to be checked
#
# 
# #######################################################################################


Import-Module ActiveDirectory

function Get-ADUserLastLogon([string]$userName)
{
$dcs = Get-ADDomainController -Filter {Name -like "*"}
$time = 0
foreach($dc in $dcs)
{
$hostname = $dc.HostName
$user = Get-ADUser $userName | Get-ADObject -Properties lastLogon
if($user.LastLogon -gt $time)
{
$time = $user.LastLogon
}
}
$dt = [DateTime]::FromFileTime($time)
Write-Host `n$username "last logged on at:" $dt }

$userName = Read-Host "Username?"

Get-ADUserLastLogon -UserName $userName