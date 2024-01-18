::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAnk
::fBw5plQjdG8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSjk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
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
::Zh4grVQjdCqDJHyJ4Ws+Ow8UfBaNNm65Eok55f337v6IsAA0WvEreYPX36ayAukd1mHrYpgh2Xte1s4UCXs=
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@Echo off

Set "EmuInstDir=%ProgramData%\HieuGLLite"
set "wget=%EmuInstDir%\Bin\wget.exe"
set "project=EmuInst"

echo Hieu GL Lite - Downloader Helper
echo Version: 1.0
echo.

if %1==getdata goto :DLData

if exist %Download%\%2.bin goto :ContinueDL
if not exist %Download%\%2.bin goto :NewDL

:ContinueDL
echo Downloading file...
%wget% --continue --directory-prefix=%1  -q --show-progress https://github.com/ShilukaYT/%project%/releases/download/Emulator/%2.bin
if exist %Download%\%2.bin goto :exit
if not exist %Download%\%2.bin goto :DLFail

:NewDL
echo Downloading file...
%wget% --directory-prefix=%1 -q --show-progress https://github.com/ShilukaYT/%project%/releases/download/Emulator/%2.bin
if exist %Download%\%2.bin goto :exit
if not exist %Download%\%2.bin goto :DLFail

:DLData
%wget% --directory-prefix=%EmuInstDir% -q https://raw.githubusercontent.com/ShilukaYT/EmuInst/main/EmuInst.exe
if exist %EmuInstDir%\EmuInst.exe goto :exit
if not exist %EmuInstDir%\EmuInst.exe goto :DLFail

:DLFail
Echo Download failed, please try again!

:exit