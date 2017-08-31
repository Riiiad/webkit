@echo off
:SuperAsk
echo ===================================================
echo Be sure to run this as Admin.
echo With yes you will install Chocolatey, Node(Lastest), Atom with not questions asked...
echo With no you will have a Step-by-Step guide where you can install Node(Stable or Latest Beta), Yarn, Atom, VisualStudio Code and Cmder.
echo How would you like to continue y/n?
echo ===================================================
set INPUT=
set /P INPUT=Type input: %=%
If /I "%INPUT%"=="y" goto superyes
If /I "%INPUT%"=="n" goto superno
:superyes
echo Install Chocolatey, Node(Lastest), Atom...:
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
choco install -y nodejs.install
choco install -y atom
goto exit
:superno
echo OK
pause
goto Ask

::::::::::::::::::::::::::::::::::::::::::::::::::
:Ask
echo Would you like to install Chocolatey it is a must to continue y/n?
set INPUT=
set /P INPUT=Type input: %=%
If /I "%INPUT%"=="y" goto yes
If /I "%INPUT%"=="n" goto no
:yes
echo Installing Chocolatey:
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
goto Ask2
:no
echo Shame the the installation is going to exit now...
pause
goto superexit

::::::::::::::::::::::::::::::::::::::::::::::
:Ask2
echo Would you like to install Nodejs (S)table or Latest (B)eta?(S/B)
set INPUT=
set /P INPUT=Type input: %=%
If /I "%INPUT%"=="s" goto stablenode
If /I "%INPUT%"=="b" goto betanode
:stablenode
echo Here is the stable version of node
choco install -y nodejs-lts
goto Ask3
:betanode
echo Here is the lastest version of node
choco install -y nodejs.install
goto Ask3

::::::::::::::::::::::::::::::::::::::::::::::
:Ask3
echo Would you like to install Yarn yes/no?(y/n)
set INPUT=
set /P INPUT=Type input: %=%
If /I "%INPUT%"=="y" goto yarnyes
If /I "%INPUT%"=="n" goto yarnno
:yarnyes
echo Installing Yarn:
choco install -y yarn
goto Ask5
:yarnno
echo *******************************************
pause
goto Ask5
::::::::::::::::::::::::::::::::::::::::::::::
:Ask5
echo Would you like to install Atom yes/no?(y/n)
set INPUT=
set /P INPUT=Type input: %=%
If /I "%INPUT%"=="y" goto atomyes
If /I "%INPUT%"=="n" goto atomno
:atomyes
echo Installing Atom from Atom.io...
choco install -y atom
goto Ask6
:atomno
echo *******************************************
goto Ask6

::::::::::::::::::::::::::::::::::::::::::::
:Ask6
echo Would you like to install VisualStudio Code yes/no?(y/n)
set INPUT=
set /P INPUT=Type input: %=%
If /I "%INPUT%"=="y" goto vsyes
If /I "%INPUT%"=="n" goto vsno
:vsyes
echo Installing VSCode...
choco install -y visualstudiocode
goto Ask7
:vsno
echo *******************************************
goto Ask7

:::::::::::::::::::::::::::::::::::::::::::::
:Ask7
echo Would you like to install Cmder yes/no?(y/n)
set INPUT=
set /P INPUT=Type input: %=%
If /I "%INPUT%"=="y" goto cmderyes
If /I "%INPUT%"=="n" goto cmderno
:cmderyes
echo Installing Cmder...
choco install -y Cmder
:cmderno
goto exit
:exit
echo Everything has been installed, have fun hacking ;)
TIMEOUT /T 10
exit
:superexit
exit
