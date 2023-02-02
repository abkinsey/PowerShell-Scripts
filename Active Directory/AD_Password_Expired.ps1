$username = Read-Host "Enter the username"
$domain = "DomainName" # Replace with the domain name

$user = Get-ADUser $username -Properties PasswordExpired

if ($user.PasswordExpired) {
    Write-Output "$username password has expired."
} else {
    Write-Output "$username password has not expired."
}
Pause
