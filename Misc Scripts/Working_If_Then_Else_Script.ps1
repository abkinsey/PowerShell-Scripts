


Write-Host "1. Hardcover"
Write-Host "2. Trade Paperback"
Write-Host "3. Omnibus"
Write-Host "4. Single Issue (Default)"
[int] $choice = Read-Host "Type of Comic?"

if ($choice -eq '1' -or $choice -eq '2' -or $choice -eq '3') {
    Write-Host "You picked Choice 1, 2 or 3!"
    $choice
}
<# elseif ($choice -eq 2) {
    Write-Host "You picked Choice 2!"
}
elseif ($choice -eq 3) {
    Write-Host "You picked Choice 3!"
} #>
else {
    Write-Host "You chose poorly!!"
}


