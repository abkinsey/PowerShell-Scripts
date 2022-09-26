#$path = Read-Host "Directory Path?"

[int] $startnumber = Read-Host "Starting Number?"

$prefix = Read-Host "prefix?"

$suffix = Read-Host "Suffix?"

$author = Read-Host "Author?"

$type = Read-Host "Type of Comic (TP, HC, Omnibus)?"


Get-ChildItem 'C:\Users\abkin\Desktop\Rename\' | %{Rename-Item $_ -NewName ($prefix + ‘ - 0{0} by ’ -f $startnumber++ + $author + ‘ - ’ + $type +$_.extension)}

