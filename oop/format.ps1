# Format

## output

Get-Process
Get-Process | Where-Object Handles -gt 1000 | sort Handles | select name, handles
(Get-Process | gm -MemberType *property*).Count

## property set
$ps= Get-Process

$ps.GetType()
$ps[0]

$ps[1..5]

$ps | select PSConfiguration
$ps | select PSResources

$ps | Add-Member -MemberType PropertySet  -Name Foo -Value "name","Path", "fileVersion"

$ps | Select-Object Foo

$ps | Add-Member -MemberType PropertySet  -Name Foo -Value "name","Path","CPU", "fileVersion" -Force

$ps | Select-Object Foo

$ps | gm

## convert object to string

$ps | Add-Member -MemberType ScriptProperty -Name Foobar -Value {$this.name.toupper()}
$ps.Name
$ps | select name, Foobar

## Format files
cd $PSHOME
ls *format*

#Update-FormatData -PrependPath '..psxml'
Get-FormatData
Get-FormatData -TypeName $ps[0].pstypenames[0]
$x=Get-FormatData -TypeName $ps[0].pstypenames[0]
$x.FormatViewDefinition.control
$x.FormatViewDefinition.control.headers

## format and output as table, list and wide
Get-Process | Format-Table name, Path
Get-Process | Format-List name, Path
Get-Process | Format-Wide -Property Handles -AutoSize
Get-Process | Format-Wide -Property Handles -Column 3
Get-Process | Format-Custom name, path

Get-Service | Format-Wide -Property name -Column 5


