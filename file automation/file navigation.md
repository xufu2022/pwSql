# Dealing with path

## Absolute and Relative path

relative path depends on current directory, easy to work with, its parent directory should be set as current working directory, or its path should be set as variable in system

resolve-path: commonly used to convert relative path into absolute path manually

-   .   current directory
-   ..  parent directory
-   \   root directory
-   ~   Home directory

# Join path

combine a path and child path into a single path

        Join-Path -Path "path" -ChildPath "childPath"
        Join-Path -Path "path" -ChildPath "childPath" -resolve

# Split-path

return specified part of a Path

-   -Path   specifies the path to be Split
-   -LiteralPath    is same as -Path but unlike -Path: 
    -   wild char are not accepted
-   -leaf   get topmost file/folder name in the mentioned Path
-   -parent get only the parent containers of the item 
    -   default parameter, so can be omitted
-   -isAbsolute may find if path  is relative or absolute (absolute true, relative false)



    Split-path -Path ".\*.txt" -leaf resolve
    Split-path -LiteralPath ".\file1.txt" resolve

## Qualifier parameter 

    used to get only the  drive/qualifier of a Path

## NoQualifier

    used to get the path without the qualifier

# Test & Convert paths

Test-Path
-   whether all elements of a path exists
-   whether the path syntax is valid
-   whether the path leads to a container or a terminator or leaf elements
    -   -Path   species the paths to be splited 
                -   Wild char are accepted
    -   -LiteralPath same as path but unlike -path
                -   wild char not accepted
-   Use -Include, -Exclude and -Filter parameter to limit the coverage of wild chaded Path
-   -Filter applies filter before fetching result. so comparatively faster the Exclude and include parameter
-   -IsValid paremeter may be used to test the syntax of the Path
-   -NewerThan or -OlderThan switch is used a time filter
-   -PathType parameter used to know whether the final element in the path is of a particular type or not. The could be 
        -   Container   -directory or registry
        -   leaf    -   Files
        -   Any     -   Leaf or Container
-   Convert-Path converts a path from a powershell path to a poweshell provider Path


Test-Path -Path .\file.txt
Test-Path -Path .\* -Exclude *.txt
Test-Path -Path .\* -include *.txt
Test-Path -Path .\* -filter *.txt
Test-Path -Path .\file.txt -pathType any


# powershell providers and drives

-   treats different data source as data stores
-   some examples of such data source are 
    -   File system
    -   Registry
    -   Functions
    -   Enviroment
    -   Variable

powershell providers 
-   .net programs
-   provide access to specialized data sources for easier viewing and management
-   enables a special set of cmdlets to access data stores
-   Get-PSProvider list providers on your computer

Get-PSDrive lists drives for all ps providers by default

        Get-PSDrive -PSProvider Registry
        Get-PSDrive -PSProvider FileSystem

New-PSDrive used to create custom psdrive my be createdd to specified location
PSDrive may be creatd to specified location


    New-PSDrive -Name InstalledSoftware -PSProvider Registry -Root HKLM:\So......

#   Dealing with working directory

What is location & its importance

-   Curent location is one, that we see in command prompt, just before cursor
-   also known as current/Present working directory
-   By default, powershell assumes , items that we are working on in current location/directory

        Get-childItem
        Get-childItem -Path c:
-   Get-Location tells the curernt working location
-   Set-Location set the current working loation to a specified location
    change location avoid typing absolute path for items located in specifed location

-   sl, cd and chdir are alais for set-location

        Set-Location (12) - -> sl(2)
-   Push-location used to save current location path for later use
    helpful in performing task that forces you to temporily leave your current directory
    Pushd is an alais for push-location
-   Pop-Location is used to get back location path, preserved using push-location
    popd is an alais for pop-location










