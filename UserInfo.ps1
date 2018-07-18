# #############################################################################
# Company Name - SCRIPT - POWERSHELL
# NAME: UserInfo.ps1
# 
# AUTHOR:  Andrew Kinsey
# DATE:  2018/07/14
# EMAIL: 
# 
# COMMENT:  This script will request a username and then provide the following 
#           information about the user account:
#
#           UserID               
#           Last Logon TimeStamp 
#           Password Last Set    
#           Password Expiry Date 
#           Password Expired     
#           User Locked Out      
#
#           After the information is provided if the account is locked out it
#           will ask whether or not you want to unlock the account.
#
#
# VERSION HISTORY
# 1.0 2018.07.14 Initial Version.
#
# #############################################################################


#Initiate new PSSession to connect to ARDC01
$session = New-PSSession -ComputerName "ServerName or IP Address" #-Credential (Get-Credential)
Invoke-Command $session -Scriptblock { Import-Module ActiveDirectory }
Import-PSSession -Session $session -module ActiveDirectory
Clear



   # @{Name="UserID";Expression={$_.SamAccountName}}
   $username = Read-Host "username?"

    get-aduser $username -properties lastlogon,pwdLastSet,PasswordExpired,LockedOut,"msDS-UserPasswordExpiryTimeComputed" | select @{Name="UserID";Expression={$_.SamAccountName}}, `
    @{Name="Last Logon TimeStamp";Expression={([datetime]::FromFileTime($_.LastLogon))}},`
    @{Name="Password Last Set";Expression={([datetime]::FromFileTime($_.pwdLastSet))}},
    @{Name="Password Expiry Date";Expression={([datetime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed"))}}, `
    @{Name="Password Expired";Expression={$_.PasswordExpired}}, `
    @{Name="User Locked Out";Expression={$_.LockedOut}} 



    $lockout = get-aduser $username -properties lockedout |select lockedout

   if ($lockout.lockedout -eq 'True') {
   $YesOrNo = Read-Host "Do you want to unlock the account?"
    If ($YesOrNo -eq "Y") {
                Unlock-ADAccount $username
                                }ELSE{
                }
        }
   
   
      
   Write-Host "Press any Key to Contine"

    $HOST.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") | OUT-NULL
    $HOST.UI.RawUI.Flushinputbuffer()

    Remove-PSSession *
