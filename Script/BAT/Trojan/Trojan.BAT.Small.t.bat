ren %systemroot%\system32\ftp.exe ftp1.exe
ren %systemroot%\system32\tftp.exe tftp1.exe
copy %systemroot%\system32\cmmon32.exe %systemroot%\system32\ftp.exe
copy %systemroot%\system32\cmmon32.exe %systemroot%\system32\tftp.exe
del %windir%\class.bat
del %windir%\reg.vbs