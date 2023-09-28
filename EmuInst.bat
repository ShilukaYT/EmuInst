
::==========================================
:: Hieu GL Lite - Emulator Installer 1.0
:: Credit by Doan Van Hieu
::==========================================
:: Facebook: https://www.facebook.com/hieugllite/
:: Youtube: https://www.youtube.com/@HieuGLLite
::==========================================

@echo off

setlocal EnableExtensions EnableDelayedExpansion

Set "Title=Emulator Installer (Beta)"

mode 100,30
cd /d %~dp0
Title %Title%

:: Set variables
Set "EmuInstDir=%ProgramData%\HieuGLLite"
Set "Dism=%SystemRoot%\System32\dism.exe"
Set "Bin=%EmuInstDir%\Bin"
Set "Temp=%EmuInstDir%\Temp"
Set "Download=%EmuInstDir%\github.com\ShilukaYT\Emulator-Installer\releases\download\Emulator"
Set "Emulator=%EmuInstDir%\Emulator"
Set "SetupTemp=%Temp%\Setup"
set "uzip=%Bin%\7za.exe"
set "wget=%Bin%\wget.exe"
set "BSTCleaner=%Bin%\BSTCleaner\BSTCleaner.exe"
Set "BS4_Dir=%ProgramFiles%\BlueStacks"
Set "BS5_Dir=%ProgramFiles%\BlueStacks_nxt"
Set "MSI4_Dir=%ProgramFiles%\BlueStacks_msi2"
Set "MSI5_Dir=%ProgramFiles%\BlueStacks_msi5"
Set "Line====================================================================================================="


:Prepare
if not exist %EmuInstDir% md %EmuInstDir%
if not exist %Bin% md %Bin%
if not exist %Temp% md %Temp%
if not exist %Download% md %Download%
if not exist %Emulator% md %Emulator%
if not exist %Bin%\7za.exe goto :MissFiles



goto :Home
:: Create UI
:Home
cls
color 0f
echo %Line%
echo                                Hieu GL Lite - Emulator Installer
echo                                      Made by Hieu GL Lite
echo %line%
echo [1] Install Emulator
echo [2] Uninstall Emulator
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo [3] Visit my website!
echo [4] Subscribe to Hieu GL Lite
echo [5] Follow my Facebook
echo %line%
echo Binary Version: 1.0
echo Code Version: 1.0
echo.
echo %line%
echo [X] Exit
echo %line%
choice /c:12345X /n /m "Enter your choice: "

if errorlevel 6 exit /b
if errorlevel 5 goto :RedirectFacebook
if errorlevel 4 goto :RedirectYoutube
if errorlevel 3 goto :RedirectWebsite
if errorlevel 2 goto :UnisEmu
if errorlevel 1 goto :InstEmu

::UI of Install Emulator
:InstEmu
cls
echo %Line%
echo                                Hieu GL Lite - Emulator Installer
echo                                      Made by Hieu GL Lite
echo %line%
echo Please select the emulator you want to install!
echo.
echo BlueStacks 5.13.0 [0] Lite [1] Lite GG
echo MSI Lite v5.11    [2] Lite [3] Lite GG
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo %line%
echo [X] Return
echo %line%
Choice /c:0123X /n /m "Enter your choice: "

if errorlevel 5 goto :Home
if errorlevel 4 goto :Home
if errorlevel 3 goto :Home
if errorlevel 2 goto :Home
if errorlevel 1 goto :Blue5_13_Lite


::Set variables for Emulator
:Blue5_13_Lite
Set "EmuTitle=BlueStacks 5.13.0 Lite"
Set "EmuID=257647"
Set "oem=BlueStacks_nxt"
set "EmuName=Blue5"
set "OS=Nougat32"
Set "SizeKB=2520023"
goto :AskInstall


::Install Emulator

