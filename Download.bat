@Echo off

Set "EmuInstDir=%ProgramData%\HieuGLLite"
set "wget=%EmuInstDir%\Bin\wget.exe"
set "project=EmuInst"

echo Hieu GL Lite Downloader Helper
echo Version: 1.0

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

:DLFail
Echo Download failed, please try again!

:exit