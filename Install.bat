@echo off
::Prepare vartiable

Set "EmuInstDir=%ProgramData%\HieuGLLite"
Set "Download=%EmuInstDir%\Download"
Set "Bin=%EmuInstDir%\Bin"
Set "Emulator=%EmuInstDir%\Emulator"
Set "SetupTemp=%Temp%\Setup"
set "uzip=%Bin%\7za.exe"
Set "Temp=%EmuInstDir%\Temp"
set "Pass1=HieuGLLite_EmuInst"

set "EmuID=%1"
set "oem=%2"
set "OS=%3"
set "EmuTitle=%4"
set "SizeKB=%5"

if exist %Download%\%EmuID%.bin goto :Start
if not exist %Download%\%EmuID%.bin goto :404


:Start

echo Extracting files...
md %SetupTemp%
%uzip% x %Download%\%EmuID%.bin -o%Temp% -p"%Pass1%" -aoa>nul
%uzip% x %Temp%\Setup.7z -o%SetupTemp% -p"%Pass1%" -aoa>nul
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

if errorlevel 2 goto :Quit
if errorlevel 1 goto Cleanup_Launch

:Cleanup_Launch
Start %ProgramFiles%\%oem%\HD-Player.exe --instance %OS%
goto :Quit


:InstallFail
Echo Installation failed, please check your hardware or software
pause>nul
goto :Quit

:404
echo Installation failed!
echo The requested file was not found
goto :Quit

:Quit