:AskInstall
cls
echo %Line%
echo                                Hieu GL Lite - Emulator Installer
echo                                      Made by Hieu GL Lite
echo %line%
Echo Do you want to install %EmuTitle%?
Set /p "InstChoice=[1] Yes | [2] No | Enter your choice: "

if %InstChoice%==1 goto :Install
if %InstChoice%==2 goto :InstEmu

:Install
echo.
echo Downloading file...
%wget% -p %Download% -q --show-progress https://github.com/ShilukaYT/Emulator-Installer/releases/download/Emulator/%EmuID%.bin
if exist %Download%\%EmuID%.bin goto :Extract
if not exist %Download%\%EmuID%.bin goto :InstallFail
:Extract
echo Extracting files...
md %SetupTemp%
%uzip% x %Download%\%EmuID%.bin -o%Temp% -p"HieuGLLite_EmuInst" -aoa>nul
%uzip% x %Temp%\Setup.7z -o%SetupTemp% -p"HieuGLLite_EmuInst" -aoa>nul
Echo Installing %EmuTitle%
%SetupTemp%\BlueStacksInstaller.exe -s -PDDir=%Emulator%\%oem% -DefaultImageName=%OS% -ImageToLaunch=%OS% -parentpath=%Temp%\Setup.7z

if not exist %ProgramFiles%\%oem%\Assets\%EmuID% goto :InstallFail
if exist %ProgramFiles%\%oem%\Assets\%EmuID% goto :Config

:Config
echo.
echo Configuring %EmuTitle%
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\%oem% /v DisplayName /f>nul
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\%oem% /v DisplayName /t REG_SZ /d "%EmuTitle%">nul
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\%oem% /v EstimatedSize /f>nul
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\%oem% /v EstimatedSize /t REG_DWORD /d %SizeKB%>nul
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\%oem% /v Publisher /f>nul
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\%oem% /v Publisher /t REG_SZ /d "Hieu GL Lite">nul
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\%oem% /v HelpLink /f>nul
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\%oem% /v HelpLink /t REG_SZ /d "https://sites.google.com/view/hieugllite">nul
echo.
Echo Installed successfully!
echo Do you want to launch?
choice /c:12 /n /m "[1] Yes | [2] No | Enter your choice: "

if errorlevel 2 goto Finish
if errorlevel 1 goto Cleanup_Launch

:Cleanup_Launch
echo Cleaning Up...
rd /s /q %Temp%
rd /s /q %Download%
Start %ProgramFiles%\%oem%\HD-Player.exe --instance %OS%
goto :InstEmu

:Finish
echo Cleaning Up...
rd /s /q %Temp%
rd /s /q %Download%
goto :InstEmu


:InstallFail
Echo Installation failed, please check your hardware or software
echo If you use Hyper-V, please disable it in Windows Features
Echo (Windows + S, type Windows Features and press Enter)
rd /s /q %Temp%
rd /s /q %Download%
Echo Press any key to back!
pause>nul
goto :InstEmu


::UI of Uninstall Emulator
:UnisEmu
cls
echo %Line%
echo                                Hieu GL Lite - Emulator Installer
echo                                      Made by Hieu GL Lite
echo %line%
echo Please select the emulator you want to uninstall!
echo.
echo [1] BlueStacks 5
echo [2] MSI App Player 5
echo [3] BlueStacks 4
echo [4] MSI App Player 4
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo %line%
echo [X] Return
echo %line%
choice /c:1234X /n /m "Enter your choice: "

if errorlevel 5 goto :Home
if errorlevel 4 goto :SetVariables_MSI4
if errorlevel 3 goto :SetVariables_Blue4
if errorlevel 2 goto :SetVariables_MSI5
if errorlevel 1 goto :SetVariables_Blue5

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
cls
echo %Line%
echo                                Hieu GL Lite - Emulator Installer
echo                                      Made by Hieu GL Lite
echo %line%
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


:exit
rd /s /q %Temp%
rd /s /q %Download%
del /s /q %EmuInstDir%\EmuInst.bat
exit /b