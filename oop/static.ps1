# Static class and methods

## Data and Math
[System.DateTime]:: Today
[System.Math]:: PI

[System.DateTime] | gm -Static

$rad=10
$area=[System.Math]::Pow($rad,2) * 5

[System.AppDomain]::CurrentDomain.GetAssemblies() | foreach gettypes | select -First 40