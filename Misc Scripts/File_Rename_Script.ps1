$path = Read-Host "Directory Path?"

$startnumber = Read-Host "Starting Number?"

$prefix = Read-Host "prefix?"

$suffix = Read-Host "Suffix?"


$path
$startnumber
$prefix
$suffix

Get-ChildItem $path | %{Rename-Item $_ -NewName ($prefix + ‘- 0{0} by ’ + $suffix -f $startnumber++)}

# Get-ChildItem 'C:\scripts\File Rename Scripts\' | %{Rename-Item $_ -NewName (‘Urban Legends - 0{0} by Brandon Thomas.cbr’ -f $nr++)}
