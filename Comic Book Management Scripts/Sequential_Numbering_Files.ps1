# #############################################################################
# Company Name - SCRIPT - POWERSHELL
# NAME: Sequential_Numbering_Files.ps1
# 
# AUTHOR:  
# DATE:  2022/10/16
# EMAIL: 
# 
# COMMENT:  This script will..
#
# VERSION HISTORY
# 1.0 2022.10.16 Initial Version.
# 1.1 2011.06.14 Upgrade with...
#
# TO ADD
# -Add a Function to ...
# -Fix the...
# #############################################################################

<#
powershell_rename_files_numbers

$nr = 1
#>

Dir | %{Rename-Item $_ -NewName (‘MyFile{0}.txt’ -f $nr++)}

<#
Let’s walk through everything in those lines!

$nr = 1

Sets a variable called nr with the value of 1
Dir

is the content of current directory , unless path is specified as –path like so:

Dir -path C:\Users\IrisDaniela\Pictures\Blog| %{Rename-Item $_ -NewName (‘File{0}.txt’ -f $nr++)}

You could also use Get-ChildItem (gci) or ls

|

Pipe will pass the output from the previous function to whatever we call next
% { }

does a foreach
Rename-Item

renames the item
-NewName

is where we define the new name
()

Is used here for grouping since the -NewName expects one input of type string
{0}

is used for formatting as in C# together with
-f
Whatever we define after -f will replace {0}
You can have {0}{1} and so on, just separate the strings after -f with a comma like so: -f “I’m firs”, “I’m second”
++

is an increment operator, and here it will increment the $nr variable

What the line above is saying is:
I want the start number to be one, and for each item in this directory I want to rename the item with a new name that is MyFile{some number}.text
and incrementing the number so we can name the files MyFile1.txt, MyFile2.txt until we have gone through all the items#>