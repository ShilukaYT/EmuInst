
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
Echo Do you want to install %EmuTitle%?
Set /p "InstChoice=[1] Yes | [2] No | Enter your choice: "

if %InstChoice%==1 goto :Install
if %InstChoice%==2 goto :InstEmu

:Install
cls
echo %Line%
echo                                Hieu GL Lite - Emulator Installer
echo                                      Made by Hieu GL Lite
echo %line%
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
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\%oem% /v DisplayName /f
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\%oem% /v DisplayName /t REG_SZ /d "%EmuTitle%"
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\%oem% /v EstimatedSize /f
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\%oem% /v EstimatedSize /t REG_DWORD /d %SizeKB%
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\%oem% /v Publisher /f
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\%oem% /v Publisher /t REG_SZ /d "Hieu GL Lite"
reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\%oem% /v HelpLink /f
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\%oem% /v HelpLink /t REG_SZ /d "https://sites.google.com/view/hieugllite"
echo.
Echo Installed successfully!
echo Do you want to launch?
choice /c:12 /n /m "[1] Yes | [2] No | Enter your choice: "

if errorlevel 2 goto Finish
if errorlevel 1 goto Cleanup_Launch

:Cleanup_Launch
echo Cleaning Up...
call :Cleanup
Start %ProgramFiles%\%oem%\HD-Player.exe --instance %OS%
goto :InstEmu

:Finish
echo Cleaning Up...
call :Cleanup
goto :InstEmu


:InstallFail
Echo Installation failed, please check your hardware or software
echo If you use Hyper-V, please disable it in Windows Features
Echo (Windows + S, type Windows Features and press Enter)
call :cleanup
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
if errorlevel 4 
if errorlevel 3 
if errorlevel 2 
if errorlevel 1

:SetVariables_Blue5
Set "EmuTitle=BlueStacks 5"
Set "oem= nxt"

:SetVariables_Blue4
Set "EmuTitle=BlueStacks 4"
Set "oem= bgp"

:SetVariables_MSI5
Set "EmuTitle=MSI App Player 5"
set "oem= msi5"

:SetVariables_MSI4
Set "EmuTitle=MSI App Player 4"
set "oem= msi2"

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

:Cleanup
rd /s /q %Temp%
rd /s /q %Download%

:exit
call :Cleanup
del /s /q %EmuInstDir%\EmuInst.bat
exit /b