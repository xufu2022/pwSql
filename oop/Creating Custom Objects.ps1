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



# Group

Get-ChildItem $PSHOME
$files=Get-ChildItem $PSHOME

$files | Group-Object -Property Extension -NoElement |Sort-Object Count -Descending

1..20 | Group-Object -Property {$_ % 3}
Get-Process | Group-Object -Property Name -NoElement | Where-Object {$_.count -gt 1}

## group in hasttable

Get-Command get-*, set-* -CommandType cmdlet
Get-Command get-*, set-* -CommandType cmdlet | Group-Object Verb -AsHashTable -AsString

$a=Get-Command get-*, set-* -CommandType cmdlet | Group-Object Verb -AsHashTable -AsString
$a.set

# Get  length of all files in directory

Get-ChildItem $PSHOME | ForEach-Object -Process {
    if (!$_.psiscontainer){
        $_.Name;
        $_.Length/1024;
        ""
    }
}

# Begin/End Block

Get-EventLog -LogName system -newHost 1000

$events | ForEach-Object -Begin{
Get-Date
} -Process {
    Out-Fil -FilePath "C:\dev\06\powershell\events.txt"
    -Append -InputObject $_.message
} -End{Get-Date}

1..2|ForEach-Object {'begin'} {'Process A'}{'Process B'} {'end'}

## Foreach script block

1..2 | ForEach-Object {'begin'}{'Process'}

## Parallel processing
##version 7 only
Get-Command ForEach-Object -Syntax
## the underscore area to represtn t the curretn input object in bock

# $message="output:"
# 1..8 | ForEach-Object -Parallel {
#     "$using: message $_"
#     Start-Sleep 1
# } -ThrottleLimit 4

## Comparing Objects
Compare-Object -ReferenceObject (Get-Content -Path C:\dev\06\powershell\events.txt) 
            -DifferenceObject (Get-Content -Path C:\dev\06\powershell\events1.txt) 

help Compare-Object 
## Comparing Two Sets of Objects

$a = Get-Process
notepad; calc
$b= Get-Process

Compare-Object $a $b
Compare-Object $a $b -ExcludeDifferent
Compare-Object $a $b -PassThru

## Tee object
Get-Process | Out-File -FilePath  C:\dev\06\powershell\events.txt
Get-Content C:\dev\06\powershell\events.txt

Get-Process | Tee-Object -FilePath  C:\dev\06\powershell\events1.txt
Get-Process notepad
## save into varialbe proc
Get-Process notepad| Tee-Object -Variable proc | Select-object ProcessName, handles


## output file send output to a file
Get-ChildItem C:\dev\06\powershell -File -System -Recurse
Get-ChildItem . -File -System -Recurse|Tee-Object -FilePath C:\dev\06\powershell\events.txt -Append | Out-File C:\dev\06\powershell\events1.txt

##select object rando only
1..10 | Get-Random
1..10 | Get-Random -Count 3










