@echo off

Set "EmuInstDir=%ProgramData%\HieuGLLite"
Set "Bin=%EmuInstDir%\Bin"
Set "Temp=%EmuInstDir%\Temp"
Set "Download=%EmuInstDir%\Download"
Set "Emulator=%EmuInstDir%\Emulator"
set "DL=%Bin%\Download.exe"
set "Inst=%Bin%\Install.exe"
set "EmuInst=%EmuInstDir%\EmuInst.exe"

echo Please wait...
%DL% getdata
if exist %EmuInst% goto :Start
if not exist %EmuInst% goto :404 

:Start
%EmuInst% %1
goto :EOF

:404
Echo File not found :(

:EOF