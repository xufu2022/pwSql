# Powershell with Sql server

dbatools

-   Set-ExecutionPolicy
-   Set-PSRepository

https://docs.microsoft.com/en-us/powershell/scripting/windows-powershell/wmf/overview?view=powershell-7.2
https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell?view=powershell-7.2

## SQL WMI

the protocol used by the SQL Server Configuration Manager. SQL Server Configuration Manager—and SQL WMI by extension

-   $Env:PSModulePath: This environment variable tells PowerShell where to look for available commands

### Trusting the PowerShell Gallery

Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
