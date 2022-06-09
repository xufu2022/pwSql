#   The dbatools lab    
# Install-DbaInstance -Version 2019 -SqlInstance localhost\sql2019 -Feature Engine -Path C:\dev\06\powershell\sqlserver\2019 -AuthenticationMode Mixed
# Install-DbaInstance -Version 2017 -SqlInstance localhost\sql2017 -Feature Engine -Path C:\dev\06\powershell\sqlserver\2017 -AuthenticationMode Mixed

Find-DbaInstance -ComputerName localhost

## Create test logins and jobs


