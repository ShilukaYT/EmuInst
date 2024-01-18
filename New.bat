::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCqDJHWL801wI7ieQgy+LmSvCLEZ7KXy4aeXqkIJW/A6bJ3S2bXAKeMcig==
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSjk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpSI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCqDJHyJ4Ws+Ow8UfBaNNm65Eok55f337v6IsAA0WvEreYPX36ayBe0Gw0v3Ydgozn86
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983

::==========================================
:: Hieu GL Lite - EmuInst 1.0
:: Credit by Doan Van Hieu
::==========================================
:: Facebook: https://www.facebook.com/hieugllite/
:: Youtube: https://www.youtube.com/@HieuGLLite
::==========================================

@echo off
setlocal EnableExtensions EnableDelayedExpansion


cd /d %~dp0


:: Set variables
set "ver=1.0"

Set "EmuInstDir=%ProgramData%\HieuGLLite"
Set "Bin=%EmuInstDir%\Bin"
Set "Temp=%EmuInstDir%\Temp"
Set "Download=%EmuInstDir%\Download"
Set "Emulator=%EmuInstDir%\Emulator"
set "DL=%Bin%\Download.exe"
set "Inst=%Bin%\Install.exe"
set "BSTCleaner=%Bin%\BSTCleaner\BSTCleaner.exe"
Set "EmuIDInput=%1"
Set "No="
Set "Caution=Warning: Your Free Fire account will be banned for using this emulator!"


:Prepare
if not exist %Temp% md %Temp%
if not exist %Download% md %Download%
if not exist %Emulator% md %Emulator%

:Title
echo.
echo HieuGLLite - EmuInst
Echo Version: %ver%
echo.

net session >nul 2>&1
if %errorLevel% == 0 (
  goto :Run
) else (
  echo This application needs to run with administrator rights
  echo Please start Command Prompt with administrator rights and run again!
)
goto :EOF

:Run
Timeout /t 2 /nobreak>nul

if %EmuIDInput%==%No% goto 404
if %EmuIDInput%==717834 goto :717834
if %EmuIDInput%==526423 goto :526423
if %EmuIDInput%==206157 goto :206157
if %EmuIDInput%==841037 goto :841037
if %EmuIDInput%==386224 goto :386224
if %EmuIDInput%==876515 goto :876515
if %EmuIDInput%==383100 goto :383100
if %EmuIDInput%==547984 goto :547984
if %EmuIDInput%==257647 goto :257647

:404
Echo No matching ID found on the server, please try again
goto :EOF


::Set variables for Emulator

:206157
Set "EmuTitle=BlueStacks 5.20.0 Lite"
Set "EmuID=206157"
Set "oem=BlueStacks_nxt"
set "EmuType=Blue5"
set "OS=Nougat32"
goto :Check

:736168
Set "EmuTitle=BlueStacks 5.20.0 Lite GG"
Set "EmuID=736168"
Set "oem=BlueStacks_nxt"
set "EmuType=Blue5"
set "OS=Nougat32"
goto :Check

:526423
Set "EmuTitle=MSI 5.11 Pie64 Debloat"
Set "EmuID=526423"
Set "oem=BlueStacks_msi5"
set "EmuType=Blue5"
set "OS=Pie64"
goto :Check

:717834
Set "EmuTitle=MSI 5.11 Pie64 Debloat GG"
Set "EmuID=717834"
Set "oem=BlueStacks_msi5"
set "EmuType=Blue5"
set "OS=Pie64"
goto :Check

:841037
Set "EmuTitle=BlueStacks 5.13.200 Debloat GG"
Set "EmuID=841037"
Set "oem=BlueStacks_nxt"
set "EmuType=Blue5"
set "OS=Pie64"
goto :Check

:386224
Set "EmuTitle=BlueStacks 5.13.200 Debloat"
Set "EmuID=386224"
Set "oem=BlueStacks_nxt"
set "EmuType=Blue5"
set "OS=Pie64"
goto :Check

:876515
Set "EmuTitle=MSI Lite v5.11 GG"
Set "EmuID=876515"
Set "oem=BlueStacks_msi5"
set "EmuType=Blue5"
set "OS=Nougat32"
goto :Check

:383100
Set "EmuTitle=MSI Lite v5.11"
Set "EmuID=383100"
Set "oem=BlueStacks_msi5"
set "EmuType=Blue5"
set "OS=Nougat32"
goto :Check


:547984
Set "EmuTitle=BlueStacks 5.13.0 Lite GG"
Set "EmuID=547984"
Set "oem=BlueStacks_nxt"
set "EmuType=Blue5"
set "OS=Nougat32"
goto :Check


:257647
Set "EmuTitle=BlueStacks 5.13.0 Lite"
Set "EmuID=257647"
Set "oem=BlueStacks_nxt"
set "EmuType=Blue5"
set "OS=Nougat32"
goto :Check


:Caution
Echo %Caution%
Echo.
goto :AskInstall

::Ask Install

:Check
Echo Selected emulator: %EmuTitle%
Echo.

if %EmuID%==717834 goto :Caution
if %EmuID%==526423 goto :Caution

:AskInstall
Echo Do you want to install %EmuTitle%?
Set /p "InstChoice=[1] Yes | [2] No | Enter your choice: "

if %InstChoice%==1 goto :Install
if %InstChoice%==2 goto :EOF

goto :AskInstall

::Install Emulator
:Install

Timeout /t 2 /nobreak>nul

echo.
%DL% %Download% %EmuID%
if exist %Download%\%EmuID%.bin goto :next
if not exist %Download%\%EmuID%.bin goto :EOF

:next
echo.
%Inst% %EmuID% %oem% %OS%
goto :exit


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

:MissFiles
echo Missing files detected, please reinstall!
goto :Quit



:exit
rd /s /q %Temp%

:EOF
