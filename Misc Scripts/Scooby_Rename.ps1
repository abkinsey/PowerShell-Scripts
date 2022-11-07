$folder="C:\Temp2\Spawn" #target folder containing files
$csv="c:\temp2\spawn_rename.csv" #path to CSV file

cd ($folder); import-csv ($csv)| foreach {rename-item -path $_.path -newname $_.filename} 
