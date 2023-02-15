# Prompt user for username and flash drive letter
$username = Read-Host "Enter username"
$driveLetter = Read-Host "Enter flash drive letter (e.g. E:)"

# Create a directory with the username
$directoryPath = "C:\Users\abkin\Dropbox\Flash Drive Backups\$username"
New-Item -ItemType Directory -Path $directoryPath

# Copy contents of flash drive to the directory, maintaining directory structure
$sourcePath = "$driveLetter\*"
$destinationPath = "$directoryPath\"
$files = Get-ChildItem -Path $sourcePath -Recurse

# Use a progress bar to show file copy status
$totalFiles = $files.Count
$currentFile = 0
foreach ($file in $files) {
    $currentFile++
    Write-Progress -Activity "Copying files" -Status "Copying $($file.Name) ($currentFile of $totalFiles)" -PercentComplete ($currentFile / $totalFiles * 100)
    Copy-Item $file.FullName -Destination $destinationPath -Recurse -Force
}

Write-Host "File copy complete!"