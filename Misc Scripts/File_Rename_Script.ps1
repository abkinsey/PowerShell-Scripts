
[int] $startnumber = Read-Host "Starting Number?"

$prefix = Read-Host "prefix?"

$author = Read-Host "Author?"

Write-Host "`n1. Hardcover"
Write-Host "2. Trade Paperback"
Write-Host "3. Omnibus"
Write-Host "4. Single Issue (Default)"
[int] $choice = Read-Host "Type of Comic?"

$choice

if ($choice -eq '1') { $type = "HC" }
    elseif ($choice -eq '2') {$type = "TPB"}
    elseif ($choice -eq '3') {$type = "Omnibus" }
    else { $type = "0" }

if ($choice -eq '1' -or $choice -eq '2' -or $choice -eq '3') {
    Write-Host "You picked Choice 1, 2 or 3!"
    $Type
    Get-ChildItem 'C:\Users\abkin\Desktop\Rename\' | %{Rename-Item $_ -NewName ($prefix + ‘ - 0{0} by ’ -f $startnumber++ + $author + ‘ - ’ + $type +$_.extension)}
}
else {
    Write-Host "You chose poorly!!"
    $type
    Get-ChildItem 'C:\Users\abkin\Desktop\Rename\' | %{Rename-Item $_ -NewName ($prefix + ‘ - 0{0} by ’ -f $startnumber++ + $author +$_.extension)}
}



