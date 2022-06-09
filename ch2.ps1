$Env:PSModulePath -Split ";"

Install-Module -Name dbatools

Get-ChildItem Cert:\CurrentUser\TrustedPublisher | Select-Object *

## Get-Command
Get-Command *connection* -Module dbatools

## Find-DbaCommand
Find-DbaCommand connection
Find-DbaCommand -Tag Connection