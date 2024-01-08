
::==========================================
:: Hieu GL Lite - Emulator Installer 1.0
:: Credit by Doan Van Hieu
::==========================================
:: Facebook: https://www.facebook.com/hieugllite/
:: Youtube: https://www.youtube.com/@HieuGLLite
::==========================================

@echo off


cd /d %~dp0

:: Set variables
Set "EmuInstDir=%ProgramData%\HieuGLLite"
Set "Bin=%EmuInstDir%\Bin"
Set "Temp=%EmuInstDir%\Temp"
Set "Download=%EmuInstDir%\Download"
Set "Emulator=%EmuInstDir%\Emulator"
set "DL=%Bin%\Download.exe"
set "Inst=%Bin%\Install.exe"
set "BSTCleaner=%Bin%\BSTCleaner\BSTCleaner.exe"

:Title
echo.
echo Hieu GL Lite - Emulator Installer
Echo Version: 1.0
echo.


::Check arg
if %1==install goto :Install



:Install
if %2==383100 goto :383100
if %2==257647 goto :257647

:Prepare
if not exist %Temp% md %Temp%
if not exist %Download% md %Download%
if not exist %Emulator% md %Emulator%
if not exist %Bin%\7za.exe goto :MissFiles

::Set variables for Emulator
:383100
Set "EmuTitle=MSI Lite v5.11"
Set "EmuID=383100"
Set "oem=BlueStacks_msi5"
set "EmuName=Blue5"
set "OS=Nougat32"
Set "SizeKB=2384896"
goto :AskInstall

:257647
Set "EmuTitle=BlueStacks 5.13.0 Lite"
Set "EmuID=257647"
Set "oem=BlueStacks_nxt"
set "EmuName=Blue5"
set "OS=Nougat32"
Set "SizeKB=2520023"
goto :AskInstall

::Ask Install
:AskInstall
Echo Do you want to install %EmuTitle%?
Set /p "InstChoice=[1] Yes | [2] No | Enter your choice: "

if %InstChoice%==1 goto :Install
if %InstChoice%==2 goto :Quit

::Install Emulator
:Install
echo.
%DL% %Download% %EmuID%
if exist %Download%\%EmuID%.bin goto :next
if not exist %Download%\%EmuID%.bin goto :Quit

:next
%Inst% %EmuID% %oem% %OS% %EmuTitle% %SizeKB%
if not exist %ProgramFiles%\%oem%\Assets\%EmuID% goto :Quit
if exist %ProgramFiles%\%oem%\Assets\%EmuID% goto :open


:SetVariables_Blue5
Set "EmuTitle=BlueStacks 5"
Set "oem= nxt"
goto :AskUninstall

:SetVariables_Blue4
Set "EmuTitle=BlueStacks 4"
Set "oem= bgp"
goto :AskUninstall

:SetVariables_MSI5
Set "EmuTitle=MSI App Player 5"
set "oem= msi5"
goto :AskUninstall

:SetVariables_MSI4
Set "EmuTitle=MSI App Player 4"
set "oem= msi2"
goto :AskUninstall

::Uninstall Emulator

:AskUninstall
Echo Do you want to uninstall %EmuTitle%?
Set /p "UninstChoice=[1] Yes | [2] No | Enter your choice: "

if %UninstChoice%==1 goto :Uninstall
if %UninstChoice%==2 goto :UnisEmu

:Uninstall
echo.
Echo Uninstalling %EmuTitle%
%BSTCleaner% -oem%oem%
goto UnisEmu


:RedirectYoutube
cls
start https://youtube.com/@HieuGLLite
goto :Home

:RedirectFacebook
cls
start https://facebook.com/hieugllite
goto :Home

:RedirectWebsite
cls
start https://sites.google.com/view/hieugllite
goto :Home

:open
start "%ProgramFiles%\%oem%\HD-Player.exe" --instance "%OS%"

:MissFiles
echo Missing files detected, please reinstall!

:exit
rd /s /q %Temp%

:Quit
