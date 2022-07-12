$net = new-object -ComObject WScript.Network
$net.MapNetworkDrive("z:", "\\romeobox\files", $false, "domain\user", "password")

explorer.exe z:\


