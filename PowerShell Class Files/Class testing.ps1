$logs = Get-EventLog -List | Select-Object LogDisplayName |
Out-GridView -Title "Select one of more logs" -OutputMode Multiple

$count = 1, 10, 25, 50 | Out-GridView  -Title "How Many Entries" -OutputMode Single
$printer = Get-Printer | Select-Object Name | Out-GridView -Title "Select a Printer" -OutputMode Single

$logs | ForEach-Object {
    $_.LogDisplayName
    Get-EventLog -LogName $_.LogDisplayName -Newest $count -EntryType  Error |
    Select-Object     Timegenerated, Source, Message | Format-List |
    Out-Printer $printer.Name
}

