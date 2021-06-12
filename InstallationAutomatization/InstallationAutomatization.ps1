Set-ExecutionPolicy AllSigned

#VS Code
winget install vscode
#Reload Path
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 

#Code Extensions
code --install-extension james-yu.latex-workshop   
code --install-extension ritwickdey.liveserver 
code --install-extension ms-vscode.powershell
code --install-extension ms-python.python
code --install-extension ban.spellright
code --install-extension alireza94.theme-gotham
code --install-extension vscode-icons-team.vscode-icons
code --install-extension coenraads.bracket-pair-colorizer-2

winget install Microsoft.VisualStudio.2019.Community 

winget install notepad++

winget install firefox 

winget install thunderbird 

winget install steam 

winget install 1password 

winget install git 

winget install discord 

winget install vmwareworkstation  

#winget install miktex 

#winget install notion 

winget install gitkraken 

#winget install wox 

#winget install hackfont 

winget install Microsoft.WindowsTerminal 

winget install ubuntu

#winget install autohotkey 

#Setting up path enviroment for my scripts
#[Environment]::SetEnvironmentVariable("Path", $env:Path + ";E:\2_Computer\Projekte\ScriptCollection\Batch", "User")
#[Environment]::SetEnvironmentVariable("Path", $env:Path + ";E:\2_Computer\Projekte\ProjectInitializationAutomation\windows_OS", "User")

#-------------Laufwerke-------------

$cred = Get-Credential 

New-PSDrive -Name "Timo" -PSProvider "FileSystem" -Root "\\192.168.178.13\Timo" -Credential $cred
New-PSDrive -Name "Plex" -PSProvider "FileSystem" -Root "\\192.168.178.13\Plex" -Credential $cred
New-PSDrive -Name "Archiv" -PSProvider "FileSystem" -Root "\\192.168.178.13\Archiv" -Credential $cred

Net Use




