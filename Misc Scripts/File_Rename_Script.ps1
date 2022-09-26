#$path = Read-Host "Directory Path?"

[int] $startnumber = Read-Host "Starting Number?"

$prefix = Read-Host "prefix?"

$author = Read-Host "Author?"

[] $type = Read-Host "Type of Comic ( (1)TP, HC, Omnibus)?"

# Get-ChildItem 'C:\Users\abkin\Desktop\Rename\' | %{Rename-Item $_ -NewName ($prefix + ‘ - 0{0} by ’ -f $startnumber++ + $author + ‘ - ’ + $type +$_.extension)}


if ($type -eq "HC" -or $type -eq "Omnibus" -or $type -eq "TPB") {
    Get-ChildItem 'C:\Users\abkin\Desktop\Rename\' | %{Rename-Item $_ -NewName ($prefix + ‘ - 0{0} by ’ -f $startnumber++ + $author + ‘ - ’ + $type +$_.extension)}
}
    else {
           Get-ChildItem 'C:\Users\abkin\Desktop\Rename\' | %{Rename-Item $_ -NewName ($prefix + ‘ - 0{0} by ’ -f $startnumber++ + $author +$_.extension)}
    }

