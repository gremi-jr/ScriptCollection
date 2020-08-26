Set-ExecutionPolicy AllSigned

#Installed Choco
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#VS Code
choco install vscode -y
#Reload Path
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 

#Code Extensions
code --install-extension ms-dotnettools.csharp
code --install-extension donjayamanne.githistory
code --install-extension james-yu.latex-workshop
code --install-extension ritwickdey.liveserver
code --install-extension davidanson.vscode-markdownlint
code --install-extension ms-vscode.powershell
code --install-extension ms-python.python
code --install-extension ms-vscode-remote.remote-wsl
code --install-extension ban.spellright
code --install-extension alireza94.theme-gotham


choco install visualstudio2019community -y

choco install notepadplusplus -y

choco install firefox -y

choco install thunderbird -y

choco install steam -y

choco install keepass -y

choco install git -y

choco install discord -y 

choco install vmwareworkstation -y

choco install boxcryptor -y

choco install miktex -y

choco install notion -y

choco install gitkraken -y

choco install wox -y
 
#Create Shortcut to Desktop
choco install cmder -y
$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$Home\Desktop\Cmder.lnk")
$Shortcut.TargetPath = "C:\tools\Cmder\Cmder.exe"
$Shortcut.Save()

#Setting up path enviroment for my scripts
[Environment]::SetEnvironmentVariable("Path", $env:Path + ";E:\2_Computer\Projekte\ScriptCollection\Batch", "User")
[Environment]::SetEnvironmentVariable("Path", $env:Path + ";E:\2_Computer\Projekte\ProjectInitializationAutomation\windows_OS", "User")