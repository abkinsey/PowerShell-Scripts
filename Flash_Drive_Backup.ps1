<#

$name = Read-Host "Enter a name for the directory"
$src = Read-Host "Enter the source path (e.g. F:\)"
$dst = "C:\Users\andrew\Dropbox\Flash Drive Backups\$name"

New-Item -ItemType Directory -Path $dst
Copy-Item "$src\*" -Destination $dst -Recurse

#>


$name = Read-Host "Enter a name for the directory"
$src = Read-Host "Enter the source path (e.g. F:\)"
$dst = "C:\Users\andrew\Dropbox\Flash Drive Backups\$name"

New-Item -ItemType Directory -Path $dst

Get-ChildItem $src -Recurse | ForEach-Object {
    Write-Output "Copying $($_.FullName) to $dst\$($_.Name)"
    Copy-Item $_.FullName -Destination "$dst\$($_.Name)"
}
