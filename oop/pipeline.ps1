Get-Process chro* 

# Get-Process chro* | Stop-Process

Get-Process | Out-Default | Out-Host

Get-ChildItem -Path *.txt
Get-ChildItem -Path *.txt | Where-Object {$_.Length -gt 1000000} | Sort-Object -Property Length | Format-Table -Property name, Length