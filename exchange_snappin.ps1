# #######################################################################################
# Company Name - SCRIPT - POWERSHELL
# NAME: exchange_snappin.ps1
# 
# AUTHOR:  Andrew Kinsey
# DATE:  2016/03/14
# EMAIL: 
# 
# COMMENT:  This script will load the Exchange modules in PowerShell.  This
#           code can be placed in another script in order to pre-load the exchange
#           environment before running commands that work with the exchange envoroment.
#
# VERSION HISTORY
# 1.0 2011.05.25 Initial Version.
# 1.1 2011.06.14 Upgrade with...
#
# 
# #######################################################################################




if ((get-pssnapin |% {$_.name}) -notcontains "Microsoft.Exchange.Management.PowerShell.E2010"){

. 'C:\Program Files\Microsoft\Exchange Server\V14\bin\RemoteExchange.ps1'

Connect-ExchangeServer -auto

}