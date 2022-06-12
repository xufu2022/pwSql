# .net and com object

$ps=New-Object System.Text.StringBuilder 'Power'
$ps

$ps.Append('Shell')

$ps.ToString()
$ps | Get-Member

$com=New-Object -ComObject shell.Application
$com | Get-Member

$com.FileRun()
$com.Windows() | Get-Member