# Creating Custom Objects

Get-Command *-object

## Measure-Object

Get-Process | Get-Member | Measure-Object 
Get-Process | Get-Member -MemberType *property | Measure-Object 

1..10 | Measure -sum -Maximum -Minimum -average

## Select-object
Get-Process | Select-Object -First 5 -Property Cpu, Description, productVersion

## Filter object

Get-Process | Where-Object Path | Select-Object name, path
Get-Service | Where-Object {$_.Status -eq 'stopped'}
Get-Service | Where-Object {$_.Status -eq 'stopped'} | Select-Object name, DisplayName
Get-Service | ? {$_.Status -eq 'stopped'} | Select-Object name, DisplayName

## Select objects that have particular prooperty value , filter operator
Get-Alias where, select

Get-Process | where {$_.ProcessName -match "^p.*"}
Get-Command where -Syntax

Get-Process | where ProcessName  -match "^p.*"
Get-Process | where -Property ProcessName  -match "^p.*"
Get-Process | where -Property ProcessName  -match -Value "^p.*"
## filter object wildchar

Get-module -ListAvailable | where {$_.name -NotLike "microsoft*" -and $_.name -notlike 'ps*'}
## Get-module -ListAvailable | where name -Like "microsoft*" -and $_.name -notlike 'ps*' not working

# Sort
Get-ChildItem C:\dev\06 | Sort-Object
Get-ChildItem C:\dev\06 | Sort-Object -Property Length
Get-ChildItem C:\dev\06\powershell\PowerShellCookbook | Sort-Object -Property Length
Get-ChildItem C:\dev\06\powershell\PowerShellCookbook | Sort-Object -Property Length | select -First 10
Get-ChildItem C:\dev\06\powershell\PowerShellCookbook | Sort-Object -Property Length -Descending | select -First 10

Get-Service | Sort-Object -Property @{
    Expression="status";
    Descending=$true  # note true with $true
}
Get-Service | Sort-Object -Property @{
    Expression="status";
    Descending=$true  # note true with $true
}, @{
    Expression="displayname";
    Descending=$false  # note true with $true
}

## sort-object unique
Get-Content c:\powershell\test.txt | sort-object {[int]$_}
Get-Content c:\powershell\test.txt | sort-object -Property @{
    Expression={$_.CreationTime - $_.LastWriteTime};
    Descending=$false
} | Format-Table CreationTime,LastWriteTime,FullName











