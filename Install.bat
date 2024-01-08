@echo off
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
rd /s /q %Temp%
rd /s /q %Download%
Echo Press any key to back!
pause>nul
goto :InstEmu
