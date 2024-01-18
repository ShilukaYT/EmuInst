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

Echo Hieu GL Lite - Installer Helper
Echo Version: 1.0
echo.

if exist %Download%\%EmuID%.bin goto :Start
if not exist %Download%\%EmuID%.bin goto :404


:Start

echo Extracting files...
md %SetupTemp%
%uzip% x %Download%\%EmuID%.bin -o%Temp% -p"%Pass1%" -aoa>nul
%uzip% x %Temp%\Setup.7z -o%SetupTemp% -p"%Pass1%" -aoa>nul
Echo Installing...
%SetupTemp%\BlueStacksInstaller.exe -s -PDDir=%Emulator%\%oem% -DefaultImageName=%OS% -ImageToLaunch=%OS% -parentpath=%Temp%\Setup.7z

if not exist %ProgramFiles%\%oem%\Assets\%EmuID% goto :InstallFail
if exist %ProgramFiles%\%oem%\Assets\%EmuID% goto :Done

:Done

Echo Installed successfully!
echo Do you want to launch?
choice /c:12 /n /m "[1] Yes | [2] No | Enter your choice: "

if errorlevel 2 goto :Quit
if errorlevel 1 goto Cleanup_Launch

:Cleanup_Launch
Start "" "%ProgramFiles%\%oem%\HD-Player.exe" --instance %OS%
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