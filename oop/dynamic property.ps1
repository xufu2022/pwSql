# Dynamic Property

New-Object psobject -Property @{a=1}
New-Object psobject -Property @{a=1} |Get-Member
[PSCustomObject]@{
    a1 = 1
} | Get-Member

$o= ' '| Select-Object a,B
$o |gm
$o.GetType()

$objps=[PSCustomObject]@{
    Name = 'powershell'
}
$objps

$objps | Add-Member NoteProperty Version 5
$objps

# getter and Setter
$getter={$this.version} 
$getter
&$getter

$setter={
    $arg=$args[0]
    if($arg -gt 7 -or $arg -lt 1)
    {throw 'this proerty only take 1 .. 7'}
    $this.version=$arg
}

$objps | Add-Member ScriptProperty PSVersion -Value $getter -SecondValue $setter
$objps | gm

$objps.PSVersion
$objps.PSVersion=9
$objps.PSVersion=2
