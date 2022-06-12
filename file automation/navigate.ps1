# enviroment preparation

Set-Location "C:\dev\06\powershell\pwSql\file automation\playground"
Remove-Item .\* -Recurse -Force # empty folder
1..5| ForEach-Object {New-Item -Path . -Name "$("file" + "$_").txt" -ItemType "file"} ## creation of 5 text file 

# Start-Process . ## using relative path
# Start-Process C:\dev\06\powershell\pwSql\file automation\playground ## using absolute path

# Resolve-Path .\file1.txt
# Resolve-Path .\file*.txt

################### Join path ***************************
# #1. combine a path with child path
# Join-Path -Path "path" -childPath "childPath"
# #2. combine path that already contains directory seperators
# Join-Path -Path "path\" -childPath "childPath"
# #3 display file and folders by joining a path with child path
# Join-Path -Path "C:\dev\06\powershell\pwSql\file automation\playground" "childPath" -Resolve
# #4 use join-path with powershell registry provider
# join-path -Path "HKLM:\SYSTEM" -ChildPath *ControlSet* -Resolve
# #5 combine mutliple path with a child path
# Join-Path -Path C: d: -ChildPath NewFolder


################### Split path ***************************

Split-Path -Path 'C:\dev\06\powershell\pwSql\file automation\playground\file1.txt' -Parent
Split-Path -Path 'C:\dev\06\powershell\pwSql\file automation\playground\file1.txt' 

## leaf
Split-Path -Path 'C:\dev\06\powershell\pwSql\file automation\playground\file1.txt' -Leaf
Split-Path -Path 'C:\dev\06\powershell\pwSql\file automation\playground' -Leaf

## topmost file /folder name
Split-Path -Path ".\*.txt" -Leaf ## without resolve parameter
Split-Path -Path ".\*.txt" -Leaf -Resolve

Split-Path -Path ".\file1.txt" ## without resolve parameter
Split-Path -Path ".\file1.txt" -Resolve

## Qualifier
Split-Path -Path 'C:\dev\06\powershell\pwSql\file automation\playground\file1.txt' -Qualifier ##drive
Split-Path -Path 'C:\dev\06\powershell\pwSql\file automation\playground\file1.txt' -NoQualifier ##without drive

## isabsolute
Split-Path -Path ".\file1.txt" -IsAbsolute
Split-Path -Path "C:\dev\06\powershell\pwSql\file automation\playground\file1.txt" -IsAbsolute

################### Test path ***************************

Test-Path -Path .\*file*.txt
Test-Path -Path .\*file*.txt -IsValid

Test-Path -Path .\*.txt 
Test-Path -Path .\* -Exclude *.txt 
Test-Path -Path .\* -Include *.txt 
Test-Path -Path .\* -Filter *.txt 

Test-Path -Path .\*.log 

Test-Path -Path .\* -PathType Leaf
Test-Path -Path .\new* -PathType Container
Test-Path -Path .\* -PathType any   

Get-ChildItem .\file1.txt|Format-List name, creationtime
Test-Path -Path .\file1.txt -NewerThan 'July 16,2000'
Test-Path -Path .\file1.txt -NewerThan 'July 16,2030'
Test-Path -Path .\file1.txt -OlderThan 'July 16,2020'
Test-Path -Path .\file1.txt -OlderThan 'July 16,2030'

Convert-Path .
Convert-Path HKLM:\SOFTWARE\Microsoft

################### working location ***************************

Get-Location
pwd ## alais
gl  ##alais

Set-Location -Path 'C:\dev\06\powershell\pwSql\file automation\playground'
Pop-Location


