# Prompt user for username and drive letter
$username = Read-Host "Enter username"
$driveLetter = Read-Host "Enter drive letter for flash drive (e.g. D)"

# Construct paths
$sourcePath = "${driveLetter}:\"
$destinationPath = "C:\Temp\Backup\$username\"

$sourcePath
$destinationPath

Pause

# Create directory for user
New-Item -ItemType Directory -Path $destinationPath -Force

# Copy contents of flash drive to user directory
$files = Get-ChildItem -Path $sourcePath -Recurse
$total = $files.Count
$i = 1
foreach ($file in $files) {
    $destinationFile = $file.FullName.Replace($sourcePath, $destinationPath)
    Write-Host "Copying $($file.FullName) to $($destinationFile)"
    Copy-Item -Path $file.FullName -Destination $destinationFile
    $percentComplete = $i / $total * 100
    Write-Progress -Activity "Copying Files" -PercentComplete $percentComplete -Status "Copying $($file.Name)" 
    $i++
}
Pause