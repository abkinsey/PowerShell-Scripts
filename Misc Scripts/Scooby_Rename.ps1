#Define path to .csv file
$ImportFile = "\\Mac\Home\Desktop\Scooby-Doo Rename.xlsx"

#Import Users from $to be moved into an array called $userobjects 
$userobjects = Import-CSV $ImportFile


ForEach ( $userobject in $userobjects ) {
 #Assign the content to variables
 $FileUsername = $userobject.username
 $FileDepartment = $userobject.department
 $FileManager = $userobject.manager
 #$FileAddress = $userobject.address
 #$FilePostalCode = $userobject.postalcode
 #$FilePhoneNumber = $userobject.phone

}
