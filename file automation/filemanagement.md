# File and folder provisioning

item provisioning may be needed for various purposes like
-   Files can be created to store different type of info
-   directories can be created to manage these files

-   New-Item command used to create files, folders and registry entry, hard link etc
    -   ni is the alais
-   Creation types depend on location/provider, like whether it is filesystem, registry , or any other ps provider

        Registry    ->  Registry keys
        FileSystem  ->  files/folders

        new-item -path . name "file1.txt"
        new-item -path HkLM:\sof.....
-   -ItemType is used to defind the type of Item, could be
    -   File
    -   directory
    -   SymbolicLink
    -   Junction
    -   HardLink

-   Confirm used to give a confirmation prompt before running the cmdlet

        New-Item -path . -Name "withoutconfirmation.txt" -Confirm

-   Name and Path parameter
    -   name may contain path and vice versa

-   Value paremeter used to set content of newly created item like file
        New-Item -path . -Name "withoutconfirmation.txt" -ItemType "file" -Value "this is a text string"

-   Force used to create intermediate directories, incase not exist or orerwriting files


#   List files and directories

    Get-ChildItem used to get items and child items in specified Path (gci, dir, ls are alais)

        Get-ChildItem -Path .
        Get-ChildItem -Path .\dir*
        Get-ChildItem -Path HKLM:
        Get-ChildItem -LiteralPath "C:\dev\06\powershell\pwSql\file automation\playground"
        Get-ChildItem -Path .\dir*\dir*\dir* -Recurse -Filter *.log
        Get-ChildItem -Path . -File
        Get-ChildItem -Path . -Directory
        Get-ChildItem -Path . -Recurse -Force (to get items that cannot be accessed by the user like hidden or system file)

        Get-ChildItem -Path . -Depth 2 (1 level down without current)

    Mode=>  darhsl (a->archive, l->link , s->system, h-> hidden, d->directories)

        Get-ChildItem . -Attributes hidden
        Get-ChildItem . -Attributes Directory
        Get-ChildItem . -Attributes !Directory+!System //(NAO !+,)

        Set-ItemProperty -Path .\file1.txt -name isReadOnly -value $true -PassThru
        Copy-Item -path .\file3.txt -Destination .\dir2
        Rename-Item -Path ".\file1.txt" -newName ".\Renamed-File1.txt" -PassThru -Confirm -WhatIf

WhatIf : show what would happen if the cmdlet runs, without running it actually
















    
        



        
