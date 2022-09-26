
[int] $startnumber = Read-Host "Starting Number?"

$prefix = Read-Host "prefix?"

$author = Read-Host "Author?"

Write-Host "1. Hardcover"
Write-Host "2. Trade Paperback"
Write-Host "3. Omnibus"
Write-Host "4. Single Issue (Default)"
[int] $choice = Read-Host "Type of Comic?"

if ($choice -eq '1' -or $choice -eq '2' -or $choice -eq '3') {
    Write-Host "You picked Choice 1, 2 or 3!"
    $choice
}
else {
    Write-Host "You chose poorly!!"
}



