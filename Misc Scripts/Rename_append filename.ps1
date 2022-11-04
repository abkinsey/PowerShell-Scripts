
 #Get-ChildItem -Path C:\Users\abkin\Desktop\test *.* | foreach { rename-item $_.Fullname $_.Fullname.Replace("(","") }

 Get-ChildItem -Path C:\Users\abkin\Desktop\test | rename-item -NewName {$_.name.substring(0,$_.BaseName.length-6) + $_.Extension -replace "-"," "}