$folder="C:\temp2\rename" #target folder containing files
$csv="c:\temp2\files.csv" #path to CSV file

cd ($folder); import-csv ($csv)| foreach {rename-item -path $_.path -newname $_.filename}
