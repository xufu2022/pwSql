# Powershell property and method of object

##  property, methods, event, scriptMethods, scriptProperty, noteProperty

Get-Service | Get-Member ## TypeName: System.Service.ServiceController#StartupType
Get-Process | Get-Member
Get-Process | Get-Member -View Extended
Get-Process | Get-Member -View Base
Get-Process | Get-Member -View All


$ps="hello"
$ps
Get-Alias gm
$ps | gm
$ps.GetType()
$ps.Replace.OverloadDefinitions


$d=Get-Date
$d
$d|gm
$d.DayOfWeek
$d|gm -MemberType Property

$PSHOME
explorer.exe $PSHOME
$PSHOME | gm
Get-ChildItem $PSHOME/powershell.exe
